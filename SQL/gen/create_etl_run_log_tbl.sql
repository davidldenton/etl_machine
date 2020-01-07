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
      ,script_name VARCHAR(200)
      ,job_name VARCHAR(200)
      ,batch_number INT
      ,param_names VARCHAR(255)
      ,param_values VARCHAR(255)
      ,start_dtm DATETIME
      ,duration NUMERIC(18, 3)
      ,exit_status TINYINT
      ,message VARCHAR(1500)
      ,user_name VARCHAR(100)
    );