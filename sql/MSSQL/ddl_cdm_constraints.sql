--Select database
USE @database@;
GO

/* CREATE FK CONSTRAINTS */

--Add FK constraint (fpk_concept_domain) to cdm.concept
IF OBJECT_ID('cdm.fpk_concept_domain', 'F') IS NULL
	ALTER TABLE cdm.concept ADD CONSTRAINT fpk_concept_domain FOREIGN KEY (domain_id) REFERENCES cdm.domain (domain_id);
GO

--Add FK constraint (fpk_concept_class) to cdm.concept
IF OBJECT_ID('cdm.fpk_concept_class', 'F') IS NULL
	ALTER TABLE cdm.concept ADD CONSTRAINT fpk_concept_class FOREIGN KEY (concept_class_id) REFERENCES cdm.concept_class (concept_class_id);
GO

--Add FK constraint (fpk_concept_vocabulary) to cdm.concept
IF OBJECT_ID('cdm.fpk_concept_vocabulary', 'F') IS NULL
	ALTER TABLE cdm.concept ADD CONSTRAINT fpk_concept_vocabulary FOREIGN KEY (vocabulary_id) REFERENCES cdm.vocabulary (vocabulary_id);
GO

--Add FK constraint (fpk_vocabulary_concept) to cdm.vocabulary
IF OBJECT_ID('cdm.fpk_vocabulary_concept', 'F') IS NULL
	ALTER TABLE cdm.vocabulary ADD CONSTRAINT fpk_vocabulary_concept FOREIGN KEY (vocabulary_concept_id) REFERENCES cdm.concept (concept_id);
GO

--Add FK constraint (fpk_domain_concept) to cdm.domain
IF OBJECT_ID('cdm.fpk_domain_concept', 'F') IS NULL
	ALTER TABLE cdm.domain ADD CONSTRAINT fpk_domain_concept FOREIGN KEY (domain_concept_id) REFERENCES cdm.concept (concept_id);
GO

--Add FK constraint (fpk_concept_class_concept) to cdm.concept_class
IF OBJECT_ID('cdm.fpk_concept_class_concept', 'F') IS NULL
	ALTER TABLE cdm.concept_class ADD CONSTRAINT fpk_concept_class_concept FOREIGN KEY (concept_class_concept_id) REFERENCES cdm.concept (concept_id);
GO

--Add FK constraint (fpk_concept_relationship_c_1) to cdm.concept_relationship
IF OBJECT_ID('cdm.fpk_concept_relationship_c_1', 'F') IS NULL
	ALTER TABLE cdm.concept_relationship ADD CONSTRAINT fpk_concept_relationship_c_1 FOREIGN KEY (concept_id_1) REFERENCES cdm.concept (concept_id);
GO

--Add FK constraint (fpk_concept_relationship_c_2) to cdm.concept_relationship
IF OBJECT_ID('cdm.fpk_concept_relationship_c_2', 'F') IS NULL
	ALTER TABLE cdm.concept_relationship ADD CONSTRAINT fpk_concept_relationship_c_2 FOREIGN KEY (concept_id_2) REFERENCES cdm.concept (concept_id);
GO

--Add FK constraint (fpk_concept_relationship_id) to cdm.concept_relationship
IF OBJECT_ID('cdm.fpk_concept_relationship_id', 'F') IS NULL
	ALTER TABLE cdm.concept_relationship ADD CONSTRAINT fpk_concept_relationship_id FOREIGN KEY (relationship_id) REFERENCES cdm.relationship (relationship_id);
GO

--Add FK constraint (fpk_relationship_concept) to cdm.relationship
IF OBJECT_ID('cdm.fpk_relationship_concept', 'F') IS NULL
	ALTER TABLE cdm.relationship ADD CONSTRAINT fpk_relationship_concept FOREIGN KEY (relationship_concept_id) REFERENCES cdm.concept (concept_id);
GO

--Add FK constraint (fpk_relationship_reverse) to cdm.relationship
IF OBJECT_ID('cdm.fpk_relationship_reverse', 'F') IS NULL
	ALTER TABLE cdm.relationship ADD CONSTRAINT fpk_relationship_reverse FOREIGN KEY (reverse_relationship_id) REFERENCES cdm.relationship (relationship_id);
GO

--Add FK constraint (fpk_concept_synonym_concept) to cdm.concept_synonym
IF OBJECT_ID('cdm.fpk_concept_synonym_concept', 'F') IS NULL
	ALTER TABLE cdm.concept_synonym ADD CONSTRAINT fpk_concept_synonym_concept FOREIGN KEY (concept_id) REFERENCES cdm.concept (concept_id);
GO

--Add FK constraint (fpk_concept_synonym_language) to cdm.concept_synonym
IF OBJECT_ID('cdm.fpk_concept_synonym_language', 'F') IS NULL
	ALTER TABLE cdm.concept_synonym ADD CONSTRAINT fpk_concept_synonym_language FOREIGN KEY (language_concept_id) REFERENCES cdm.concept (concept_id);
GO

--Add FK constraint (fpk_concept_ancestor_concept_1) to cdm.concept_ancestor
IF OBJECT_ID('cdm.fpk_concept_ancestor_concept_1', 'F') IS NULL
	ALTER TABLE cdm.concept_ancestor ADD CONSTRAINT fpk_concept_ancestor_concept_1 FOREIGN KEY (ancestor_concept_id) REFERENCES cdm.concept (concept_id);
GO

--Add FK constraint (fpk_concept_ancestor_concept_2) to cdm.concept_ancestor
IF OBJECT_ID('cdm.fpk_concept_ancestor_concept_2', 'F') IS NULL
	ALTER TABLE cdm.concept_ancestor ADD CONSTRAINT fpk_concept_ancestor_concept_2 FOREIGN KEY (descendant_concept_id) REFERENCES cdm.concept (concept_id);
GO

--Add FK constraint (fpk_source_to_concept_map_v_1) to cdm.source_to_concept_map
IF OBJECT_ID('cdm.fpk_source_to_concept_map_v_1', 'F') IS NULL
	ALTER TABLE cdm.source_to_concept_map ADD CONSTRAINT fpk_source_to_concept_map_v_1 FOREIGN KEY (source_vocabulary_id) REFERENCES cdm.vocabulary (vocabulary_id);
GO

--Add FK constraint (fpk_source_concept_id) to cdm.source_to_concept_map
IF OBJECT_ID('cdm.fpk_source_concept_id', 'F') IS NULL
	ALTER TABLE cdm.source_to_concept_map ADD CONSTRAINT fpk_source_concept_id FOREIGN KEY (source_concept_id) REFERENCES cdm.concept (concept_id);
GO

--Add FK constraint (fpk_source_to_concept_map_v_2) to cdm.source_to_concept_map
IF OBJECT_ID('cdm.fpk_source_to_concept_map_v_2', 'F') IS NULL
	ALTER TABLE cdm.source_to_concept_map ADD CONSTRAINT fpk_source_to_concept_map_v_2 FOREIGN KEY (target_vocabulary_id) REFERENCES cdm.vocabulary (vocabulary_id);
GO

--Add FK constraint (fpk_source_to_concept_map_c_1) to cdm.source_to_concept_map
IF OBJECT_ID('cdm.fpk_source_to_concept_map_c_1', 'F') IS NULL
	ALTER TABLE cdm.source_to_concept_map ADD CONSTRAINT fpk_source_to_concept_map_c_1 FOREIGN KEY (target_concept_id) REFERENCES cdm.concept (concept_id);
GO

--Add FK constraint (fpk_drug_strength_concept_1) to cdm.drug_strength
IF OBJECT_ID('cdm.fpk_drug_strength_concept_1', 'F') IS NULL
	ALTER TABLE cdm.drug_strength ADD CONSTRAINT fpk_drug_strength_concept_1 FOREIGN KEY (drug_concept_id) REFERENCES cdm.concept (concept_id);
GO

--Add FK constraint (fpk_drug_strength_concept_2) to cdm.drug_strength
IF OBJECT_ID('cdm.fpk_drug_strength_concept_2', 'F') IS NULL
	ALTER TABLE cdm.drug_strength ADD CONSTRAINT fpk_drug_strength_concept_2 FOREIGN KEY (ingredient_concept_id) REFERENCES cdm.concept (concept_id);
GO

--Add FK constraint (fpk_drug_strength_unit_1) to cdm.drug_strength
IF OBJECT_ID('cdm.fpk_drug_strength_unit_1', 'F') IS NULL
	ALTER TABLE cdm.drug_strength ADD CONSTRAINT fpk_drug_strength_unit_1 FOREIGN KEY (amount_unit_concept_id) REFERENCES cdm.concept (concept_id);
GO

--Add FK constraint (fpk_drug_strength_unit_2) to cdm.drug_strength
IF OBJECT_ID('cdm.fpk_drug_strength_unit_2', 'F') IS NULL
	ALTER TABLE cdm.drug_strength ADD CONSTRAINT fpk_drug_strength_unit_2 FOREIGN KEY (numerator_unit_concept_id) REFERENCES cdm.concept (concept_id);
GO

--Add FK constraint (fpk_drug_strength_unit_3) to cdm.drug_strength
IF OBJECT_ID('cdm.fpk_drug_strength_unit_3', 'F') IS NULL
	ALTER TABLE cdm.drug_strength ADD CONSTRAINT fpk_drug_strength_unit_3 FOREIGN KEY (denominator_unit_concept_id) REFERENCES cdm.concept (concept_id);
GO

--Add FK constraint (fpk_person_gender_concept) to cdm.person
IF OBJECT_ID('cdm.fpk_person_gender_concept', 'F') IS NULL
	ALTER TABLE cdm.person ADD CONSTRAINT fpk_person_gender_concept FOREIGN KEY (gender_concept_id) REFERENCES cdm.concept (concept_id);
GO

--Add FK constraint (fpk_person_race_concept) to cdm.person
IF OBJECT_ID('cdm.fpk_person_race_concept', 'F') IS NULL
	ALTER TABLE cdm.person ADD CONSTRAINT fpk_person_race_concept FOREIGN KEY (race_concept_id) REFERENCES cdm.concept (concept_id);
GO

--Add FK constraint (fpk_person_ethnicity_concept) to cdm.person
IF OBJECT_ID('cdm.fpk_person_ethnicity_concept', 'F') IS NULL
	ALTER TABLE cdm.person ADD CONSTRAINT fpk_person_ethnicity_concept FOREIGN KEY (ethnicity_concept_id) REFERENCES cdm.concept (concept_id);
GO

--Add FK constraint (fpk_person_gender_concept_s) to cdm.person
IF OBJECT_ID('cdm.fpk_person_gender_concept_s', 'F') IS NULL
	ALTER TABLE cdm.person ADD CONSTRAINT fpk_person_gender_concept_s FOREIGN KEY (gender_source_concept_id) REFERENCES cdm.concept (concept_id);
GO

--Add FK constraint (fpk_person_race_concept_s) to cdm.person
IF OBJECT_ID('cdm.fpk_person_race_concept_s', 'F') IS NULL
	ALTER TABLE cdm.person ADD CONSTRAINT fpk_person_race_concept_s FOREIGN KEY (race_source_concept_id) REFERENCES cdm.concept (concept_id);
GO

--Add FK constraint (fpk_person_ethnicity_concept_s) to cdm.person
IF OBJECT_ID('cdm.fpk_person_ethnicity_concept_s', 'F') IS NULL
	ALTER TABLE cdm.person ADD CONSTRAINT fpk_person_ethnicity_concept_s FOREIGN KEY (ethnicity_source_concept_id) REFERENCES cdm.concept (concept_id);
GO

--Add FK constraint (fpk_person_location) to cdm.person
IF OBJECT_ID('cdm.fpk_person_location', 'F') IS NULL
	ALTER TABLE cdm.person ADD CONSTRAINT fpk_person_location FOREIGN KEY (location_id) REFERENCES cdm.location (location_id);
GO

--Add FK constraint (fpk_person_provider) to cdm.person
IF OBJECT_ID('cdm.fpk_person_provider', 'F') IS NULL
	ALTER TABLE cdm.person ADD CONSTRAINT fpk_person_provider FOREIGN KEY (provider_id) REFERENCES cdm.provider (provider_id);
GO

--Add FK constraint (fpk_person_care_site) to cdm.person
IF OBJECT_ID('cdm.fpk_person_care_site', 'F') IS NULL
	ALTER TABLE cdm.person ADD CONSTRAINT fpk_person_care_site FOREIGN KEY (care_site_id) REFERENCES cdm.care_site (care_site_id);
GO

--Add FK constraint (fpk_observation_period_person) to cdm.observation_period
IF OBJECT_ID('cdm.fpk_observation_period_person', 'F') IS NULL
	ALTER TABLE cdm.observation_period ADD CONSTRAINT fpk_observation_period_person FOREIGN KEY (person_id) REFERENCES cdm.person (person_id);
GO

--Add FK constraint (fpk_observation_period_concept) to cdm.observation_period
IF OBJECT_ID('cdm.fpk_observation_period_concept', 'F') IS NULL
	ALTER TABLE cdm.observation_period ADD CONSTRAINT fpk_observation_period_concept FOREIGN KEY (period_type_concept_id) REFERENCES cdm.concept (concept_id);
GO

--Add FK constraint (fpk_specimen_person) to cdm.specimen
IF OBJECT_ID('cdm.fpk_specimen_person', 'F') IS NULL
	ALTER TABLE cdm.specimen ADD CONSTRAINT fpk_specimen_person FOREIGN KEY (person_id) REFERENCES cdm.person (person_id);
GO

--Add FK constraint (fpk_specimen_concept) to cdm.specimen
IF OBJECT_ID('cdm.fpk_specimen_concept', 'F') IS NULL
	ALTER TABLE cdm.specimen ADD CONSTRAINT fpk_specimen_concept FOREIGN KEY (specimen_concept_id) REFERENCES cdm.concept (concept_id);
GO

--Add FK constraint (fpk_specimen_type_concept) to cdm.specimen
IF OBJECT_ID('cdm.fpk_specimen_type_concept', 'F') IS NULL
	ALTER TABLE cdm.specimen ADD CONSTRAINT fpk_specimen_type_concept FOREIGN KEY (specimen_type_concept_id) REFERENCES cdm.concept (concept_id);
GO

--Add FK constraint (fpk_specimen_unit_concept) to cdm.specimen
IF OBJECT_ID('cdm.fpk_specimen_unit_concept', 'F') IS NULL
	ALTER TABLE cdm.specimen ADD CONSTRAINT fpk_specimen_unit_concept FOREIGN KEY (unit_concept_id) REFERENCES cdm.concept (concept_id);
GO

--Add FK constraint (fpk_specimen_site_concept) to cdm.specimen
IF OBJECT_ID('cdm.fpk_specimen_site_concept', 'F') IS NULL
	ALTER TABLE cdm.specimen ADD CONSTRAINT fpk_specimen_site_concept FOREIGN KEY (anatomic_site_concept_id) REFERENCES cdm.concept (concept_id);
GO

--Add FK constraint (fpk_specimen_status_concept) to cdm.specimen
IF OBJECT_ID('cdm.fpk_specimen_status_concept', 'F') IS NULL
	ALTER TABLE cdm.specimen ADD CONSTRAINT fpk_specimen_status_concept FOREIGN KEY (disease_status_concept_id) REFERENCES cdm.concept (concept_id);
GO

--Add FK constraint (fpk_death_person) to cdm.death
IF OBJECT_ID('cdm.fpk_death_person', 'F') IS NULL
	ALTER TABLE cdm.death ADD CONSTRAINT fpk_death_person FOREIGN KEY (person_id) REFERENCES cdm.person (person_id);
GO

--Add FK constraint (fpk_death_type_concept) to cdm.death
IF OBJECT_ID('cdm.fpk_death_type_concept', 'F') IS NULL
	ALTER TABLE cdm.death ADD CONSTRAINT fpk_death_type_concept FOREIGN KEY (death_type_concept_id) REFERENCES cdm.concept (concept_id);
GO

--Add FK constraint (fpk_death_cause_concept) to cdm.death
IF OBJECT_ID('cdm.fpk_death_cause_concept', 'F') IS NULL
	ALTER TABLE cdm.death ADD CONSTRAINT fpk_death_cause_concept FOREIGN KEY (cause_concept_id) REFERENCES cdm.concept (concept_id);
GO

--Add FK constraint (fpk_death_cause_concept_s) to cdm.death
IF OBJECT_ID('cdm.fpk_death_cause_concept_s', 'F') IS NULL
	ALTER TABLE cdm.death ADD CONSTRAINT fpk_death_cause_concept_s FOREIGN KEY (cause_source_concept_id) REFERENCES cdm.concept (concept_id);
GO

--Add FK constraint (fpk_visit_person) to cdm.visit_occurrence
IF OBJECT_ID('cdm.fpk_visit_person', 'F') IS NULL
	ALTER TABLE cdm.visit_occurrence ADD CONSTRAINT fpk_visit_person FOREIGN KEY (person_id) REFERENCES cdm.person (person_id);
GO

--Add FK constraint (fpk_visit_type_concept) to cdm.visit_occurrence
IF OBJECT_ID('cdm.fpk_visit_type_concept', 'F') IS NULL
	ALTER TABLE cdm.visit_occurrence ADD CONSTRAINT fpk_visit_type_concept FOREIGN KEY (visit_type_concept_id) REFERENCES cdm.concept (concept_id);
GO

--Add FK constraint (fpk_visit_provider) to cdm.visit_occurrence
IF OBJECT_ID('cdm.fpk_visit_provider', 'F') IS NULL
	ALTER TABLE cdm.visit_occurrence ADD CONSTRAINT fpk_visit_provider FOREIGN KEY (provider_id) REFERENCES cdm.provider (provider_id);
GO

--Add FK constraint (fpk_visit_care_site) to cdm.visit_occurrence
IF OBJECT_ID('cdm.fpk_visit_care_site', 'F') IS NULL
	ALTER TABLE cdm.visit_occurrence ADD CONSTRAINT fpk_visit_care_site FOREIGN KEY (care_site_id) REFERENCES cdm.care_site (care_site_id);
GO

--Add FK constraint (fpk_) to cdm.visit_occurrence
IF OBJECT_ID('cdm.fpk_', 'F') IS NULL
	ALTER TABLE cdm.visit_occurrence ADD CONSTRAINT fpk_ visit_concept_s FOREIGN KEY (visit_source_concept_id) REFERENCES cdm.concept (concept_id);
GO

--Add FK constraint (fpk_visit_admitting_s) to cdm.visit_occurrence
IF OBJECT_ID('cdm.fpk_visit_admitting_s', 'F') IS NULL
	ALTER TABLE cdm.visit_occurrence ADD CONSTRAINT fpk_visit_admitting_s FOREIGN KEY (admitting_source_concept_id) REFERENCES cdm.concept (concept_id);
GO

--Add FK constraint (fpk_visit_discharge) to cdm.visit_occurrence
IF OBJECT_ID('cdm.fpk_visit_discharge', 'F') IS NULL
	ALTER TABLE cdm.visit_occurrence ADD CONSTRAINT fpk_visit_discharge FOREIGN KEY (discharge_to_concept_id) REFERENCES cdm.concept (concept_id);
GO

--Add FK constraint (fpk_visit_preceding) to cdm.visit_occurrence
IF OBJECT_ID('cdm.fpk_visit_preceding', 'F') IS NULL
	ALTER TABLE cdm.visit_occurrence ADD CONSTRAINT fpk_visit_preceding FOREIGN KEY (preceding_visit_occurrence_id) REFERENCES cdm.visit_occurrence (visit_occurrence_id);
GO

--Add FK constraint (fpk_v_detail_person) to cdm.visit_detail
IF OBJECT_ID('cdm.fpk_v_detail_person', 'F') IS NULL
	ALTER TABLE cdm.visit_detail ADD CONSTRAINT fpk_v_detail_person FOREIGN KEY (person_id) REFERENCES cdm.person (person_id);
GO

--Add FK constraint (fpk_v_detail_type_concept) to cdm.visit_detail
IF OBJECT_ID('cdm.fpk_v_detail_type_concept', 'F') IS NULL
	ALTER TABLE cdm.visit_detail ADD CONSTRAINT fpk_v_detail_type_concept FOREIGN KEY (visit_detail_type_concept_id) REFERENCES cdm.concept (concept_id);
GO

--Add FK constraint (fpk_v_detail_provider) to cdm.visit_detail
IF OBJECT_ID('cdm.fpk_v_detail_provider', 'F') IS NULL
	ALTER TABLE cdm.visit_detail ADD CONSTRAINT fpk_v_detail_provider FOREIGN KEY (provider_id) REFERENCES cdm.provider (provider_id);
GO

--Add FK constraint (fpk_v_detail_care_site) to cdm.visit_detail
IF OBJECT_ID('cdm.fpk_v_detail_care_site', 'F') IS NULL
	ALTER TABLE cdm.visit_detail ADD CONSTRAINT fpk_v_detail_care_site FOREIGN KEY (care_site_id) REFERENCES cdm.care_site (care_site_id);
GO

--Add FK constraint (fpk_v_detail_concept_s) to cdm.visit_detail
IF OBJECT_ID('cdm.fpk_v_detail_concept_s', 'F') IS NULL
	ALTER TABLE cdm.visit_detail ADD CONSTRAINT fpk_v_detail_concept_s FOREIGN KEY (visit_detail_source_concept_id) REFERENCES cdm.concept (concept_id);
GO

--Add FK constraint (fpk_v_detail_admitting_s) to cdm.visit_detail
IF OBJECT_ID('cdm.fpk_v_detail_admitting_s', 'F') IS NULL
	ALTER TABLE cdm.visit_detail ADD CONSTRAINT fpk_v_detail_admitting_s FOREIGN KEY (admitting_source_concept_id) REFERENCES cdm.concept (concept_id);
GO

--Add FK constraint (fpk_v_detail_discharge) to cdm.visit_detail
IF OBJECT_ID('cdm.fpk_v_detail_discharge', 'F') IS NULL
	ALTER TABLE cdm.visit_detail ADD CONSTRAINT fpk_v_detail_discharge FOREIGN KEY (discharge_to_concept_id) REFERENCES cdm.concept (concept_id);
GO

--Add FK constraint (fpk_v_detail_preceding) to cdm.visit_detail
IF OBJECT_ID('cdm.fpk_v_detail_preceding', 'F') IS NULL
	ALTER TABLE cdm.visit_detail ADD CONSTRAINT fpk_v_detail_preceding FOREIGN KEY (preceding_visit_detail_id) REFERENCES cdm.visit_detail (visit_detail_id);
GO

--Add FK constraint (fpk_v_detail_parent) to cdm.visit_detail
IF OBJECT_ID('cdm.fpk_v_detail_parent', 'F') IS NULL
	ALTER TABLE cdm.visit_detail ADD CONSTRAINT fpk_v_detail_parent FOREIGN KEY (visit_detail_parent_id) REFERENCES cdm.visit_detail (visit_detail_id);
GO

--Add FK constraint (fpd_v_detail_visit) to cdm.visit_detail
IF OBJECT_ID('cdm.fpd_v_detail_visit', 'F') IS NULL
	ALTER TABLE cdm.visit_detail ADD CONSTRAINT fpd_v_detail_visit FOREIGN KEY (visit_occurrence_id) REFERENCES cdm.visit_occurrence (visit_occurrence_id);
GO

--Add FK constraint (fpk_procedure_person) to cdm.procedure_occurrence
IF OBJECT_ID('cdm.fpk_procedure_person', 'F') IS NULL
	ALTER TABLE cdm.procedure_occurrence ADD CONSTRAINT fpk_procedure_person FOREIGN KEY (person_id) REFERENCES cdm.person (person_id);
GO

--Add FK constraint (fpk_procedure_concept) to cdm.procedure_occurrence
IF OBJECT_ID('cdm.fpk_procedure_concept', 'F') IS NULL
	ALTER TABLE cdm.procedure_occurrence ADD CONSTRAINT fpk_procedure_concept FOREIGN KEY (procedure_concept_id) REFERENCES cdm.concept (concept_id);
GO

--Add FK constraint (fpk_procedure_type_concept) to cdm.procedure_occurrence
IF OBJECT_ID('cdm.fpk_procedure_type_concept', 'F') IS NULL
	ALTER TABLE cdm.procedure_occurrence ADD CONSTRAINT fpk_procedure_type_concept FOREIGN KEY (procedure_type_concept_id) REFERENCES cdm.concept (concept_id);
GO

--Add FK constraint (fpk_procedure_modifier) to cdm.procedure_occurrence
IF OBJECT_ID('cdm.fpk_procedure_modifier', 'F') IS NULL
	ALTER TABLE cdm.procedure_occurrence ADD CONSTRAINT fpk_procedure_modifier FOREIGN KEY (modifier_concept_id) REFERENCES cdm.concept (concept_id);
GO

--Add FK constraint (fpk_procedure_provider) to cdm.procedure_occurrence
IF OBJECT_ID('cdm.fpk_procedure_provider', 'F') IS NULL
	ALTER TABLE cdm.procedure_occurrence ADD CONSTRAINT fpk_procedure_provider FOREIGN KEY (provider_id) REFERENCES cdm.provider (provider_id);
GO

--Add FK constraint (fpk_procedure_visit) to cdm.procedure_occurrence
IF OBJECT_ID('cdm.fpk_procedure_visit', 'F') IS NULL
	ALTER TABLE cdm.procedure_occurrence ADD CONSTRAINT fpk_procedure_visit FOREIGN KEY (visit_occurrence_id) REFERENCES cdm.visit_occurrence (visit_occurrence_id);
GO

--Add FK constraint (fpk_procedure_concept_s) to cdm.procedure_occurrence
IF OBJECT_ID('cdm.fpk_procedure_concept_s', 'F') IS NULL
	ALTER TABLE cdm.procedure_occurrence ADD CONSTRAINT fpk_procedure_concept_s FOREIGN KEY (procedure_source_concept_id) REFERENCES cdm.concept (concept_id);
GO

--Add FK constraint (fpk_drug_person) to cdm.drug_exposure
IF OBJECT_ID('cdm.fpk_drug_person', 'F') IS NULL
	ALTER TABLE cdm.drug_exposure ADD CONSTRAINT fpk_drug_person FOREIGN KEY (person_id) REFERENCES cdm.person (person_id);
GO

--Add FK constraint (fpk_drug_concept) to cdm.drug_exposure
IF OBJECT_ID('cdm.fpk_drug_concept', 'F') IS NULL
	ALTER TABLE cdm.drug_exposure ADD CONSTRAINT fpk_drug_concept FOREIGN KEY (drug_concept_id) REFERENCES cdm.concept (concept_id);
GO

--Add FK constraint (fpk_drug_type_concept) to cdm.drug_exposure
IF OBJECT_ID('cdm.fpk_drug_type_concept', 'F') IS NULL
	ALTER TABLE cdm.drug_exposure ADD CONSTRAINT fpk_drug_type_concept FOREIGN KEY (drug_type_concept_id) REFERENCES cdm.concept (concept_id);
GO

--Add FK constraint (fpk_drug_route_concept) to cdm.drug_exposure
IF OBJECT_ID('cdm.fpk_drug_route_concept', 'F') IS NULL
	ALTER TABLE cdm.drug_exposure ADD CONSTRAINT fpk_drug_route_concept FOREIGN KEY (route_concept_id) REFERENCES cdm.concept (concept_id);
GO

--Add FK constraint (fpk_drug_provider) to cdm.drug_exposure
IF OBJECT_ID('cdm.fpk_drug_provider', 'F') IS NULL
	ALTER TABLE cdm.drug_exposure ADD CONSTRAINT fpk_drug_provider FOREIGN KEY (provider_id) REFERENCES cdm.provider (provider_id);
GO

--Add FK constraint (fpk_drug_visit) to cdm.drug_exposure
IF OBJECT_ID('cdm.fpk_drug_visit', 'F') IS NULL
	ALTER TABLE cdm.drug_exposure ADD CONSTRAINT fpk_drug_visit FOREIGN KEY (visit_occurrence_id) REFERENCES cdm.visit_occurrence (visit_occurrence_id);
GO

--Add FK constraint (fpk_drug_concept_s) to cdm.drug_exposure
IF OBJECT_ID('cdm.fpk_drug_concept_s', 'F') IS NULL
	ALTER TABLE cdm.drug_exposure ADD CONSTRAINT fpk_drug_concept_s FOREIGN KEY (drug_source_concept_id) REFERENCES cdm.concept (concept_id);
GO

--Add FK constraint (fpk_device_person) to cdm.device_exposure
IF OBJECT_ID('cdm.fpk_device_person', 'F') IS NULL
	ALTER TABLE cdm.device_exposure ADD CONSTRAINT fpk_device_person FOREIGN KEY (person_id) REFERENCES cdm.person (person_id);
GO

--Add FK constraint (fpk_device_concept) to cdm.device_exposure
IF OBJECT_ID('cdm.fpk_device_concept', 'F') IS NULL
	ALTER TABLE cdm.device_exposure ADD CONSTRAINT fpk_device_concept FOREIGN KEY (device_concept_id) REFERENCES cdm.concept (concept_id);
GO

--Add FK constraint (fpk_device_type_concept) to cdm.device_exposure
IF OBJECT_ID('cdm.fpk_device_type_concept', 'F') IS NULL
	ALTER TABLE cdm.device_exposure ADD CONSTRAINT fpk_device_type_concept FOREIGN KEY (device_type_concept_id) REFERENCES cdm.concept (concept_id);
GO

--Add FK constraint (fpk_device_provider) to cdm.device_exposure
IF OBJECT_ID('cdm.fpk_device_provider', 'F') IS NULL
	ALTER TABLE cdm.device_exposure ADD CONSTRAINT fpk_device_provider FOREIGN KEY (provider_id) REFERENCES cdm.provider (provider_id);
GO

--Add FK constraint (fpk_device_visit) to cdm.device_exposure
IF OBJECT_ID('cdm.fpk_device_visit', 'F') IS NULL
	ALTER TABLE cdm.device_exposure ADD CONSTRAINT fpk_device_visit FOREIGN KEY (visit_occurrence_id) REFERENCES cdm.visit_occurrence (visit_occurrence_id);
GO

--Add FK constraint (fpk_device_concept_s) to cdm.device_exposure
IF OBJECT_ID('cdm.fpk_device_concept_s', 'F') IS NULL
	ALTER TABLE cdm.device_exposure ADD CONSTRAINT fpk_device_concept_s FOREIGN KEY (device_source_concept_id) REFERENCES cdm.concept (concept_id);
GO

--Add FK constraint (fpk_condition_person) to cdm.condition_occurrence
IF OBJECT_ID('cdm.fpk_condition_person', 'F') IS NULL
	ALTER TABLE cdm.condition_occurrence ADD CONSTRAINT fpk_condition_person FOREIGN KEY (person_id) REFERENCES cdm.person (person_id);
GO

--Add FK constraint (fpk_condition_concept) to cdm.condition_occurrence
IF OBJECT_ID('cdm.fpk_condition_concept', 'F') IS NULL
	ALTER TABLE cdm.condition_occurrence ADD CONSTRAINT fpk_condition_concept FOREIGN KEY (condition_concept_id) REFERENCES cdm.concept (concept_id);
GO

--Add FK constraint (fpk_condition_type_concept) to cdm.condition_occurrence
IF OBJECT_ID('cdm.fpk_condition_type_concept', 'F') IS NULL
	ALTER TABLE cdm.condition_occurrence ADD CONSTRAINT fpk_condition_type_concept FOREIGN KEY (condition_type_concept_id) REFERENCES cdm.concept (concept_id);
GO

--Add FK constraint (fpk_condition_provider) to cdm.condition_occurrence
IF OBJECT_ID('cdm.fpk_condition_provider', 'F') IS NULL
	ALTER TABLE cdm.condition_occurrence ADD CONSTRAINT fpk_condition_provider FOREIGN KEY (provider_id) REFERENCES cdm.provider (provider_id);
GO

--Add FK constraint (fpk_condition_visit) to cdm.condition_occurrence
IF OBJECT_ID('cdm.fpk_condition_visit', 'F') IS NULL
	ALTER TABLE cdm.condition_occurrence ADD CONSTRAINT fpk_condition_visit FOREIGN KEY (visit_occurrence_id) REFERENCES cdm.visit_occurrence (visit_occurrence_id);
GO

--Add FK constraint (fpk_condition_concept_s) to cdm.condition_occurrence
IF OBJECT_ID('cdm.fpk_condition_concept_s', 'F') IS NULL
	ALTER TABLE cdm.condition_occurrence ADD CONSTRAINT fpk_condition_concept_s FOREIGN KEY (condition_source_concept_id) REFERENCES cdm.concept (concept_id);
GO

--Add FK constraint (fpk_condition_status_concept) to cdm.condition_occurrence
IF OBJECT_ID('cdm.fpk_condition_status_concept', 'F') IS NULL
	ALTER TABLE cdm.condition_occurrence ADD CONSTRAINT fpk_condition_status_concept FOREIGN KEY (condition_status_concept_id) REFERENCES cdm.concept (concept_id);
GO

--Add FK constraint (fpk_measurement_person) to cdm.measurement
IF OBJECT_ID('cdm.fpk_measurement_person', 'F') IS NULL
	ALTER TABLE cdm.measurement ADD CONSTRAINT fpk_measurement_person FOREIGN KEY (person_id) REFERENCES cdm.person (person_id);
GO

--Add FK constraint (fpk_measurement_concept) to cdm.measurement
IF OBJECT_ID('cdm.fpk_measurement_concept', 'F') IS NULL
	ALTER TABLE cdm.measurement ADD CONSTRAINT fpk_measurement_concept FOREIGN KEY (measurement_concept_id) REFERENCES cdm.concept (concept_id);
GO

--Add FK constraint (fpk_measurement_type_concept) to cdm.measurement
IF OBJECT_ID('cdm.fpk_measurement_type_concept', 'F') IS NULL
	ALTER TABLE cdm.measurement ADD CONSTRAINT fpk_measurement_type_concept FOREIGN KEY (measurement_type_concept_id) REFERENCES cdm.concept (concept_id);
GO

--Add FK constraint (fpk_measurement_operator) to cdm.measurement
IF OBJECT_ID('cdm.fpk_measurement_operator', 'F') IS NULL
	ALTER TABLE cdm.measurement ADD CONSTRAINT fpk_measurement_operator FOREIGN KEY (operator_concept_id) REFERENCES cdm.concept (concept_id);
GO

--Add FK constraint (fpk_measurement_value) to cdm.measurement
IF OBJECT_ID('cdm.fpk_measurement_value', 'F') IS NULL
	ALTER TABLE cdm.measurement ADD CONSTRAINT fpk_measurement_value FOREIGN KEY (value_as_concept_id) REFERENCES cdm.concept (concept_id);
GO

--Add FK constraint (fpk_measurement_unit) to cdm.measurement
IF OBJECT_ID('cdm.fpk_measurement_unit', 'F') IS NULL
	ALTER TABLE cdm.measurement ADD CONSTRAINT fpk_measurement_unit FOREIGN KEY (unit_concept_id) REFERENCES cdm.concept (concept_id);
GO

--Add FK constraint (fpk_measurement_provider) to cdm.measurement
IF OBJECT_ID('cdm.fpk_measurement_provider', 'F') IS NULL
	ALTER TABLE cdm.measurement ADD CONSTRAINT fpk_measurement_provider FOREIGN KEY (provider_id) REFERENCES cdm.provider (provider_id);
GO

--Add FK constraint (fpk_measurement_visit) to cdm.measurement
IF OBJECT_ID('cdm.fpk_measurement_visit', 'F') IS NULL
	ALTER TABLE cdm.measurement ADD CONSTRAINT fpk_measurement_visit FOREIGN KEY (visit_occurrence_id) REFERENCES cdm.visit_occurrence (visit_occurrence_id);
GO

--Add FK constraint (fpk_measurement_concept_s) to cdm.measurement
IF OBJECT_ID('cdm.fpk_measurement_concept_s', 'F') IS NULL
	ALTER TABLE cdm.measurement ADD CONSTRAINT fpk_measurement_concept_s FOREIGN KEY (measurement_source_concept_id) REFERENCES cdm.concept (concept_id);
GO

--Add FK constraint (fpk_observation_person) to cdm.observation
IF OBJECT_ID('cdm.fpk_observation_person', 'F') IS NULL
	ALTER TABLE cdm.observation ADD CONSTRAINT fpk_observation_person FOREIGN KEY (person_id) REFERENCES cdm.person (person_id);
GO

--Add FK constraint (fpk_observation_concept) to cdm.observation
IF OBJECT_ID('cdm.fpk_observation_concept', 'F') IS NULL
	ALTER TABLE cdm.observation ADD CONSTRAINT fpk_observation_concept FOREIGN KEY (observation_concept_id) REFERENCES cdm.concept (concept_id);
GO

--Add FK constraint (fpk_observation_type_concept) to cdm.observation
IF OBJECT_ID('cdm.fpk_observation_type_concept', 'F') IS NULL
	ALTER TABLE cdm.observation ADD CONSTRAINT fpk_observation_type_concept FOREIGN KEY (observation_type_concept_id) REFERENCES cdm.concept (concept_id);
GO

--Add FK constraint (fpk_observation_value) to cdm.observation
IF OBJECT_ID('cdm.fpk_observation_value', 'F') IS NULL
	ALTER TABLE cdm.observation ADD CONSTRAINT fpk_observation_value FOREIGN KEY (value_as_concept_id) REFERENCES cdm.concept (concept_id);
GO

--Add FK constraint (fpk_observation_qualifier) to cdm.observation
IF OBJECT_ID('cdm.fpk_observation_qualifier', 'F') IS NULL
	ALTER TABLE cdm.observation ADD CONSTRAINT fpk_observation_qualifier FOREIGN KEY (qualifier_concept_id) REFERENCES cdm.concept (concept_id);
GO

--Add FK constraint (fpk_observation_unit) to cdm.observation
IF OBJECT_ID('cdm.fpk_observation_unit', 'F') IS NULL
	ALTER TABLE cdm.observation ADD CONSTRAINT fpk_observation_unit FOREIGN KEY (unit_concept_id) REFERENCES cdm.concept (concept_id);
GO

--Add FK constraint (fpk_observation_provider) to cdm.observation
IF OBJECT_ID('cdm.fpk_observation_provider', 'F') IS NULL
	ALTER TABLE cdm.observation ADD CONSTRAINT fpk_observation_provider FOREIGN KEY (provider_id) REFERENCES cdm.provider (provider_id);
GO

--Add FK constraint (fpk_observation_visit) to cdm.observation
IF OBJECT_ID('cdm.fpk_observation_visit', 'F') IS NULL
	ALTER TABLE cdm.observation ADD CONSTRAINT fpk_observation_visit FOREIGN KEY (visit_occurrence_id) REFERENCES cdm.visit_occurrence (visit_occurrence_id);
GO

--Add FK constraint (fpk_observation_concept_s) to cdm.observation
IF OBJECT_ID('cdm.fpk_observation_concept_s', 'F') IS NULL
	ALTER TABLE cdm.observation ADD CONSTRAINT fpk_observation_concept_s FOREIGN KEY (observation_source_concept_id) REFERENCES cdm.concept (concept_id);
GO

--Add FK constraint (fpk_care_site_location) to cdm.care_site
IF OBJECT_ID('cdm.fpk_care_site_location', 'F') IS NULL
	ALTER TABLE cdm.care_site ADD CONSTRAINT fpk_care_site_location FOREIGN KEY (location_id) REFERENCES cdm.location (location_id);
GO

--Add FK constraint (fpk_care_site_place) to cdm.care_site
IF OBJECT_ID('cdm.fpk_care_site_place', 'F') IS NULL
	ALTER TABLE cdm.care_site ADD CONSTRAINT fpk_care_site_place FOREIGN KEY (place_of_service_concept_id) REFERENCES cdm.concept (concept_id);
GO

--Add FK constraint (fpk_provider_specialty) to cdm.provider
IF OBJECT_ID('cdm.fpk_provider_specialty', 'F') IS NULL
	ALTER TABLE cdm.provider ADD CONSTRAINT fpk_provider_specialty FOREIGN KEY (specialty_concept_id) REFERENCES cdm.concept (concept_id);
GO

--Add FK constraint (fpk_provider_care_site) to cdm.provider
IF OBJECT_ID('cdm.fpk_provider_care_site', 'F') IS NULL
	ALTER TABLE cdm.provider ADD CONSTRAINT fpk_provider_care_site FOREIGN KEY (care_site_id) REFERENCES cdm.care_site (care_site_id);
GO

--Add FK constraint (fpk_provider_gender) to cdm.provider
IF OBJECT_ID('cdm.fpk_provider_gender', 'F') IS NULL
	ALTER TABLE cdm.provider ADD CONSTRAINT fpk_provider_gender FOREIGN KEY (gender_concept_id) REFERENCES cdm.concept (concept_id);
GO

--Add FK constraint (fpk_provider_specialty_s) to cdm.provider
IF OBJECT_ID('cdm.fpk_provider_specialty_s', 'F') IS NULL
	ALTER TABLE cdm.provider ADD CONSTRAINT fpk_provider_specialty_s FOREIGN KEY (specialty_source_concept_id) REFERENCES cdm.concept (concept_id);
GO

--Add FK constraint (fpk_provider_gender_s) to cdm.provider
IF OBJECT_ID('cdm.fpk_provider_gender_s', 'F') IS NULL
	ALTER TABLE cdm.provider ADD CONSTRAINT fpk_provider_gender_s FOREIGN KEY (gender_source_concept_id) REFERENCES cdm.concept (concept_id);
GO

--Add FK constraint (fpk_payer_plan_period) to cdm.payer_plan_period
IF OBJECT_ID('cdm.fpk_payer_plan_period', 'F') IS NULL
	ALTER TABLE cdm.payer_plan_period ADD CONSTRAINT fpk_payer_plan_period FOREIGN KEY (person_id) REFERENCES cdm.person (person_id);
GO

--Add FK constraint (fpk_visit_cost_currency) to cdm.cost
IF OBJECT_ID('cdm.fpk_visit_cost_currency', 'F') IS NULL
	ALTER TABLE cdm.cost ADD CONSTRAINT fpk_visit_cost_currency FOREIGN KEY (currency_concept_id) REFERENCES cdm.concept (concept_id);
GO

--Add FK constraint (fpk_visit_cost_period) to cdm.cost
IF OBJECT_ID('cdm.fpk_visit_cost_period', 'F') IS NULL
	ALTER TABLE cdm.cost ADD CONSTRAINT fpk_visit_cost_period FOREIGN KEY (payer_plan_period_id) REFERENCES cdm.payer_plan_period (payer_plan_period_id);
GO

--Add FK constraint (fpk_drg_concept) to cdm.cost
IF OBJECT_ID('cdm.fpk_drg_concept', 'F') IS NULL
	ALTER TABLE cdm.cost ADD CONSTRAINT fpk_drg_concept FOREIGN KEY (drg_concept_id) REFERENCES cdm.concept (concept_id);
GO

--Add FK constraint (fpk_drug_era_person) to cdm.drug_era
IF OBJECT_ID('cdm.fpk_drug_era_person', 'F') IS NULL
	ALTER TABLE cdm.drug_era ADD CONSTRAINT fpk_drug_era_person FOREIGN KEY (person_id) REFERENCES cdm.person (person_id);
GO

--Add FK constraint (fpk_drug_era_concept) to cdm.drug_era
IF OBJECT_ID('cdm.fpk_drug_era_concept', 'F') IS NULL
	ALTER TABLE cdm.drug_era ADD CONSTRAINT fpk_drug_era_concept FOREIGN KEY (drug_concept_id) REFERENCES cdm.concept (concept_id);
GO

--Add FK constraint (fpk_condition_era_person) to cdm.condition_era
IF OBJECT_ID('cdm.fpk_condition_era_person', 'F') IS NULL
	ALTER TABLE cdm.condition_era ADD CONSTRAINT fpk_condition_era_person FOREIGN KEY (person_id) REFERENCES cdm.person (person_id);
GO

--Add FK constraint (fpk_condition_era_concept) to cdm.condition_era
IF OBJECT_ID('cdm.fpk_condition_era_concept', 'F') IS NULL
	ALTER TABLE cdm.condition_era ADD CONSTRAINT fpk_condition_era_concept FOREIGN KEY (condition_concept_id) REFERENCES cdm.concept (concept_id);
GO

/* CREATE UNIQUE CONSTRAINTS */

--Add unique constraint (uq_concept_synonym) to cdm.concept_synonym (concept_id, concept_synonym_name, language_concept_id)
IF OBJECT_ID('cdm.uq_concept_synonym', 'UQ') IS NULL
	ALTER TABLE cdm.concept_synonym ADD CONSTRAINT uq_concept_synonym UNIQUE (concept_id, concept_synonym_name, language_concept_id);