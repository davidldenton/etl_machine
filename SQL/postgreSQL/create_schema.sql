--Select database
SET SEARCH_PATH TO @database@;
GO

--Create schema
CREATE SCHEMA IF NOT EXISTS @schema_name@;