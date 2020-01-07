/***************************************
params: database, schema_name
***************************************/

--Select database
USE @database@;
GO

--Create etl schema
IF(SCHEMA_ID('@schema_name@') IS NULL)
  EXEC('CREATE SCHEMA @schema_name@')
;