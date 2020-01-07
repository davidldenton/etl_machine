--Select database
SET SEARCH_PATH TO @database@;
GO

--Copy data to care_site table
COPY cdm.care_site FROM '/home/dave/gdrive/code/R/projects/etl_machine/data/care_site.csv' WITH DELIMITER E'\t' CSV HEADER QUOTE E'\b';
GO

--Copy data to cdm_source table
COPY cdm.cdm_source FROM '/home/dave/gdrive/code/R/projects/etl_machine/data/cdm_source.csv' WITH DELIMITER E'\t' CSV HEADER QUOTE E'\b';
GO

--Copy data to condition_era table
COPY cdm.condition_era FROM '/home/dave/gdrive/code/R/projects/etl_machine/data/condition_era.csv' WITH DELIMITER E'\t' CSV HEADER QUOTE E'\b';
GO

--Copy data to condition_occurrence table
COPY cdm.condition_occurrence FROM '/home/dave/gdrive/code/R/projects/etl_machine/data/condition_occurrence.csv' WITH DELIMITER E'\t' CSV HEADER QUOTE E'\b';
GO

--Copy data to cost table
COPY cdm.cost FROM '/home/dave/gdrive/code/R/projects/etl_machine/data/cost.csv' WITH DELIMITER E'\t' CSV HEADER QUOTE E'\b';
GO

--Copy data to death table
COPY cdm.death FROM '/home/dave/gdrive/code/R/projects/etl_machine/data/death.csv' WITH DELIMITER E'\t' CSV HEADER QUOTE E'\b';
GO

--Copy data to device exposure table
COPY cdm.device_exposure FROM '/home/dave/gdrive/code/R/projects/etl_machine/data/device_exposure.csv' WITH DELIMITER E'\t' CSV HEADER QUOTE E'\b';
GO

--Copy data to drug_era table
COPY cdm.drug_era FROM '/home/dave/gdrive/code/R/projects/etl_machine/data/drug_era.csv' WITH DELIMITER E'\t' CSV HEADER QUOTE E'\b';
GO

--Copy data to drug_exposure table
COPY cdm.drug_exposure FROM '/home/dave/gdrive/code/R/projects/etl_machine/data/drug_exposure.csv' WITH DELIMITER E'\t' CSV HEADER QUOTE E'\b';
GO

--Copy data to location table
COPY cdm.location FROM '/home/dave/gdrive/code/R/projects/etl_machine/data/location.csv' WITH DELIMITER E'\t' CSV HEADER QUOTE E'\b';
GO

--Copy data to measurement table
COPY cdm.measurement FROM '/home/dave/gdrive/code/R/projects/etl_machine/data/measurement.csv' WITH DELIMITER E'\t' CSV HEADER QUOTE E'\b';
GO

--Copy data to observation table
COPY cdm.observation FROM '/home/dave/gdrive/code/R/projects/etl_machine/data/observation.csv' WITH DELIMITER E'\t' CSV HEADER QUOTE E'\b';
GO

--Copy data to observation_period table
COPY cdm.observation_period FROM '/home/dave/gdrive/code/R/projects/etl_machine/data/observation_period.csv' WITH DELIMITER E'\t' CSV HEADER QUOTE E'\b';
GO

--Copy data to payer_plan_period table
COPY cdm.payer_plan_period FROM '/home/dave/gdrive/code/R/projects/etl_machine/data/payer_plan_period.csv' WITH DELIMITER E'\t' CSV HEADER QUOTE E'\b';
GO

--Copy data to person table
COPY cdm.person FROM '/home/dave/gdrive/code/R/projects/etl_machine/data/person.csv' WITH DELIMITER E'\t' CSV HEADER QUOTE E'\b';
GO

--Copy data to procedure_occurence table
COPY cdm.procedure_occurrence FROM '/home/dave/gdrive/code/R/projects/etl_machine/data/procedure_occurrence.csv' WITH DELIMITER E'\t' CSV HEADER QUOTE E'\b';
GO

--Copy data to provider table
COPY cdm.provider FROM '/home/dave/gdrive/code/R/projects/etl_machine/data/provider.csv' WITH DELIMITER E'\t' CSV HEADER QUOTE E'\b';
GO

--Copy data to visit_occurence table
COPY cdm.visit_occurrence FROM '/home/dave/gdrive/code/R/projects/etl_machine/data/visit_occurrence.csv' WITH DELIMITER E'\t' CSV HEADER QUOTE E'\b';
