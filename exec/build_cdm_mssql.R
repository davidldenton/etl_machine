library(tidyverse)
source('R/functions/execute_sql.R')


con <- DBI::dbConnect(odbc::odbc(),
    driver = 'mssql',
    server = 'localhost',
    UID = 'adminuser',
    PWD = rstudioapi::askForPassword('Database password'),
    port = 1433)

# Create etl schema
etl01 <- execute_sql(
    connection = con,
    file_path = 'sql/MSSQL/ddl_create_schema.sql',
    parameters = list(
        'database' = 'omop3',
        'schema_name' = 'etl'))

# Create etl.run_log table
etl02 <- execute_sql(connection = con,
    file_path = 'sql/MSSQL/ddl_etl_run_log_tbl.sql',
    parameters = list(
        'database' = 'omop3',
        'log_tbl_name' = 'etl.run_log'))

# Create cdm schema
etl03 <- execute_sql(
    connection = con,
    file_path = 'sql/MSSQL/ddl_create_schema.sql',
    parameters = list(
        'database' = 'omop3',
        'schema_name' = 'cdm'),
    log_table = 'etl.run_log')

# Create cdm tables
etl04 <- execute_sql(
    connection = con,
    file_path = 'sql/MSSQL/ddl_cdm_tbls.sql',
    parameters = list(
        'database' = 'omop3'),
    log_table = 'etl.run_log')

# Bulk load cdm tables from csv files
etl05 <- execute_sql_test(
    connection = con,
    file_path = 'sql/MSSQL/dml_load_cdm.sql',
    parameters = list(
        'database' = 'omop3',
        'vocab_data_path' = '/home/dave/gdrive/code/R/projects/etl_machine/data/',
        'vocab_error_path' = '/home/dave/gdrive/code/R/projects/etl_machine/data/error/'),
    log_table = 'etl.run_log',
    quit_on_error = TRUE)

# Disconnect from database
DBI::dbDisconnect(con)
