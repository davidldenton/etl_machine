--Select database
SET SEARCH_PATH TO @database@;
GO

--Copy data to concept table
COPY cdm.concept FROM '/home/dave/gdrive/code/R/projects/etl_machine/data/CONCEPT.csv' WITH DELIMITER E'\t' CSV HEADER QUOTE E'\b';
GO

--Copy data to concept_ancestor table
COPY cdm.concept_ancestor FROM '/home/dave/gdrive/code/R/projects/etl_machine/data/CONCEPT_ANCESTOR.csv' WITH DELIMITER E'\t' CSV HEADER QUOTE E'\b';
GO

--Copy data to concept_class table
COPY cdm.concept_class FROM '/home/dave/gdrive/code/R/projects/etl_machine/data/CONCEPT_CLASS.csv' WITH DELIMITER E'\t' CSV HEADER QUOTE E'\b';
GO

--Copy data to concept_relationship table
COPY cdm.concept_relationship FROM '/home/dave/gdrive/code/R/projects/etl_machine/data/CONCEPT_RELATIONSHIP.csv' WITH DELIMITER E'\t' CSV HEADER QUOTE E'\b';
GO

--Copy data to concept_synonym table
COPY cdm.concept_synonym FROM '/home/dave/gdrive/code/R/projects/etl_machine/data/CONCEPT_SYNONYM.csv' WITH DELIMITER E'\t' CSV HEADER QUOTE E'\b';
GO

--Copy data to domain table
COPY cdm.domain FROM '/home/dave/gdrive/code/R/projects/etl_machine/data/DOMAIN.csv' WITH DELIMITER E'\t' CSV HEADER QUOTE E'\b';
GO

--Copy data to drug_strength table
COPY cdm.drug_strength FROM '/home/dave/gdrive/code/R/projects/etl_machine/data/DRUG_STRENGTH.csv' WITH DELIMITER E'\t' CSV HEADER QUOTE E'\b';
GO

--Copy data to relationship table
COPY cdm.relationship FROM '/home/dave/gdrive/code/R/projects/etl_machine/data/RELATIONSHIP.csv' WITH DELIMITER E'\t' CSV HEADER QUOTE E'\b';
GO

--Copy data to vocabulary table
COPY cdm.vocabulary FROM '/home/dave/gdrive/code/R/projects/etl_machine/data/VOCABULARY.csv' WITH DELIMITER E'\t' CSV HEADER QUOTE E'\b';
