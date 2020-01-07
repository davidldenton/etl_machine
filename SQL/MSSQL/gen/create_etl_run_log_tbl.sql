/***************************************
params: database
***************************************/

--Select database
USE @database@;
GO

--Create etl.run_log table
IF(OBJECT_ID('etl.run_log') IS NULL)

    CREATE TABLE etl.run_log (
      log_event_id INTEGER IDENTITY(1,1) PRIMARY KEY
      ,pid VARCHAR(200)
      ,script_name VARCHAR(100)
      ,job_name VARCHAR(100)
      ,batch_number INTEGER
      ,parameters VARCHAR(250)
      ,start_dtm DATETIME
      ,duration NUMERIC(18, 3)
      ,exit_status SMALLINT
      ,message VARCHAR(1000)
      ,user_name VARCHAR(50)
    );