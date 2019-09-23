execute_sql <- function(connection,
                        file_path,
                        parameters = NA,
                        log_table = 'etl.run_log',
                        quit_on_error = FALSE,
                        batch_separator = '\\bGO\\n'){
    
    assertthat::assert_that(odbc::dbIsValid(connection), msg = 'Not a valid database connection.')
    assertthat::assert_that(file.exists(file_path), msg = 'SQL script does not exist at specified file path.')
    assertthat::assert_that(is.character(readr::read_file(file_path)), msg = 'File is not a valid SQL script.')
    assertthat::assert_that(is.list(parameters), msg = 'Parameters are not a valid list object.')
    assertthat::assert_that(length(names(parameters)) == length(parameters), msg = 'Not all parameters are named.')
    
    
    if(!is.na(log_table)){
        log_schema <- stringr::str_replace(log_table, '(.*)(\\..*)', '\\1')
        log_tbl <- stringr::str_replace(log_table, '(.*\\.)(.*)', '\\2')
        assertthat::assert_that(DBI::dbExistsTable(con, DBI::Id(catalog = parameters[['database']], schema = log_schema, table = log_tbl)),
                                msg = 'Log table does not exist - Use NA as log_table argument to disable logging')
    }
    
    sql_script <- readr::read_file(file_path)
    
    names(parameters) <- paste0('@', names(parameters), '@')
    
    if(length(parameters) == 1){
      sql_script <- stringr::str_replace_all(sql_script, names(parameters), parameters[[1]])
    } else if(length(parameters) > 1){
        for(i in 1:length(parameters)){
          sql_script <- stringr::str_replace_all(sql_script, names(parameters)[i], parameters[[i]])
        }
    }
    
    sql_batches <- stringr::str_split(sql_script, batch_separator, simplify = TRUE)
    
    log_list <- list()
    
    log_start <- tibble::tibble(
      pid = paste0(Sys.info()["user"], '-', Sys.getpid(), '-', digest::sha1(Sys.Date())),
      script_name = stringr::str_extract(file_path, '[A-Za-z_]*\\.sql'),
      parameters = paste(purrr::map2_chr(names(parameters), purrr::flatten_chr(parameters), ~paste(.x, ' = ', .y)), collapse = ' | '),
      user_name = as.character(Sys.info()["user"])
    )
    
    batch_count <- length(sql_batches)
    
    for(i in 1:batch_count){
        
        tryCatch(
            {
                sql_script <- stringr::str_replace_all(sql_batches[[i]], '--.*\\n', '')
                sql_script <- stringr::str_replace_all(sql_script, '/\\*.*\\*/', '')
                
                job_name <- stringr::str_extract(sql_batches[[i]], '--.*\\n')
                job_name <- stringr::str_replace(job_name, '--', '')
                job_name <- stringr::str_replace(job_name, '\\n', '')
                
                batch_number <- i
                start_dtm <- Sys.time()
                
                duration <- system.time({
                    res <- DBI::dbExecute(connection, sql_script)
                })
                
                exit_status <- 0
                duration <- round(duration[3], 3)
                message <- stringr::str_replace_all(res, '\\n', ' | ')
                
            }, error = function(e){
                message <<- stringr::str_replace_all(conditionMessage(e), '\\n', ' | ')
                exit_status <<- 1
                duration <<- NA
                
            }, finally = {
                log_entry <- log_start
                log_entry$job_name <- job_name
                log_entry$batch_number <- batch_number
                log_entry$start_dtm <- start_dtm
                log_entry$exit_status <- exit_status
                log_entry$message <- as.character(message)
                log_entry$duration <- duration
                
                log_list[[i]] <- log_entry
                
                log_record <- dplyr::bind_rows(log_list[[i]])
                
                cat(paste(stringr::str_extract(file_path, '[A-Za-z_]*\\.sql'), '-', job_name, '-', 'batch', batch_number, '-', 'exit status =', exit_status, '\n'))
                
                tryCatch(
                    {
                        if(!is.na(log_table)){
                            DBI::dbWriteTable(con, DBI::Id(schema = log_schema, table = log_tbl), log_record, append = TRUE)
                        }
                        
                    }, error = function(err){
                        cat(paste('Could not write log record for batch number', i, 'to', log_table, '\n', conditionMessage(err), '\n'))
                    }
                )
                
               if(quit_on_error == TRUE){
                 assertthat::assert_that(exit_status == 0, msg = 'Error during ETL process. See etl.run_log for details')
               }
                
            }
        )

        log_records <- dplyr::bind_rows(log_list)
  
    }

    return(log_records)

}





