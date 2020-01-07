library(tidyverse)
source('R/execute_sql.R')

con <- DBI::dbConnect(odbc::odbc(),
                      driver = 'PostgreSQL_Unicode',
                      database = 'postgres',
                      UID = 'dave',
                      PWD = rstudioapi::askForPassword('Database password'),
                      host = "localhost",
                      port = 5432)

etl01 <- execute_sql(connection = con,
                     file_path = 'sql/postgreSQL/create_schema.sql',
                     parameters = list(
                         'database' = 'innsmouth',
                         'schema_name' = 'etl'))

etl02 <- execute_sql(connection = con,
                     file_path = 'sql/postgreSQL/ddl_etl_run_log_tbl.sql',
                     parameters = list(
                         'database' = 'innsmouth',
                         'log_tbl_name' = 'etl.run_log'),
                     log_table = NA)

etl03 <- execute_sql(connection = con,
                     file_path = 'sql/postgreSQL/create_schema.sql',
                     parameters = list(
                         'database' = 'innsmouth',
                         'schema_name' = 'cdm'),
                     log_table = 'etl.run_log')

etl104 <- execute_sql(connection = con,
                      file_path = 'sql/postgreSQL/ddl_cdm.sql',
                      parameters = list(
                          'database' = 'postgres'),
                      log_table = 'etl.run_log')

etl105 <- execute_sql(connection = con,
                      file_path = 'sql/postgreSQL/bulk_copy_cdm.sql',
                      parameters = list(
                          'database' = 'postgres'),
                      log_table = 'etl.run_log')

DBI::dbDisconnect(con)