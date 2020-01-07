library(tidyverse)
library(DBI)
source('R/tsql_execute.R')


# Create 'etl' schema and 'run_log' table
con <- DBI::dbConnect(odbc::odbc(),
                      driver = 'SQLServer',
                      database = 'omop',
                      server = 'vmrstudiodb.mehealth.org',
                      port = 1433,
                      Trusted_Connection = 'yes')

etl01 <- tsql_execute(connection = con,
                      file_path = 'sql/DDL/create_etl_schema.sql',
                      param_names = '@database',
                      param_values = 'omop',
                      log_table = NA)

etl02 <- tsql_execute(connection = con,
                      file_path = 'sql/DDL/create_etl_run_log_tbl.sql',
                      param_names = '@database',
                      param_values = 'omop',
                      log_table = NA)

dbDisconnect(con)


# Create 'omop' schema and tables
con <- DBI::dbConnect(odbc::odbc(),
                      driver = 'SQLServer',
                      database = 'omop',
                      server = 'vmrstudiodb.mehealth.org',
                      port = 1433,
                      Trusted_Connection = 'yes')

etl03 <- tsql_execute(connection = con,
                      file_path = 'sql/DDL/create_cdm_schema.sql',
                      param_names = '@database',
                      param_values = 'omop')

etl04 <- tsql_execute(connection = con,
                      file_path = 'sql/DDL/create_cdm_tbls.sql',
                      param_names = '@database',
                      param_values = 'omop')

dbDisconnect(con)


# Load vocab tables from CSV sources, add indexes and constraints
con <- DBI::dbConnect(odbc::odbc(),
                      driver = 'SQLServer',
                      database = 'omop',
                      server = 'vmrstudiodb.mehealth.org',
                      port = 1433,
                      Trusted_Connection = 'yes')

etl05 <- tsql_execute(connection = con,
                      file_path = 'sql/DML/load_vocab_tbls.sql',
                      param_names = c('@database','@vocab_data_path', '@vocab_error_path'),
                      param_values = c('omop',
                                       '\\\\\\\\mehealth.org\\\\Data\\\\Department\\\\MMCRI\\\\bulk_load\\\\',
                                       '\\\\\\\\mehealth.org\\\\Data\\\\Department\\\\MMCRI\\\\bulk_load\\\\errors\\\\'))

etl06 <- tsql_execute(connection = con,
                      file_path = 'sql/DDL/create_vocab_indexes.sql',
                      param_names = c('@database'),
                      param_values = c('omop'))

# Remove duplicate entry from concept_synonym table
etl07 <- tsql_execute(connection = con,
                      file_path = 'sql/DML/rm_dup_record_from_concept_synonym.sql',
                      param_names = c('@database'),
                      param_values = c('omop'))

etl08 <- tsql_execute(connection = con,
                      file_path = 'sql/DDL/create_vocab_constraints.sql',
                      param_names = c('@database'),
                      param_values = c('omop'))

dbDisconnect(con)

