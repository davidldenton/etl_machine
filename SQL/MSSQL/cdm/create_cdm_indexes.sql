--Select database
USE @database@;
GO

/*ADD PRIMARY KEY CONSTRAINTS TO CDM TABLES*/

--Add PK (xpk_concept) to cdm.concept
IF OBJECT_ID('cdm.xpk_concept', 'PK') IS NULL
	ALTER TABLE cdm.concept ADD CONSTRAINT xpk_concept PRIMARY KEY NONCLUSTERED (concept_id);
GO

--Add PK (xpk_vocabulary) to cdm.vocabulary
IF OBJECT_ID('cdm.xpk_vocabulary', 'PK') IS NULL
	ALTER TABLE cdm.vocabulary ADD CONSTRAINT xpk_vocabulary PRIMARY KEY NONCLUSTERED (vocabulary_id);
GO

--Add PK (xpk_domain) to cdm.domain
IF OBJECT_ID('cdm.xpk_domain', 'PK') IS NULL
	ALTER TABLE cdm.domain ADD CONSTRAINT xpk_domain PRIMARY KEY NONCLUSTERED (domain_id);
GO

--Add PK (xpk_concept_class) to cdm.concept_class
IF OBJECT_ID('cdm.xpk_concept_class', 'PK') IS NULL
	ALTER TABLE cdm.concept_class ADD CONSTRAINT xpk_concept_class PRIMARY KEY NONCLUSTERED (concept_class_id);
GO

--Add PK (xpk_concept_relationship) to cdm.concept_relationship
IF OBJECT_ID('cdm.xpk_concept_relationship', 'PK') IS NULL
	ALTER TABLE cdm.concept_relationship ADD CONSTRAINT xpk_concept_relationship PRIMARY KEY NONCLUSTERED (concept_id_1,concept_id_2,relationship_id);
GO

--Add PK (xpk_relationship) to cdm.relationship
IF OBJECT_ID('cdm.xpk_relationship', 'PK') IS NULL
	ALTER TABLE cdm.relationship ADD CONSTRAINT xpk_relationship PRIMARY KEY NONCLUSTERED (relationship_id);
GO

--Add PK (xpk_concept_ancestor) to cdm.concept_ancestor
IF OBJECT_ID('cdm.xpk_concept_ancestor', 'PK') IS NULL
	ALTER TABLE cdm.concept_ancestor ADD CONSTRAINT xpk_concept_ancestor PRIMARY KEY NONCLUSTERED (ancestor_concept_id,descendant_concept_id);
GO

--Add PK (xpk_source_to_concept_map) to cdm.source_to_concept_map
IF OBJECT_ID('cdm.xpk_source_to_concept_map', 'PK') IS NULL
	ALTER TABLE cdm.source_to_concept_map ADD CONSTRAINT xpk_source_to_concept_map PRIMARY KEY NONCLUSTERED (source_vocabulary_id,target_concept_id,source_code,valid_end_date);
GO

--Add PK (xpk_drug_strength) to cdm.drug_strength
IF OBJECT_ID('cdm.xpk_drug_strength', 'PK') IS NULL
	ALTER TABLE cdm.drug_strength ADD CONSTRAINT xpk_drug_strength PRIMARY KEY NONCLUSTERED (drug_concept_id, ingredient_concept_id);
GO

--Add PK (xpk_cohort_definition) to cdm.cohort_definition
IF OBJECT_ID('cdm.xpk_cohort_definition', 'PK') IS NULL
	ALTER TABLE cdm.cohort_definition ADD CONSTRAINT xpk_cohort_definition PRIMARY KEY NONCLUSTERED (cohort_definition_id);
GO

--Add PK (xpk_attribute_definition) to cdm.attribute_definition
IF OBJECT_ID('cdm.xpk_attribute_definition', 'PK') IS NULL
	ALTER TABLE cdm.attribute_definition ADD CONSTRAINT xpk_attribute_definition PRIMARY KEY NONCLUSTERED (attribute_definition_id);
GO

--Add PK (xpk_person) to cdm.person
IF OBJECT_ID('cdm.xpk_person', 'PK') IS NULL
	ALTER TABLE cdm.person ADD CONSTRAINT xpk_person PRIMARY KEY NONCLUSTERED ( person_id );
GO

--Add PK (xpk_observation_period) to cdm.observation_period
IF OBJECT_ID('cdm.xpk_observation_period', 'PK') IS NULL
	ALTER TABLE cdm.observation_period ADD CONSTRAINT xpk_observation_period PRIMARY KEY NONCLUSTERED ( observation_period_id );A
GO

--Add PK (xpk_specimen) to cdm.specimen
IF OBJECT_ID('cdm.xpk_specimen', 'PK') IS NULL
	ALTER TABLE cdm.specimen ADD CONSTRAINT xpk_specimen PRIMARY KEY NONCLUSTERED ( specimen_id );
GO

--Add PK (xpk_death) to cdm.death
IF OBJECT_ID('cdm.xpk_death', 'PK') IS NULL
	ALTER TABLE cdm.death ADD CONSTRAINT xpk_death PRIMARY KEY NONCLUSTERED ( person_id );
GO

--Add PK (xpk_visit_occurrence) to cdm.visit_occurrence
IF OBJECT_ID('cdm.xpk_visit_occurrence', 'PK') IS NULL
	ALTER TABLE cdm.visit_occurrence ADD CONSTRAINT xpk_visit_occurrence PRIMARY KEY NONCLUSTERED ( visit_occurrence_id );A
GO

--Add PK (xpk_visit_detail) to cdm.visit_detail
IF OBJECT_ID('cdm.xpk_visit_detail', 'PK') IS NULL
	ALTER TABLE cdm.visit_detail ADD CONSTRAINT xpk_visit_detail PRIMARY KEY NONCLUSTERED ( visit_detail_id );
GO

--Add PK (xpk_procedure_occurrence) to cdm.procedure_occurrence
IF OBJECT_ID('cdm.xpk_procedure_occurrence', 'PK') IS NULL
	ALTER TABLE cdm.procedure_occurrence ADD CONSTRAINT xpk_procedure_occurrence PRIMARY KEY NONCLUSTERED ( procedure_occurrence_id );
GO

--Add PK (xpk_drug_exposure) to cdm.drug_exposure
IF OBJECT_ID('cdm.xpk_drug_exposure', 'PK') IS NULL
	ALTER TABLE cdm.drug_exposure ADD CONSTRAINT xpk_drug_exposure PRIMARY KEY NONCLUSTERED ( drug_exposure_id );
GO

--Add PK (xpk_device_exposure) to cdm.device_exposure
IF OBJECT_ID('cdm.xpk_device_exposure', 'PK') IS NULL
	ALTER TABLE cdm.device_exposure ADD CONSTRAINT xpk_device_exposure PRIMARY KEY NONCLUSTERED ( device_exposure_id );
GO

--Add PK (xpk_condition_occurrence) to cdm.condition_occurrence
IF OBJECT_ID('cdm.xpk_condition_occurrence', 'PK') IS NULL
	ALTER TABLE cdm.condition_occurrence ADD CONSTRAINT xpk_condition_occurrence PRIMARY KEY NONCLUSTERED ( condition_occurrence_id );
GO

--Add PK (xpk_measurement) to cdm.measurement
IF OBJECT_ID('cdm.xpk_measurement', 'PK') IS NULL
	ALTER TABLE cdm.measurement ADD CONSTRAINT xpk_measurement PRIMARY KEY NONCLUSTERED ( measurement_id );
GO

--Add PK (xpk_note) to cdm.note
IF OBJECT_ID('cdm.xpk_note', 'PK') IS NULL
	ALTER TABLE cdm.note ADD CONSTRAINT xpk_note PRIMARY KEY NONCLUSTERED ( note_id );
GO

--Add PK (xpk_note_nlp) to cdm.note_nlp
IF OBJECT_ID('cdm.xpk_note_nlp', 'PK') IS NULL
	ALTER TABLE cdm.note_nlp ADD CONSTRAINT xpk_note_nlp PRIMARY KEY NONCLUSTERED ( note_nlp_id );
GO

--Add PK (xpk_observation) to cdm.observation
IF OBJECT_ID('cdm.xpk_observation', 'PK') IS NULL
	ALTER TABLE cdm.observation  ADD CONSTRAINT xpk_observation PRIMARY KEY NONCLUSTERED ( observation_id );
GO

--Add PK (xpk_location) to cdm.location
IF OBJECT_ID('cdm.xpk_location', 'PK') IS NULL
	ALTER TABLE cdm.location ADD CONSTRAINT xpk_location PRIMARY KEY NONCLUSTERED ( location_id );
GO

--Add PK (xpk_care_site) to cdm.care_site
IF OBJECT_ID('cdm.xpk_care_site', 'PK') IS NULL
	ALTER TABLE cdm.care_site ADD CONSTRAINT xpk_care_site PRIMARY KEY NONCLUSTERED ( care_site_id );
GO

--Add PK (xpk_provider) to cdm.provider
IF OBJECT_ID('cdm.xpk_provider', 'PK') IS NULL
	ALTER TABLE cdm.provider ADD CONSTRAINT xpk_provider PRIMARY KEY NONCLUSTERED ( provider_id );
GO

--Add PK (xpk_payer_plan_period) to cdm.payer_plan_period
IF OBJECT_ID('cdm.xpk_payer_plan_period', 'PK') IS NULL
	ALTER TABLE cdm.payer_plan_period ADD CONSTRAINT xpk_payer_plan_period PRIMARY KEY NONCLUSTERED ( payer_plan_period_id );
GO

--Add PK (xpk_visit_cost) to cdm.cost
IF OBJECT_ID('cdm.xpk_visit_cost', 'PK') IS NULL
	ALTER TABLE cdm.cost ADD CONSTRAINT xpk_visit_cost PRIMARY KEY NONCLUSTERED ( cost_id );
GO

--Add PK (xpk_drug_era) to cdm.drug_era
IF OBJECT_ID('cdm.xpk_drug_era', 'PK') IS NULL
	ALTER TABLE cdm.drug_era ADD CONSTRAINT xpk_drug_era PRIMARY KEY NONCLUSTERED ( drug_era_id );
GO

--Add PK (xpk_dose_era) to cdm.dose_era
IF OBJECT_ID('cdm.xpk_dose_era', 'PK') IS NULL
	ALTER TABLE cdm.dose_era  ADD CONSTRAINT xpk_dose_era PRIMARY KEY NONCLUSTERED ( dose_era_id );
GO

--Add PK (xpk_condition_era) to cdm.condition_era
IF OBJECT_ID('cdm.xpk_condition_era', 'PK') IS NULL
	ALTER TABLE cdm.condition_era ADD CONSTRAINT xpk_condition_era PRIMARY KEY NONCLUSTERED ( condition_era_id );
GO

/************************
Indices
************************/

IF NOT EXISTS
	(SELECT * FROM sys.indexes WHERE name = 'idx_concept_concept_id' AND object_id = OBJECT_ID('cdm.concept'))
		BEGIN
			CREATE UNIQUE CLUSTERED INDEX idx_concept_concept_id ON cdm.concept (concept_id ASC);
		END
;
GO

IF NOT EXISTS
	(SELECT * FROM sys.indexes WHERE name = 'idx_concept_code' AND object_id = OBJECT_ID('cdm.concept'))
		BEGIN
			CREATE INDEX idx_concept_code ON cdm.concept (concept_code ASC);
		END
;
GO

IF NOT EXISTS
	(SELECT * FROM sys.indexes WHERE name = 'idx_concept_vocabluary_id' AND object_id = OBJECT_ID('cdm.concept'))
		BEGIN
			CREATE INDEX idx_concept_vocabluary_id ON cdm.concept (vocabulary_id ASC);
		END
;
GO

IF NOT EXISTS
	(SELECT * FROM sys.indexes WHERE name = 'idx_concept_domain_id' AND object_id = OBJECT_ID('cdm.concept'))
		BEGIN
			CREATE INDEX idx_concept_domain_id ON cdm.concept (domain_id ASC);
		END
;
GO

IF NOT EXISTS
	(SELECT * FROM sys.indexes WHERE name = 'idx_concept_class_id' AND object_id = OBJECT_ID('cdm.concept'))
		BEGIN
			CREATE INDEX idx_concept_class_id ON cdm.concept (concept_class_id ASC);
		END
;
GO

IF NOT EXISTS
	(SELECT * FROM sys.indexes WHERE name = 'idx_vocabulary_vocabulary_id' AND object_id = OBJECT_ID('cdm.vocabulary'))
		BEGIN
			CREATE UNIQUE CLUSTERED INDEX idx_vocabulary_vocabulary_id ON cdm.vocabulary (vocabulary_id ASC);
		END
;
GO

IF NOT EXISTS
	(SELECT * FROM sys.indexes WHERE name = 'idx_domain_domain_id' AND object_id = OBJECT_ID('cdm.domain'))
		BEGIN
			CREATE UNIQUE CLUSTERED INDEX idx_domain_domain_id ON cdm.domain (domain_id ASC);
		END
;
GO

IF NOT EXISTS
	(SELECT * FROM sys.indexes WHERE name = 'idx_concept_class_class_id' AND object_id = OBJECT_ID('cdm.concept_class'))
		BEGIN
			CREATE UNIQUE CLUSTERED INDEX idx_concept_class_class_id ON cdm.concept_class (concept_class_id ASC);
		END
;
GO

IF NOT EXISTS
	(SELECT * FROM sys.indexes WHERE name = 'idx_concept_relationship_id_1' AND object_id = OBJECT_ID('cdm.concept_relationship'))
		BEGIN
			CREATE INDEX idx_concept_relationship_id_1 ON cdm.concept_relationship (concept_id_1 ASC);
		END
;
GO

IF NOT EXISTS
	(SELECT * FROM sys.indexes WHERE name = 'idx_concept_relationship_id_2' AND object_id = OBJECT_ID('cdm.concept_relationship'))
		BEGIN
			CREATE INDEX idx_concept_relationship_id_2 ON cdm.concept_relationship (concept_id_2 ASC);
		END
;
GO

IF NOT EXISTS
	(SELECT * FROM sys.indexes WHERE name = 'idx_concept_relationship_id_3' AND object_id = OBJECT_ID('cdm.concept_relationship'))
		BEGIN
			CREATE INDEX idx_concept_relationship_id_3 ON cdm.concept_relationship (relationship_id ASC);
		END
;
GO

IF NOT EXISTS
	(SELECT * FROM sys.indexes WHERE name = 'idx_relationship_rel_id' AND object_id = OBJECT_ID('cdm.relationship'))
		BEGIN
			CREATE UNIQUE CLUSTERED INDEX idx_relationship_rel_id ON cdm.relationship (relationship_id ASC);
		END
;
GO

IF NOT EXISTS
	(SELECT * FROM sys.indexes WHERE name = 'idx_concept_synonym_id' AND object_id = OBJECT_ID('cdm.concept_synonym'))
		BEGIN
			CREATE CLUSTERED INDEX idx_concept_synonym_id ON cdm.concept_synonym (concept_id ASC);
		END
;
GO

IF NOT EXISTS
	(SELECT * FROM sys.indexes WHERE name = 'idx_concept_ancestor_id_1' AND object_id = OBJECT_ID('cdm.concept_ancestor'))
		BEGIN
			CREATE CLUSTERED INDEX idx_concept_ancestor_id_1 ON cdm.concept_ancestor (ancestor_concept_id ASC);
		END
;
GO

IF NOT EXISTS
	(SELECT * FROM sys.indexes WHERE name = 'idx_concept_ancestor_id_2' AND object_id = OBJECT_ID('cdm.concept_ancestor'))
		BEGIN
			CREATE INDEX idx_concept_ancestor_id_2 ON cdm.concept_ancestor (descendant_concept_id ASC);
		END
;
GO

IF NOT EXISTS
	(SELECT * FROM sys.indexes WHERE name = 'idx_source_to_concept_map_id_3' AND object_id = OBJECT_ID('cdm.source_to_concept_map'))
		BEGIN
			CREATE CLUSTERED INDEX idx_source_to_concept_map_id_3 ON cdm.source_to_concept_map (target_concept_id ASC);
		END
;
GO

IF NOT EXISTS
	(SELECT * FROM sys.indexes WHERE name = 'idx_source_to_concept_map_id_1' AND object_id = OBJECT_ID('cdm.source_to_concept_map'))
		BEGIN
			CREATE INDEX idx_source_to_concept_map_id_1 ON cdm.source_to_concept_map (source_vocabulary_id ASC);
		END
;
GO

IF NOT EXISTS
	(SELECT * FROM sys.indexes WHERE name = 'idx_source_to_concept_map_id_2' AND object_id = OBJECT_ID('cdm.source_to_concept_map'))
		BEGIN
			CREATE INDEX idx_source_to_concept_map_id_2 ON cdm.source_to_concept_map (target_vocabulary_id ASC);
		END
;
GO

IF NOT EXISTS
	(SELECT * FROM sys.indexes WHERE name = 'idx_source_to_concept_map_code' AND object_id = OBJECT_ID('cdm.source_to_concept_map'))
		BEGIN
			CREATE INDEX idx_source_to_concept_map_code ON cdm.source_to_concept_map (source_code ASC);
		END
;
GO

IF NOT EXISTS
	(SELECT * FROM sys.indexes WHERE name = 'idx_drug_strength_id_1' AND object_id = OBJECT_ID('cdm.drug_strength'))
		BEGIN
			CREATE CLUSTERED INDEX idx_drug_strength_id_1 ON cdm.drug_strength (drug_concept_id ASC);
		END
;
GO

IF NOT EXISTS
	(SELECT * FROM sys.indexes WHERE name = 'idx_drug_strength_id_2' AND object_id = OBJECT_ID('cdm.drug_strength'))
		BEGIN
			CREATE INDEX idx_drug_strength_id_2 ON cdm.drug_strength (ingredient_concept_id ASC);
		END
;
GO

IF NOT EXISTS
	(SELECT * FROM sys.indexes WHERE name = 'idx_cohort_definition_id' AND object_id = OBJECT_ID('cdm.cohort_definition'))
		BEGIN
			CREATE CLUSTERED INDEX idx_cohort_definition_id ON cdm.cohort_definition (cohort_definition_id ASC);
		END
;
GO

IF NOT EXISTS
	(SELECT * FROM sys.indexes WHERE name = 'idx_attribute_definition_id' AND object_id = OBJECT_ID('cdm.attribute_definition'))
		BEGIN
			CREATE CLUSTERED INDEX idx_attribute_definition_id ON cdm.attribute_definition (attribute_definition_id ASC);
		END
;
GO

IF NOT EXISTS
	(SELECT * FROM sys.indexes WHERE name = 'idx_person_id' AND object_id = OBJECT_ID('cdm.person'))
		BEGIN
			CREATE UNIQUE CLUSTERED INDEX idx_person_id ON cdm.person (person_id ASC);
		END
;
GO

IF NOT EXISTS
	(SELECT * FROM sys.indexes WHERE name = 'idx_observation_period_id' AND object_id = OBJECT_ID('cdm.observation_period'))
		BEGIN
			CREATE CLUSTERED INDEX idx_observation_period_id ON cdm.observation_period (person_id ASC);
		END
;
GO

IF NOT EXISTS
	(SELECT * FROM sys.indexes WHERE name = 'idx_specimen_person_id' AND object_id = OBJECT_ID('cdm.specimen'))
		BEGIN
			CREATE CLUSTERED INDEX idx_specimen_person_id ON cdm.specimen (person_id ASC);
		END
;
GO

IF NOT EXISTS
	(SELECT * FROM sys.indexes WHERE name = 'idx_specimen_concept_id' AND object_id = OBJECT_ID('cdm.specimen'))
		BEGIN
			CREATE INDEX idx_specimen_concept_id ON cdm.specimen (specimen_concept_id ASC);
		END
;
GO

IF NOT EXISTS
	(SELECT * FROM sys.indexes WHERE name = 'idx_death_person_id' AND object_id = OBJECT_ID('cdm.death'))
		BEGIN
			CREATE CLUSTERED INDEX idx_death_person_id ON cdm.death (person_id ASC);
		END
;
GO

IF NOT EXISTS
	(SELECT * FROM sys.indexes WHERE name = 'idx_visit_person_id' AND object_id = OBJECT_ID('cdm.visit_occurrence'))
		BEGIN
			CREATE CLUSTERED INDEX idx_visit_person_id ON cdm.visit_occurrence (person_id ASC);
		END
;
GO

IF NOT EXISTS
	(SELECT * FROM sys.indexes WHERE name = 'idx_visit_concept_id' AND object_id = OBJECT_ID('cdm.visit_occurrence'))
		BEGIN
			CREATE INDEX idx_visit_concept_id ON cdm.visit_occurrence (visit_concept_id ASC);
		END
;
GO

IF NOT EXISTS
	(SELECT * FROM sys.indexes WHERE name = 'idx_visit_detail_person_id' AND object_id = OBJECT_ID('cdm.visit_detail'))
		BEGIN
			CREATE CLUSTERED INDEX idx_visit_detail_person_id ON cdm.visit_detail (person_id ASC);
		END
;
GO

IF NOT EXISTS
	(SELECT * FROM sys.indexes WHERE name = 'idx_visit_detail_concept_id' AND object_id = OBJECT_ID('cdm.visit_detail'))
		BEGIN
			CREATE INDEX idx_visit_detail_concept_id ON cdm.visit_detail (visit_detail_concept_id ASC);
		END
;
GO

IF NOT EXISTS
	(SELECT * FROM sys.indexes WHERE name = 'idx_procedure_person_id' AND object_id = OBJECT_ID('cdm.procedure_occurrence'))
		BEGIN
			CREATE CLUSTERED INDEX idx_procedure_person_id ON cdm.procedure_occurrence (person_id ASC);
		END
;
GO

IF NOT EXISTS
	(SELECT * FROM sys.indexes WHERE name = 'idx_procedure_concept_id' AND object_id = OBJECT_ID('cdm.procedure_occurrence'))
		BEGIN
			CREATE INDEX idx_procedure_concept_id ON cdm.procedure_occurrence (procedure_concept_id ASC);
		END
;
GO

IF NOT EXISTS
	(SELECT * FROM sys.indexes WHERE name = 'idx_procedure_visit_id' AND object_id = OBJECT_ID('cdm.procedure_occurrence'))
		BEGIN
			CREATE INDEX idx_procedure_visit_id ON cdm.procedure_occurrence (visit_occurrence_id ASC);
		END
;
GO

IF NOT EXISTS
	(SELECT * FROM sys.indexes WHERE name = 'idx_drug_person_id' AND object_id = OBJECT_ID('cdm.drug_exposure'))
		BEGIN
			CREATE CLUSTERED INDEX idx_drug_person_id ON cdm.drug_exposure (person_id ASC);
		END
;
GO

IF NOT EXISTS
	(SELECT * FROM sys.indexes WHERE name = 'idx_drug_concept_id' AND object_id = OBJECT_ID('cdm.drug_exposure'))
		BEGIN
			CREATE INDEX idx_drug_concept_id ON cdm.drug_exposure (drug_concept_id ASC);
		END
;
GO

IF NOT EXISTS
	(SELECT * FROM sys.indexes WHERE name = 'idx_drug_visit_id' AND object_id = OBJECT_ID('cdm.drug_exposure'))
		BEGIN
			CREATE INDEX idx_drug_visit_id ON cdm.drug_exposure (visit_occurrence_id ASC);
		END
;
GO

IF NOT EXISTS
	(SELECT * FROM sys.indexes WHERE name = 'idx_device_person_id' AND object_id = OBJECT_ID('cdm.device_exposure'))
		BEGIN
			CREATE CLUSTERED INDEX idx_device_person_id ON cdm.device_exposure (person_id ASC);
		END
;
GO

IF NOT EXISTS
	(SELECT * FROM sys.indexes WHERE name = 'idx_device_concept_id' AND object_id = OBJECT_ID('cdm.device_exposure'))
		BEGIN
			CREATE INDEX idx_device_concept_id ON cdm.device_exposure (device_concept_id ASC);
		END
;
GO

IF NOT EXISTS
	(SELECT * FROM sys.indexes WHERE name = 'idx_device_visit_id' AND object_id = OBJECT_ID('cdm.device_exposure'))
		BEGIN
			CREATE INDEX idx_device_visit_id ON cdm.device_exposure (visit_occurrence_id ASC);
		END
;
GO

IF NOT EXISTS
	(SELECT * FROM sys.indexes WHERE name = 'idx_condition_person_id' AND object_id = OBJECT_ID('cdm.condition_occurrence'))
		BEGIN
			CREATE CLUSTERED INDEX idx_condition_person_id ON cdm.condition_occurrence (person_id ASC);
		END
;
GO

IF NOT EXISTS
	(SELECT * FROM sys.indexes WHERE name = 'idx_condition_concept_id' AND object_id = OBJECT_ID('cdm.condition_occurrence'))
		BEGIN
			CREATE INDEX idx_condition_concept_id ON cdm.condition_occurrence (condition_concept_id ASC);
		END
;
GO

IF NOT EXISTS
	(SELECT * FROM sys.indexes WHERE name = 'idx_condition_visit_id' AND object_id = OBJECT_ID('cdm.condition_occurrence'))
		BEGIN
			CREATE INDEX idx_condition_visit_id ON cdm.condition_occurrence (visit_occurrence_id ASC);
		END
;
GO

IF NOT EXISTS
	(SELECT * FROM sys.indexes WHERE name = 'idx_measurement_person_id' AND object_id = OBJECT_ID('cdm.measurement'))
		BEGIN
			CREATE CLUSTERED INDEX idx_measurement_person_id ON cdm.measurement (person_id ASC);
		END
;
GO

IF NOT EXISTS
	(SELECT * FROM sys.indexes WHERE name = 'idx_measurement_concept_id' AND object_id = OBJECT_ID('cdm.measurement'))
		BEGIN
			CREATE INDEX idx_measurement_concept_id ON cdm.measurement (measurement_concept_id ASC);
		END
;
GO

IF NOT EXISTS
	(SELECT * FROM sys.indexes WHERE name = 'idx_measurement_visit_id' AND object_id = OBJECT_ID('cdm.measurement'))
		BEGIN
			CREATE INDEX idx_measurement_visit_id ON cdm.measurement (visit_occurrence_id ASC);
		END
;
GO

IF NOT EXISTS
	(SELECT * FROM sys.indexes WHERE name = 'idx_observation_person_id' AND object_id = OBJECT_ID('cdm.observation'))
		BEGIN
			CREATE CLUSTERED INDEX idx_observation_person_id ON cdm.observation (person_id ASC);
		END
;
GO

IF NOT EXISTS
	(SELECT * FROM sys.indexes WHERE name = 'idx_observation_concept_id' AND object_id = OBJECT_ID('cdm.observation'))
		BEGIN
			CREATE INDEX idx_observation_concept_id ON cdm.observation (observation_concept_id ASC);
		END
;
GO

IF NOT EXISTS
	(SELECT * FROM sys.indexes WHERE name = 'idx_observation_visit_id' AND object_id = OBJECT_ID('cdm.observation'))
		BEGIN
			CREATE INDEX idx_observation_visit_id ON cdm.observation (visit_occurrence_id ASC);
		END
;
GO

IF NOT EXISTS
	(SELECT * FROM sys.indexes WHERE name = 'idx_fact_relationship_id_1' AND object_id = OBJECT_ID('cdm.fact_relationship'))
		BEGIN
			CREATE INDEX idx_fact_relationship_id_1 ON cdm.fact_relationship (domain_concept_id_1 ASC);
		END
;
GO

IF NOT EXISTS
	(SELECT * FROM sys.indexes WHERE name = 'idx_fact_relationship_id_2' AND object_id = OBJECT_ID('cdm.fact_relationship'))
		BEGIN
			CREATE INDEX idx_fact_relationship_id_2 ON cdm.fact_relationship (domain_concept_id_2 ASC);
		END
;
GO

IF NOT EXISTS
	(SELECT * FROM sys.indexes WHERE name = 'idx_fact_relationship_id_3' AND object_id = OBJECT_ID('cdm.fact_relationship'))
		BEGIN
			CREATE INDEX idx_fact_relationship_id_3 ON cdm.fact_relationship (relationship_concept_id ASC);
		END
;
GO

IF NOT EXISTS
	(SELECT * FROM sys.indexes WHERE name = 'idx_period_person_id' AND object_id = OBJECT_ID('cdm.payer_plan_period'))
		BEGIN
			CREATE CLUSTERED INDEX idx_period_person_id ON cdm.payer_plan_period (person_id ASC);
		END
;
GO

IF NOT EXISTS
	(SELECT * FROM sys.indexes WHERE name = 'idx_drug_era_person_id' AND object_id = OBJECT_ID('cdm.drug_era'))
		BEGIN
			CREATE CLUSTERED INDEX idx_drug_era_person_id ON cdm.drug_era (person_id ASC);
		END
;
GO

IF NOT EXISTS
	(SELECT * FROM sys.indexes WHERE name = 'idx_drug_era_concept_id' AND object_id = OBJECT_ID('cdm.drug_era'))
		BEGIN
			CREATE INDEX idx_drug_era_concept_id ON cdm.drug_era (drug_concept_id ASC);
		END
;
GO

IF NOT EXISTS
	(SELECT * FROM sys.indexes WHERE name = 'idx_condition_era_person_id' AND object_id = OBJECT_ID('cdm.condition_era'))
		BEGIN
			CREATE CLUSTERED INDEX idx_condition_era_person_id ON cdm.condition_era (person_id ASC);
		END
;
GO

IF NOT EXISTS
	(SELECT * FROM sys.indexes WHERE name = 'idx_condition_era_concept_id' AND object_id = OBJECT_ID('cdm.condition_era'))
		BEGIN
			CREATE INDEX idx_condition_era_concept_id ON cdm.condition_era (condition_concept_id ASC);
		END
;