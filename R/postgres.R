con <- DBI::dbConnect(odbc::odbc(),
                      driver = 'PostgreSQL_Unicode',
                      database = 'postgres',
                      UID = 'dave',
                      PWD = rstudioapi::askForPassword('Database password'),
                      host = "localhost",
                      port = 5432)
DBI::dbDisconnect(con)
