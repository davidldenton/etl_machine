--Select database
USE @database@;
GO

--Load cdm.care_site from csv
IF(OBJECT_ID('cdm.care_site') IS NOT NULL)
  BEGIN
    TRUNCATE TABLE cdm.care_site;
    BULK INSERT cdm.care_site 
    FROM '@vocab_data_path@care_site.csv' 
    WITH (
    FIRSTROW = 1,
    FIELDTERMINATOR = '\t',
    ROWTERMINATOR = '0x0a',
    ERRORFILE = '@vocab_error_path@care_site.bad',
    TABLOCK
    );
  END
;
GO

--Load cdm.cdm_source from csv
IF(OBJECT_ID('cdm.cdm_source') IS NOT NULL)
  BEGIN
    TRUNCATE TABLE cdm.cdm_source;
    BULK INSERT cdm.cdm_source 
    FROM '@vocab_data_path@cdm_source.csv' 
    WITH (
    FIRSTROW = 1,
    FIELDTERMINATOR = '\t',
    ROWTERMINATOR = '0x0a',
    ERRORFILE = '@vocab_error_path@cdm_source.bad',
    TABLOCK
    );
  END
;
GO

--Load cdm.concept from csv
IF(OBJECT_ID('cdm.concept') IS NOT NULL)
  BEGIN
    TRUNCATE TABLE cdm.concept;
    BULK INSERT cdm.concept 
    FROM '@vocab_data_path@concept.csv' 
    WITH (
    FIRSTROW = 1,
    FIELDTERMINATOR = '\t',
    ROWTERMINATOR = '0x0a',
    ERRORFILE = '@vocab_error_path@concept.bad',
    TABLOCK
    );
  END
;
GO

--Load cdm.concept_ancestor from csv
IF(OBJECT_ID('cdm.concept_ancestor') IS NOT NULL)
  BEGIN
    TRUNCATE TABLE cdm.concept_ancestor;
    BULK INSERT cdm.concept_ancestor 
    FROM '@vocab_data_path@concept_ancestor.csv' 
    WITH (
    FIRSTROW = 1,
    FIELDTERMINATOR = '\t',
    ROWTERMINATOR = '0x0a',
    ERRORFILE = '@vocab_error_path@concept_ancestor.bad',
    TABLOCK
    );
  END
;
GO

--Load cdm.concept_class from csv
IF(OBJECT_ID('cdm.concept_class') IS NOT NULL)
  BEGIN
    TRUNCATE TABLE cdm.concept_class;
    BULK INSERT cdm.concept_class 
    FROM '@vocab_data_path@concept_class.csv' 
    WITH (
    FIRSTROW = 1,
    FIELDTERMINATOR = '\t',
    ROWTERMINATOR = '0x0a',
    ERRORFILE = '@vocab_error_path@concept_class.bad',
    TABLOCK
    );
  END
;
GO

--Load cdm.concept_relationship from csv
IF(OBJECT_ID('cdm.concept_relationship') IS NOT NULL)
  BEGIN
    TRUNCATE TABLE cdm.concept_relationship;
    BULK INSERT cdm.concept_relationship 
    FROM '@vocab_data_path@concept_relationship.csv' 
    WITH (
    FIRSTROW = 1,
    FIELDTERMINATOR = '\t',
    ROWTERMINATOR = '0x0a',
    ERRORFILE = '@vocab_error_path@concept_relationship.bad',
    TABLOCK
    );
  END
;
GO

--Load cdm.concept_synonym from csv
IF(OBJECT_ID('cdm.concept_synonym') IS NOT NULL)
  BEGIN
    TRUNCATE TABLE cdm.concept_synonym;
    BULK INSERT cdm.concept_synonym 
    FROM '@vocab_data_path@concept_synonym.csv' 
    WITH (
    FIRSTROW = 1,
    FIELDTERMINATOR = '\t',
    ROWTERMINATOR = '0x0a',
    ERRORFILE = '@vocab_error_path@concept_synonym.bad',
    TABLOCK
    );
  END
;
GO

--Load cdm.condition_era from csv
IF(OBJECT_ID('cdm.condition_era') IS NOT NULL)
  BEGIN
    TRUNCATE TABLE cdm.condition_era;
    BULK INSERT cdm.condition_era 
    FROM '@vocab_data_path@condition_era.csv' 
    WITH (
    FIRSTROW = 1,
    FIELDTERMINATOR = '\t',
    ROWTERMINATOR = '0x0a',
    ERRORFILE = '@vocab_error_path@condition_era.bad',
    TABLOCK
    );
  END
;
GO

--Load cdm.condition_occurrence from csv
IF(OBJECT_ID('cdm.condition_occurrence') IS NOT NULL)
  BEGIN
    TRUNCATE TABLE cdm.condition_occurrence;
    BULK INSERT cdm.condition_occurrence 
    FROM '@vocab_data_path@condition_occurrence.csv' 
    WITH (
    FIRSTROW = 1,
    FIELDTERMINATOR = '\t',
    ROWTERMINATOR = '0x0a',
    ERRORFILE = '@vocab_error_path@condition_occurrence.bad',
    TABLOCK
    );
  END
;
GO

--Load cdm.cost from csv
IF(OBJECT_ID('cdm.cost') IS NOT NULL)
  BEGIN
    TRUNCATE TABLE cdm.cost;
    BULK INSERT cdm.cost 
    FROM '@vocab_data_path@cost.csv' 
    WITH (
    FIRSTROW = 1,
    FIELDTERMINATOR = '\t',
    ROWTERMINATOR = '0x0a',
    ERRORFILE = '@vocab_error_path@cost.bad',
    TABLOCK
    );
  END
;
GO

--Load cdm.death from csv
IF(OBJECT_ID('cdm.death') IS NOT NULL)
  BEGIN
    TRUNCATE TABLE cdm.death;
    BULK INSERT cdm.death 
    FROM '@vocab_data_path@death.csv' 
    WITH (
    FIRSTROW = 1,
    FIELDTERMINATOR = '\t',
    ROWTERMINATOR = '0x0a',
    ERRORFILE = '@vocab_error_path@death.bad',
    TABLOCK
    );
  END
;
GO

--Load cdm.device_exposure from csv
IF(OBJECT_ID('cdm.device_exposure') IS NOT NULL)
  BEGIN
    TRUNCATE TABLE cdm.device_exposure;
    BULK INSERT cdm.device_exposure 
    FROM '@vocab_data_path@device_exposure.csv' 
    WITH (
    FIRSTROW = 1,
    FIELDTERMINATOR = '\t',
    ROWTERMINATOR = '0x0a',
    ERRORFILE = '@vocab_error_path@device_exposure.bad',
    TABLOCK
    );
  END
;
GO

--Load cdm.domain from csv
IF(OBJECT_ID('cdm.domain') IS NOT NULL)
  BEGIN
    TRUNCATE TABLE cdm.domain;
    BULK INSERT cdm.domain 
    FROM '@vocab_data_path@domain.csv' 
    WITH (
    FIRSTROW = 1,
    FIELDTERMINATOR = '\t',
    ROWTERMINATOR = '0x0a',
    ERRORFILE = '@vocab_error_path@domain.bad',
    TABLOCK
    );
  END
;
GO

--Load cdm.drug_era from csv
IF(OBJECT_ID('cdm.drug_era') IS NOT NULL)
  BEGIN
    TRUNCATE TABLE cdm.drug_era;
    BULK INSERT cdm.drug_era 
    FROM '@vocab_data_path@drug_era.csv' 
    WITH (
    FIRSTROW = 1,
    FIELDTERMINATOR = '\t',
    ROWTERMINATOR = '0x0a',
    ERRORFILE = '@vocab_error_path@drug_era.bad',
    TABLOCK
    );
  END
;
GO

--Load cdm.drug_exposure from csv
IF(OBJECT_ID('cdm.drug_exposure') IS NOT NULL)
  BEGIN
    TRUNCATE TABLE cdm.drug_exposure;
    BULK INSERT cdm.drug_exposure 
    FROM '@vocab_data_path@drug_exposure.csv' 
    WITH (
    FIRSTROW = 1,
    FIELDTERMINATOR = '\t',
    ROWTERMINATOR = '0x0a',
    ERRORFILE = '@vocab_error_path@drug_exposure.bad',
    TABLOCK
    );
  END
;
GO

--Load cdm.drug_strength from csv
IF(OBJECT_ID('cdm.drug_strength') IS NOT NULL)
  BEGIN
    TRUNCATE TABLE cdm.drug_strength;
    BULK INSERT cdm.drug_strength 
    FROM '@vocab_data_path@drug_strength.csv' 
    WITH (
    FIRSTROW = 1,
    FIELDTERMINATOR = '\t',
    ROWTERMINATOR = '0x0a',
    ERRORFILE = '@vocab_error_path@drug_strength.bad',
    TABLOCK
    );
  END
;
GO

--Load cdm.location from csv
IF(OBJECT_ID('cdm.location') IS NOT NULL)
  BEGIN
    TRUNCATE TABLE cdm.location;
    BULK INSERT cdm.location 
    FROM '@vocab_data_path@location.csv' 
    WITH (
    FIRSTROW = 1,
    FIELDTERMINATOR = '\t',
    ROWTERMINATOR = '0x0a',
    ERRORFILE = '@vocab_error_path@location.bad',
    TABLOCK
    );
  END
;
GO

--Load cdm.measurement from csv
IF(OBJECT_ID('cdm.measurement') IS NOT NULL)
  BEGIN
    TRUNCATE TABLE cdm.measurement;
    BULK INSERT cdm.measurement 
    FROM '@vocab_data_path@measurement.csv' 
    WITH (
    FIRSTROW = 1,
    FIELDTERMINATOR = '\t',
    ROWTERMINATOR = '0x0a',
    ERRORFILE = '@vocab_error_path@measurement.bad',
    TABLOCK
    );
  END
;
GO

--Load cdm.observation from csv
IF(OBJECT_ID('cdm.observation') IS NOT NULL)
  BEGIN
    TRUNCATE TABLE cdm.observation;
    BULK INSERT cdm.observation 
    FROM '@vocab_data_path@observation.csv' 
    WITH (
    FIRSTROW = 1,
    FIELDTERMINATOR = '\t',
    ROWTERMINATOR = '0x0a',
    ERRORFILE = '@vocab_error_path@observation.bad',
    TABLOCK
    );
  END
;
GO

--Load cdm.observation_period from csv
IF(OBJECT_ID('cdm.observation_period') IS NOT NULL)
  BEGIN
    TRUNCATE TABLE cdm.observation_period;
    BULK INSERT cdm.observation_period 
    FROM '@vocab_data_path@observation_period.csv' 
    WITH (
    FIRSTROW = 1,
    FIELDTERMINATOR = '\t',
    ROWTERMINATOR = '0x0a',
    ERRORFILE = '@vocab_error_path@observation_period.bad',
    TABLOCK
    );
  END
;
GO

--Load cdm.payer_plan_period from csv
IF(OBJECT_ID('cdm.payer_plan_period') IS NOT NULL)
  BEGIN
    TRUNCATE TABLE cdm.payer_plan_period;
    BULK INSERT cdm.payer_plan_period 
    FROM '@vocab_data_path@payer_plan_period.csv' 
    WITH (
    FIRSTROW = 1,
    FIELDTERMINATOR = '\t',
    ROWTERMINATOR = '0x0a',
    ERRORFILE = '@vocab_error_path@payer_plan_period.bad',
    TABLOCK
    );
  END
;
GO

--Load cdm.person from csv
IF(OBJECT_ID('cdm.person') IS NOT NULL)
  BEGIN
    TRUNCATE TABLE cdm.person;
    BULK INSERT cdm.person 
    FROM '@vocab_data_path@person.csv' 
    WITH (
    FIRSTROW = 1,
    FIELDTERMINATOR = '\t',
    ROWTERMINATOR = '0x0a',
    ERRORFILE = '@vocab_error_path@person.bad',
    TABLOCK
    );
  END
;
GO

--Load cdm.procedure_occurrence from csv
IF(OBJECT_ID('cdm.procedure_occurrence') IS NOT NULL)
  BEGIN
    TRUNCATE TABLE cdm.procedure_occurrence;
    BULK INSERT cdm.procedure_occurrence 
    FROM '@vocab_data_path@procedure_occurrence.csv' 
    WITH (
    FIRSTROW = 1,
    FIELDTERMINATOR = '\t',
    ROWTERMINATOR = '0x0a',
    ERRORFILE = '@vocab_error_path@procedure_occurrence.bad',
    TABLOCK
    );
  END
;
GO

--Load cdm.provider from csv
IF(OBJECT_ID('cdm.provider') IS NOT NULL)
  BEGIN
    TRUNCATE TABLE cdm.provider;
    BULK INSERT cdm.provider 
    FROM '@vocab_data_path@provider.csv' 
    WITH (
    FIRSTROW = 1,
    FIELDTERMINATOR = '\t',
    ROWTERMINATOR = '0x0a',
    ERRORFILE = '@vocab_error_path@provider.bad',
    TABLOCK
    );
  END
;
GO

--Load cdm.relationship from csv
IF(OBJECT_ID('cdm.relationship') IS NOT NULL)
  BEGIN
    TRUNCATE TABLE cdm.relationship;
    BULK INSERT cdm.relationship 
    FROM '@vocab_data_path@relationship.csv' 
    WITH (
    FIRSTROW = 1,
    FIELDTERMINATOR = '\t',
    ROWTERMINATOR = '0x0a',
    ERRORFILE = '@vocab_error_path@relationship.bad',
    TABLOCK
    );
  END
;
GO

--Load cdm.visit_occurrence from csv
IF(OBJECT_ID('cdm.visit_occurrence') IS NOT NULL)
  BEGIN
    TRUNCATE TABLE cdm.visit_occurrence;
    BULK INSERT cdm.visit_occurrence 
    FROM '@vocab_data_path@visit_occurrence.csv' 
    WITH (
    FIRSTROW = 1,
    FIELDTERMINATOR = '\t',
    ROWTERMINATOR = '0x0a',
    ERRORFILE = '@vocab_error_path@visit_occurrence.bad',
    TABLOCK
    );
  END
;
GO

--Load cdm.vocabulary from csv
IF(OBJECT_ID('cdm.vocabulary') IS NOT NULL)
  BEGIN
    TRUNCATE TABLE cdm.vocabulary;
    BULK INSERT cdm.vocabulary 
    FROM '@vocab_data_path@vocabulary.csv' 
    WITH (
    FIRSTROW = 1,
    FIELDTERMINATOR = '\t',
    ROWTERMINATOR = '0x0a',
    ERRORFILE = '@vocab_error_path@vocabulary.bad',
    TABLOCK
    );
  END
;
GO






