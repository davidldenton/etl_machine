--Select database
SET SEARCH_PATH TO @database@;
GO

--Create etl log table
CREATE TABLE IF NOT EXISTS etl.run_log (
  log_event_id SERIAL PRIMARY KEY
  ,script_name VARCHAR(100)
  ,job_name VARCHAR(100)
  ,batch_number INTEGER
  ,parameters VARCHAR(250)
  ,start_dtm TIMESTAMP
  ,duration NUMERIC(18, 3)
  ,exit_status SMALLINT
  ,message VARCHAR(1000)
  ,user_name VARCHAR(100)
);