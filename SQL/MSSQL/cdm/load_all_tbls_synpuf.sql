/***************************************
params: database, schema_name, file_path, field_terminator, row_terminator
***************************************/

USE @database@;
GO

IF(OBJECT_ID('@schema_name@.concept') IS NOT NULL)
  BEGIN
    TRUNCATE TABLE @schema_name@.concept;
    BULK INSERT @schema_name@.concept 
    FROM '@file_path@concept.csv' 
    WITH (
    FIRSTROW = 1,
    FIELDTERMINATOR = '@field_terminator@',
    ROWTERMINATOR = '@row_terminator@',
    ERRORFILE = '@file_path@errors\concept.bad',
    TABLOCK
    );
END
;
GO

IF(OBJECT_ID('@schema_name@.drug_strength') IS NOT NULL)
  BEGIN
    TRUNCATE TABLE @schema_name@.drug_strength;
    BULK INSERT @schema_name@.drug_strength 
    FROM '@file_path@drug_strength.csv' 
    WITH (
    FIRSTROW = 1,
    FIELDTERMINATOR = '@field_terminator@',
    ROWTERMINATOR = '@row_terminator@',
    ERRORFILE = '@file_path@errors\drug_strength.bad',
    TABLOCK
    );
  END
;
GO

IF(OBJECT_ID('@schema_name@.concept_relationship') IS NOT NULL)
  BEGIN
    TRUNCATE TABLE @schema_name@.concept_relationship;
    BULK INSERT @schema_name@.concept_relationship 
    FROM '@file_path@concept_relationship.csv' 
    WITH (
    FIRSTROW = 1,
    FIELDTERMINATOR = '@field_terminator@',
    ROWTERMINATOR = '@row_terminator@',
    ERRORFILE = '@file_path@errors\concept_relationship.bad',
    TABLOCK
    );
  END
;
GO

IF(OBJECT_ID('@schema_name@.concept_ancestor') IS NOT NULL)
  BEGIN
    TRUNCATE TABLE @schema_name@.concept_ancestor;
    BULK INSERT @schema_name@.concept_ancestor 
    FROM '@file_path@concept_ancestor.csv' 
    WITH (
    FIRSTROW = 1,
    FIELDTERMINATOR = '@field_terminator@',
    ROWTERMINATOR = '@row_terminator@',
    ERRORFILE = '@file_path@errors\concept_ancestor.bad',
    TABLOCK
    );
  END
;
GO

IF(OBJECT_ID('@schema_name@.concept_synonym') IS NOT NULL)
  BEGIN
    TRUNCATE TABLE @schema_name@.concept_synonym;
    BULK INSERT @schema_name@.concept_synonym 
    FROM '@file_path@concept_synonym.csv' 
    WITH (
    FIRSTROW = 1,
    FIELDTERMINATOR = '@field_terminator@',
    ROWTERMINATOR = '@row_terminator@',
    ERRORFILE = '@file_path@errors\concept_synonym.bad',
    TABLOCK
    );
  END
;
GO

IF(OBJECT_ID('@schema_name@.vocabulary') IS NOT NULL)
  BEGIN
    TRUNCATE TABLE @schema_name@.vocabulary;
    BULK INSERT @schema_name@.vocabulary 
    FROM '@file_path@vocabulary.csv' 
    WITH (
    FIRSTROW = 1,
    FIELDTERMINATOR = '@field_terminator@',
    ROWTERMINATOR = '@row_terminator@',
    ERRORFILE = '@file_path@errors\vocabulary.bad',
    TABLOCK
    );
  END
;
GO

IF(OBJECT_ID('@schema_name@.relationship') IS NOT NULL)
  BEGIN
    TRUNCATE TABLE @schema_name@.relationship;
    BULK INSERT @schema_name@.relationship 
    FROM '@file_path@relationship.csv' 
    WITH (
    FIRSTROW = 1,
    FIELDTERMINATOR = '@field_terminator@',
    ROWTERMINATOR = '@row_terminator@',
    ERRORFILE = '@file_path@errors\relationship.bad',
    TABLOCK
    );
  END
;
GO

IF(OBJECT_ID('@schema_name@.concept_class') IS NOT NULL)
  BEGIN
    TRUNCATE TABLE @schema_name@.concept_class;
    BULK INSERT @schema_name@.concept_class 
    FROM '@file_path@concept_class.csv' 
    WITH (
    FIRSTROW = 1,
    FIELDTERMINATOR = '@field_terminator@',
    ROWTERMINATOR = '@row_terminator@',
    ERRORFILE = '@file_path@errors\concept_class.bad',
    TABLOCK
    );
  END
;
GO

IF(OBJECT_ID('@schema_name@.domain') IS NOT NULL)
  BEGIN
    TRUNCATE TABLE @schema_name@.domain;
    BULK INSERT @schema_name@.domain 
    FROM '@file_path@domain.csv' 
    WITH (
    FIRSTROW = 1,
    FIELDTERMINATOR = '@field_terminator@',
    ROWTERMINATOR = '@row_terminator@',
    ERRORFILE = '@file_path@errors\domain.bad',
    TABLOCK
    );
  END
;
GO

IF(OBJECT_ID('@schema_name@.cdm_source') IS NOT NULL)
  BEGIN
    TRUNCATE TABLE @schema_name@.cdm_source;
    BULK INSERT @schema_name@.cdm_source 
    FROM '@file_path@cdm_source.csv' 
    WITH (
    FIRSTROW = 1,
    FIELDTERMINATOR = '@field_terminator@',
    ROWTERMINATOR = '@row_terminator@',
    ERRORFILE = '@file_path@errors\cdm_source.bad',
    TABLOCK
    );
END
;
GO

IF(OBJECT_ID('@schema_name@.person') IS NOT NULL)
  BEGIN
    TRUNCATE TABLE @schema_name@.person;
    BULK INSERT @schema_name@.person 
    FROM '@file_path@person.csv' 
    WITH (
    FIRSTROW = 1,
    FIELDTERMINATOR = '@field_terminator@',
    ROWTERMINATOR = '@row_terminator@',
    ERRORFILE = '@file_path@errors\person.bad',
    TABLOCK
    );
END
;
GO

IF(OBJECT_ID('@schema_name@.observation_period') IS NOT NULL)
  BEGIN
    TRUNCATE TABLE @schema_name@.observation_period;
    BULK INSERT @schema_name@.observation_period 
    FROM '@file_path@observation_period.csv' 
    WITH (
    FIRSTROW = 1,
    FIELDTERMINATOR = '@field_terminator@',
    ROWTERMINATOR = '@row_terminator@',
    ERRORFILE = '@file_path@errors\observation_period.bad',
    TABLOCK
    );
END
;
GO


IF(OBJECT_ID('@schema_name@.visit_occurrence') IS NOT NULL)
  BEGIN
    TRUNCATE TABLE @schema_name@.visit_occurrence;
    BULK INSERT @schema_name@.visit_occurrence 
    FROM '@file_path@visit_occurrence.csv' 
    WITH (
    FIRSTROW = 1,
    FIELDTERMINATOR = '@field_terminator@',
    ROWTERMINATOR = '@row_terminator@',
    ERRORFILE = '@file_path@errors\visit_occurrence.bad',
    TABLOCK
    );
END
;
GO


IF(OBJECT_ID('@schema_name@.procedure_occurrence') IS NOT NULL)
  BEGIN
    TRUNCATE TABLE @schema_name@.procedure_occurrence;
    BULK INSERT @schema_name@.procedure_occurrence 
    FROM '@file_path@procedure_occurrence.csv' 
    WITH (
    FIRSTROW = 1,
    FIELDTERMINATOR = '@field_terminator@',
    ROWTERMINATOR = '@row_terminator@',
    ERRORFILE = '@file_path@errors\procedure_occurrence.bad',
    TABLOCK
    );
END
;
GO

IF(OBJECT_ID('@schema_name@.drug_exposure') IS NOT NULL)
  BEGIN
    TRUNCATE TABLE @schema_name@.drug_exposure;
    BULK INSERT @schema_name@.drug_exposure 
    FROM '@file_path@drug_exposure.csv' 
    WITH (
    FIRSTROW = 1,
    FIELDTERMINATOR = '@field_terminator@',
    ROWTERMINATOR = '@row_terminator@',
    ERRORFILE = '@file_path@errors\drug_exposure.bad',
    TABLOCK
    );
END
;
GO

IF(OBJECT_ID('@schema_name@.device_exposure') IS NOT NULL)
  BEGIN
    TRUNCATE TABLE @schema_name@.device_exposure;
    BULK INSERT @schema_name@.device_exposure 
    FROM '@file_path@device_exposure.csv' 
    WITH (
    FIRSTROW = 1,
    FIELDTERMINATOR = '@field_terminator@',
    ROWTERMINATOR = '@row_terminator@',
    ERRORFILE = '@file_path@errors\device_exposure.bad',
    TABLOCK
    );
END
;
GO

IF(OBJECT_ID('@schema_name@.condition_occurrence') IS NOT NULL)
  BEGIN
    TRUNCATE TABLE @schema_name@.condition_occurrence;
    BULK INSERT @schema_name@.condition_occurrence 
    FROM '@file_path@condition_occurrence.csv' 
    WITH (
    FIRSTROW = 1,
    FIELDTERMINATOR = '@field_terminator@',
    ROWTERMINATOR = '@row_terminator@',
    ERRORFILE = '@file_path@errors\condition_occurrence.bad',
    TABLOCK
    );
END
;
GO

IF(OBJECT_ID('@schema_name@.measurement') IS NOT NULL)
  BEGIN
    TRUNCATE TABLE @schema_name@.measurement;
    BULK INSERT @schema_name@.measurement 
    FROM '@file_path@measurement.csv' 
    WITH (
    FIRSTROW = 1,
    FIELDTERMINATOR = '@field_terminator@',
    ROWTERMINATOR = '@row_terminator@',
    ERRORFILE = '@file_path@errors\measurement.bad',
    TABLOCK
    );
END
;
GO


IF(OBJECT_ID('@schema_name@.observation') IS NOT NULL)
  BEGIN
    TRUNCATE TABLE @schema_name@.observation;
    BULK INSERT @schema_name@.observation 
    FROM '@file_path@observation.csv' 
    WITH (
    FIRSTROW = 1,
    FIELDTERMINATOR = '@field_terminator@',
    ROWTERMINATOR = '@row_terminator@',
    ERRORFILE = '@file_path@errors\observation.bad',
    TABLOCK
    );
END
;
GO


IF(OBJECT_ID('@schema_name@.location') IS NOT NULL)
  BEGIN
    TRUNCATE TABLE @schema_name@.location;
    BULK INSERT @schema_name@.location 
    FROM '@file_path@location.csv' 
    WITH (
    FIRSTROW = 1,
    FIELDTERMINATOR = '@field_terminator@',
    ROWTERMINATOR = '@row_terminator@',
    ERRORFILE = '@file_path@errors\location.bad',
    TABLOCK
    );
END
;
GO


IF(OBJECT_ID('@schema_name@.care_site') IS NOT NULL)
  BEGIN
    TRUNCATE TABLE @schema_name@.care_site;
    BULK INSERT @schema_name@.care_site 
    FROM '@file_path@care_site.csv' 
    WITH (
    FIRSTROW = 1,
    FIELDTERMINATOR = '@field_terminator@',
    ROWTERMINATOR = '@row_terminator@',
    ERRORFILE = '@file_path@errors\care_site.bad',
    TABLOCK
    );
END
;
GO

IF(OBJECT_ID('@schema_name@.provider') IS NOT NULL)
  BEGIN
    TRUNCATE TABLE @schema_name@.provider;
    BULK INSERT @schema_name@.provider 
    FROM '@file_path@provider.csv' 
    WITH (
    FIRSTROW = 1,
    FIELDTERMINATOR = '@field_terminator@',
    ROWTERMINATOR = '@row_terminator@',
    ERRORFILE = '@file_path@errors\provider.bad',
    TABLOCK
    );
END
;
GO

IF(OBJECT_ID('@schema_name@.payer_plan_period') IS NOT NULL)
  BEGIN
    TRUNCATE TABLE @schema_name@.payer_plan_period;
    BULK INSERT @schema_name@.payer_plan_period 
    FROM '@file_path@payer_plan_period.csv' 
    WITH (
    FIRSTROW = 1,
    FIELDTERMINATOR = '@field_terminator@',
    ROWTERMINATOR = '@row_terminator@',
    ERRORFILE = '@file_path@errors\payer_plan_period.bad',
    TABLOCK
    );
END
;
GO

IF(OBJECT_ID('@schema_name@.cost') IS NOT NULL)
  BEGIN
    TRUNCATE TABLE @schema_name@.cost;
    BULK INSERT @schema_name@.cost 
    FROM '@file_path@cost.csv' 
    WITH (
    FIRSTROW = 1,
    FIELDTERMINATOR = '@field_terminator@',
    ROWTERMINATOR = '@row_terminator@',
    ERRORFILE = '@file_path@errors\cost.bad',
    TABLOCK
    );
END
;
GO

IF(OBJECT_ID('@schema_name@.drug_era') IS NOT NULL)
  BEGIN
    TRUNCATE TABLE @schema_name@.drug_era;
    BULK INSERT @schema_name@.drug_era 
    FROM '@file_path@drug_era.csv' 
    WITH (
    FIRSTROW = 1,
    FIELDTERMINATOR = '@field_terminator@',
    ROWTERMINATOR = '@row_terminator@',
    ERRORFILE = '@file_path@errors\drug_era.bad',
    TABLOCK
    );
END
;
GO


IF(OBJECT_ID('@schema_name@.condition_era') IS NOT NULL)
  BEGIN
    TRUNCATE TABLE @schema_name@.condition_era;
    BULK INSERT @schema_name@.condition_era 
    FROM '@file_path@condition_era.csv' 
    WITH (
    FIRSTROW = 1,
    FIELDTERMINATOR = '@field_terminator@',
    ROWTERMINATOR = '@row_terminator@',
    ERRORFILE = '@file_path@errors\condition_era.bad',
    TABLOCK
    );
END
;
GO

IF(OBJECT_ID('@schema_name@.concept_hierarchy') IS NOT NULL)
  BEGIN
    TRUNCATE TABLE @schema_name@.concept_hierarchy;
    BULK INSERT @schema_name@.concept_hierarchy 
    FROM '@file_path@concept_hierarchy.csv' 
    WITH (
    FIRSTROW = 1,
    FIELDTERMINATOR = '@field_terminator@',
    ROWTERMINATOR = '@row_terminator@',
    ERRORFILE = '@file_path@errors\concept_hierarchy.bad',
    TABLOCK
    );
  END
;
GO

IF(OBJECT_ID('@schema_name@.death') IS NOT NULL)
  BEGIN
    TRUNCATE TABLE @schema_name@.death;
    BULK INSERT @schema_name@.death 
    FROM '@file_path@death.csv' 
    WITH (
    FIRSTROW = 1,
    FIELDTERMINATOR = '@field_terminator@',
    ROWTERMINATOR = '@row_terminator@',
    ERRORFILE = '@file_path@errors\death.bad',
    TABLOCK
    );
  END
;
GO