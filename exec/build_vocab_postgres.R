library(tidyverse)
source('R/functions/execute_sql.R')

# Connect to database
con <- DBI::dbConnect(odbc::odbc(),
                      driver = 'PostgreSQL_Unicode',
                      database = 'dagon',
                      UID = 'dave',
                      PWD = rstudioapi::askForPassword('Database password'),
                      host = "localhost",
                      port = 5432)

# Create etl schema
    etl01 <- execute_sql(connection = con,
                         file_path = 'sql/postgreSQL/create_schema.sql',
                         parameters = list(
                             'database' = 'dagon',
                             'schema_name' = 'etl'),
                         log_table = NA)

# Create etl.run_log table
etl02 <- execute_sql(connection = con,
                     file_path = 'sql/postgreSQL/ddl_etl_run_log_tbl.sql',
                     parameters = list(
                         'database' = 'dagon'),
                     log_table = NA)

# Create cdm schema
etl03 <- execute_sql(connection = con,
                     file_path = 'sql/postgreSQL/create_schema.sql',
                     parameters = list(
                         'database' = 'dagon',
                         'schema_name' = 'cdm'))

# Create cdm vocab tables
etl04 <- execute_sql(connection = con,
                     file_path = 'sql/postgreSQL/ddl_cdm_vocab.sql',
                     parameters = list(
                         'database' = 'dagon'))

# Bulk copy flat files into cdm vocab tables
etl05 <- execute_sql(connection = con,
                     file_path = 'sql/postgreSQL/bulk_copy_cdm_vocab.sql',
                     parameters = list(
                         'database' = 'dagon'))

# Add primary keys and indexes to cdm vocab tables
etl06 <- execute_sql(connection = con,
                     file_path = 'sql/postgreSQL/ddl_cdm_vocab_indexes.sql',
                     parameters = list(
                         'database' = 'dagon'))

# Add foreign key, unique, and check constraints to cdm vocab tables
etl07 <- execute_sql(connection = con,
                     file_path = 'sql/postgreSQL/ddl_cdm_vocab_constraints.sql',
                     parameters = list(
                         'database' = 'dagon'))

DBI::dbDisconnect(con)

