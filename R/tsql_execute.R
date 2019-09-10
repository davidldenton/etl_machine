tsql_execute <- function(connection,
                         file_path,
                         param_names = NA,
                         param_values = NA,
                         log_table = 'etl.run_log'){
  
  assertthat::assert_that(odbc::dbIsValid(connection), msg = 'Not a valid database connection')
  assertthat::assert_that(file.exists(file_path), msg = 'SQL script does not exist')
  assertthat::assert_that(is.character(readr::read_file(file_path)))
  assertthat::assert_that(length(param_names) == length(param_values), msg = 'The number of parameter names does not match the number of values')
  
  if(!is.na(log_table)){
    db_name <- param_values[match('@database', param_names)]
    log_schema <- stringr::str_replace(log_table, '(.*)(\\..*)', '\\1')
    log_tbl <- stringr::str_replace(log_table, '(.*\\.)(.*)', '\\2')
    assertthat::assert_that(odbc::dbExistsTable(con, DBI::Id(catalog = db_name, schema = log_schema, table = log_tbl)),
                            msg = 'Log table does not exist - Use NA as log_table argument to disable logging')
  }
  
  tsql <- readr::read_file(file_path)
  
  if(sum(is.na(param_names)) == 0 & length(param_names) == 1){
    tsql <- gsub(param_names, param_values, tsql)
  } else if(sum(is.na(param_names)) == 0 & length(param_names) > 1){
    for(i in 1:length(param_names)){
      tsql <- gsub(param_names[i], param_values[i], tsql)
    }
  }
  
  tsql_split <- stringr::str_split(tsql, "GO\\n", simplify = TRUE)
  
  log_list <- list()
  
  log_start <- data.frame(script_name = stringr::str_extract(file_path, '[A-Za-z_]*\\.sql'),
                          param_names = stringr::str_c(param_names, collapse = ' | '),
                          param_values = stringr::str_c(param_values, collapse = ' | '),
                          user_name = as.character(Sys.info()["user"]))
  
  batch_count <- length(tsql_split)
  
  for(i in 1:batch_count){
    
    tryCatch(
      {
        sql_script <- stringr::str_replace_all(tsql_split[[i]], '--.*\\n', '')
        sql_script <- stringr::str_replace_all(sql_script, '/\\*.*\\*/', '')
        
        job_name <- stringr::str_extract(tsql_split[[i]], '--.*\\n')
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
      }
    )
    
    log_records <- dplyr::bind_rows(log_list)
    
  }
  
  # if(!is.na(log_table)){
  #     DBI::dbWriteTable(con, DBI::Id(schema = log_schema, table = log_tbl), log_records, append = TRUE)
  # }
  
  return(log_records)
  
}





