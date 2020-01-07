/************************
Foreign key constraints
************************/

--Add foreign key (fpk_concept_domain) to cdm.concept
DO $$
BEGIN
	IF NOT EXISTS (
		SELECT 1
		FROM information_schema.table_constraints 
		WHERE table_name = 'concept' 
			AND table_schema = 'cdm' 
			AND constraint_type = 'FOREIGN KEY'
			AND constraint_name = 'fpk_concept_domain'
	) THEN
		ALTER TABLE cdm.concept ADD CONSTRAINT fpk_concept_domain FOREIGN KEY (domain_id) REFERENCES cdm.domain (domain_id);
	END IF;
END;
$$;
GO

--Add foreign key (fpk_concept_class) to cdm.concept
DO $$
BEGIN
	IF NOT EXISTS (
		SELECT 1
		FROM information_schema.table_constraints 
		WHERE table_name = 'concept' 
			AND table_schema = 'cdm' 
			AND constraint_type = 'FOREIGN KEY'
			AND constraint_name = 'fpk_concept_class'
	) THEN
		ALTER TABLE cdm.concept ADD CONSTRAINT fpk_concept_class FOREIGN KEY (concept_class_id) REFERENCES cdm.concept_class (concept_class_id);
	END IF;
END;
$$;
GO

--Add foreign key (fpk_concept_vocabulary) to cdm.concept
DO $$
BEGIN
	IF NOT EXISTS (
		SELECT 1
		FROM information_schema.table_constraints 
		WHERE table_name = 'concept' 
			AND table_schema = 'cdm' 
			AND constraint_type = 'FOREIGN KEY'
			AND constraint_name = 'fpk_concept_vocabulary'
	) THEN
		ALTER TABLE cdm.concept ADD CONSTRAINT fpk_concept_vocabulary FOREIGN KEY (vocabulary_id) REFERENCES cdm.vocabulary (vocabulary_id);
	END IF;
END;
$$;
GO

--Add foreign key (fpk_vocabulary_concept) to cdm.vocabulary
DO $$
BEGIN
	IF NOT EXISTS (
		SELECT 1
		FROM information_schema.table_constraints 
		WHERE table_name = 'vocabulary' 
			AND table_schema = 'cdm' 
			AND constraint_type = 'FOREIGN KEY'
			AND constraint_name = 'fpk_vocabulary_concept'
	) THEN
		ALTER TABLE cdm.vocabulary ADD CONSTRAINT fpk_vocabulary_concept FOREIGN KEY (vocabulary_concept_id) REFERENCES cdm.concept (concept_id);
	END IF;
END;
$$;
GO

--Add foreign key (fpk_domain_concept) to cdm.domain
DO $$
BEGIN
	IF NOT EXISTS (
		SELECT 1
		FROM information_schema.table_constraints 
		WHERE table_name = 'domain' 
			AND table_schema = 'cdm' 
			AND constraint_type = 'FOREIGN KEY'
			AND constraint_name = 'fpk_domain_concept'
	) THEN
		ALTER TABLE cdm.domain ADD CONSTRAINT fpk_domain_concept FOREIGN KEY (domain_concept_id) REFERENCES cdm.concept (concept_id);
	END IF;
END;
$$;
GO

--Add foreign key (fpk_concept_class_concept) to cdm.concept_class
DO $$
BEGIN
	IF NOT EXISTS (
		SELECT 1
		FROM information_schema.table_constraints 
		WHERE table_name = 'concept_class' 
			AND table_schema = 'cdm' 
			AND constraint_type = 'FOREIGN KEY'
			AND constraint_name = 'fpk_concept_class_concept'
	) THEN
		ALTER TABLE cdm.concept_class ADD CONSTRAINT fpk_concept_class_concept FOREIGN KEY (concept_class_concept_id) REFERENCES cdm.concept (concept_id);
	END IF;
END;
$$;
GO

--Add foreign key (fpk_concept_relationship_c_1) to cdm.concept_relationship
DO $$
BEGIN
	IF NOT EXISTS (
		SELECT 1
		FROM information_schema.table_constraints 
		WHERE table_name = 'concept_relationship' 
			AND table_schema = 'cdm' 
			AND constraint_type = 'FOREIGN KEY'
			AND constraint_name = 'fpk_concept_relationship_c_1'
	) THEN
		ALTER TABLE cdm.concept_relationship ADD CONSTRAINT fpk_concept_relationship_c_1 FOREIGN KEY (concept_id_1) REFERENCES cdm.concept (concept_id);
	END IF;
END;
$$;
GO

--Add foreign key (fpk_concept_relationship_c_2) to cdm.concept_relationship
DO $$
BEGIN
	IF NOT EXISTS (
		SELECT 1
		FROM information_schema.table_constraints 
		WHERE table_name = 'concept_relationship' 
			AND table_schema = 'cdm' 
			AND constraint_type = 'FOREIGN KEY'
			AND constraint_name = 'fpk_concept_relationship_c_2'
	) THEN
		ALTER TABLE cdm.concept_relationship ADD CONSTRAINT fpk_concept_relationship_c_2 FOREIGN KEY (concept_id_2) REFERENCES cdm.concept (concept_id);
	END IF;
END;
$$;
GO

--Add foreign key (fpk_concept_relationship_id) to cdm.concept_relationship
DO $$
BEGIN
	IF NOT EXISTS (
		SELECT 1
		FROM information_schema.table_constraints 
		WHERE table_name = 'concept_relationship' 
			AND table_schema = 'cdm' 
			AND constraint_type = 'FOREIGN KEY'
			AND constraint_name = 'fpk_concept_relationship_id'
	) THEN
		ALTER TABLE cdm.concept_relationship ADD CONSTRAINT fpk_concept_relationship_id FOREIGN KEY (relationship_id) REFERENCES cdm.relationship (relationship_id);
	END IF;
END;
$$;
GO

--Add foreign key (fpk_relationship_concept) to cdm.relationship
DO $$
BEGIN
	IF NOT EXISTS (
		SELECT 1
		FROM information_schema.table_constraints 
		WHERE table_name = 'relationship' 
			AND table_schema = 'cdm' 
			AND constraint_type = 'FOREIGN KEY'
			AND constraint_name = 'fpk_relationship_concept'
	) THEN
		ALTER TABLE cdm.relationship ADD CONSTRAINT fpk_relationship_concept FOREIGN KEY (relationship_concept_id) REFERENCES cdm.concept (concept_id);
	END IF;
END;
$$;
GO

--Add foreign key (fpk_relationship_reverse) to cdm.relationship
DO $$
BEGIN
	IF NOT EXISTS (
		SELECT 1
		FROM information_schema.table_constraints 
		WHERE table_name = 'relationship' 
			AND table_schema = 'cdm' 
			AND constraint_type = 'FOREIGN KEY'
			AND constraint_name = 'fpk_relationship_reverse'
	) THEN
		ALTER TABLE cdm.relationship ADD CONSTRAINT fpk_relationship_reverse FOREIGN KEY (reverse_relationship_id) REFERENCES cdm.relationship (relationship_id);
	END IF;
END;
$$;
GO

--Add foreign key (fpk_concept_synonym_concept) to cdm.concept_synonym
DO $$
BEGIN
	IF NOT EXISTS (
		SELECT 1
		FROM information_schema.table_constraints 
		WHERE table_name = 'concept_synonym' 
			AND table_schema = 'cdm' 
			AND constraint_type = 'FOREIGN KEY'
			AND constraint_name = 'fpk_concept_synonym_concept'
	) THEN
		ALTER TABLE cdm.concept_synonym ADD CONSTRAINT fpk_concept_synonym_concept FOREIGN KEY (concept_id) REFERENCES cdm.concept (concept_id);
	END IF;
END;
$$;
GO

--Add foreign key (fpk_concept_synonym_language_concept) to cdm.concept_synonym
DO $$
BEGIN
	IF NOT EXISTS (
		SELECT 1
		FROM information_schema.table_constraints 
		WHERE table_name = 'concept_synonym' 
			AND table_schema = 'cdm' 
			AND constraint_type = 'FOREIGN KEY'
			AND constraint_name = 'fpk_concept_synonym_language_concept'
	) THEN
		ALTER TABLE cdm.concept_synonym ADD CONSTRAINT fpk_concept_synonym_language_concept FOREIGN KEY (language_concept_id) REFERENCES cdm.concept (concept_id);
	END IF;
END;
$$;
GO

--Add foreign key (fpk_concept_ancestor_concept_1) to cdm.concept_ancestor
DO $$
BEGIN
	IF NOT EXISTS (
		SELECT 1
		FROM information_schema.table_constraints 
		WHERE table_name = 'concept_ancestor' 
			AND table_schema = 'cdm' 
			AND constraint_type = 'FOREIGN KEY'
			AND constraint_name = 'fpk_concept_ancestor_concept_1'
	) THEN
		ALTER TABLE cdm.concept_ancestor ADD CONSTRAINT fpk_concept_ancestor_concept_1 FOREIGN KEY (ancestor_concept_id) REFERENCES cdm.concept (concept_id);
	END IF;
END;
$$;
GO

--Add foreign key (fpk_concept_ancestor_concept_2) to cdm.concept_ancestor
DO $$
BEGIN
	IF NOT EXISTS (
		SELECT 1
		FROM information_schema.table_constraints 
		WHERE table_name = 'concept_ancestor' 
			AND table_schema = 'cdm' 
			AND constraint_type = 'FOREIGN KEY'
			AND constraint_name = 'fpk_concept_ancestor_concept_2'
	) THEN
		ALTER TABLE cdm.concept_ancestor ADD CONSTRAINT fpk_concept_ancestor_concept_2 FOREIGN KEY (descendant_concept_id) REFERENCES cdm.concept (concept_id);
	END IF;
END;
$$;
GO

--Add foreign key (fpk_drug_strength_concept_1) to cdm.drug_strength
DO $$
BEGIN
	IF NOT EXISTS (
		SELECT 1
		FROM information_schema.table_constraints 
		WHERE table_name = 'drug_strength' 
			AND table_schema = 'cdm' 
			AND constraint_type = 'FOREIGN KEY'
			AND constraint_name = 'fpk_drug_strength_concept_1'
	) THEN
		ALTER TABLE cdm.drug_strength ADD CONSTRAINT fpk_drug_strength_concept_1 FOREIGN KEY (drug_concept_id) REFERENCES cdm.concept (concept_id);
	END IF;
END;
$$;
GO

--Add foreign key (fpk_drug_strength_concept_2) to cdm.drug_strength
DO $$
BEGIN
	IF NOT EXISTS (
		SELECT 1
		FROM information_schema.table_constraints 
		WHERE table_name = 'drug_strength' 
			AND table_schema = 'cdm' 
			AND constraint_type = 'FOREIGN KEY'
			AND constraint_name = 'fpk_drug_strength_concept_2'
	) THEN
		ALTER TABLE cdm.drug_strength ADD CONSTRAINT fpk_drug_strength_concept_2 FOREIGN KEY (ingredient_concept_id) REFERENCES cdm.concept (concept_id);
	END IF;
END;
$$;
GO

--Add foreign key (fpk_drug_strength_unit_1) to cdm.drug_strength
DO $$
BEGIN
	IF NOT EXISTS (
		SELECT 1
		FROM information_schema.table_constraints 
		WHERE table_name = 'drug_strength' 
			AND table_schema = 'cdm' 
			AND constraint_type = 'FOREIGN KEY'
			AND constraint_name = 'fpk_drug_strength_unit_1'
	) THEN
		ALTER TABLE cdm.drug_strength ADD CONSTRAINT fpk_drug_strength_unit_1 FOREIGN KEY (amount_unit_concept_id) REFERENCES cdm.concept (concept_id);
	END IF;
END;
$$;
GO

--Add foreign key (fpk_drug_strength_unit_2) to cdm.drug_strength
DO $$
BEGIN
	IF NOT EXISTS (
		SELECT 1
		FROM information_schema.table_constraints 
		WHERE table_name = 'drug_strength' 
			AND table_schema = 'cdm' 
			AND constraint_type = 'FOREIGN KEY'
			AND constraint_name = 'fpk_drug_strength_unit_2'
	) THEN
		ALTER TABLE cdm.drug_strength ADD CONSTRAINT fpk_drug_strength_unit_2 FOREIGN KEY (numerator_unit_concept_id) REFERENCES cdm.concept (concept_id);
	END IF;
END;
$$;
GO

--Add foreign key (fpk_drug_strength_unit_3) to cdm.drug_strength
DO $$
BEGIN
	IF NOT EXISTS (
		SELECT 1
		FROM information_schema.table_constraints 
		WHERE table_name = 'drug_strength' 
			AND table_schema = 'cdm' 
			AND constraint_type = 'FOREIGN KEY'
			AND constraint_name = 'fpk_drug_strength_unit_3'
	) THEN
		ALTER TABLE cdm.drug_strength ADD CONSTRAINT fpk_drug_strength_unit_3 FOREIGN KEY (denominator_unit_concept_id) REFERENCES cdm.concept (concept_id);
	END IF;
END;
$$;
GO

/************************
Unique constraints
************************/

--Add unique constraint (uq_concept_synonym) to cdm.concept_synonym
DO $$
BEGIN
	IF NOT EXISTS (
		SELECT 1
		FROM information_schema.table_constraints 
		WHERE table_name = 'drug_strength' 
			AND table_schema = 'cdm' 
			AND constraint_type = 'UNIQUE'
			AND constraint_name = 'fpk_drug_strength_unit_3'
	) THEN
		ALTER TABLE cdm.concept_synonym ADD CONSTRAINT uq_concept_synonym UNIQUE (concept_id, concept_synonym_name, language_concept_id);
	END IF;
END;
$$;
GO

/************************
Check constraints
************************/

--Add check constraint (chk_c_concept_name) to cdm.concept
DO $$
BEGIN
	IF NOT EXISTS (
		SELECT 1
		FROM information_schema.table_constraints 
		WHERE table_name = 'concept' 
			AND table_schema = 'cdm' 
			AND constraint_type = 'CHECK'
			AND constraint_name = 'chk_c_concept_name'
	) THEN
		ALTER TABLE cdm.concept ADD CONSTRAINT chk_c_concept_name CHECK (concept_name <> '');
	END IF;
END;
$$;
GO

--Add check constraint (chk_c_standard_concept) to cdm.concept
DO $$
BEGIN
	IF NOT EXISTS (
		SELECT 1
		FROM information_schema.table_constraints 
		WHERE table_name = 'concept' 
			AND table_schema = 'cdm' 
			AND constraint_type = 'CHECK'
			AND constraint_name = 'chk_c_standard_concept'
	) THEN
		ALTER TABLE cdm.concept ADD CONSTRAINT chk_c_standard_concept CHECK (COALESCE(standard_concept,'C') in ('C','S'));
	END IF;
END;
$$;
GO

--Add check constraint (chk_c_concept_code) to cdm.concept
DO $$
BEGIN
	IF NOT EXISTS (
		SELECT 1
		FROM information_schema.table_constraints 
		WHERE table_name = 'concept' 
			AND table_schema = 'cdm' 
			AND constraint_type = 'CHECK'
			AND constraint_name = 'chk_c_concept_code'
	) THEN
		ALTER TABLE cdm.concept ADD CONSTRAINT chk_c_concept_code CHECK (concept_code <> '');
	END IF;
END;
$$;
GO

--Add check constraint (chk_c_invalid_reason) to cdm.concept
DO $$
BEGIN
	IF NOT EXISTS (
		SELECT 1
		FROM information_schema.table_constraints 
		WHERE table_name = 'concept' 
			AND table_schema = 'cdm' 
			AND constraint_type = 'CHECK'
			AND constraint_name = 'chk_c_invalid_reason'
	) THEN
		ALTER TABLE cdm.concept ADD CONSTRAINT chk_c_invalid_reason CHECK (COALESCE(invalid_reason,'D') in ('D','U'));
	END IF;
END;
$$;
GO

--Add check constraint (chk_cr_invalid_reason) to cdm.concept_relationship
DO $$
BEGIN
	IF NOT EXISTS (
		SELECT 1
		FROM information_schema.table_constraints 
		WHERE table_name = 'concept_relationship' 
			AND table_schema = 'cdm' 
			AND constraint_type = 'CHECK'
			AND constraint_name = 'chk_cr_invalid_reason'
	) THEN
		ALTER TABLE cdm.concept_relationship ADD CONSTRAINT chk_cr_invalid_reason CHECK (COALESCE(invalid_reason,'D')='D');
	END IF;
END;
$$;
GO

--Add check constraint (chk_csyn_concept_synonym_name) to cdm.concept_synonym
DO $$
BEGIN
	IF NOT EXISTS (
		SELECT 1
		FROM information_schema.table_constraints 
		WHERE table_name = 'concept_synonym' 
			AND table_schema = 'cdm' 
			AND constraint_type = 'CHECK'
			AND constraint_name = 'chk_csyn_concept_synonym_name'
	) THEN
		ALTER TABLE cdm.concept_synonym ADD CONSTRAINT chk_csyn_concept_synonym_name CHECK (concept_synonym_name <> '');
	END IF;
END;
$$;