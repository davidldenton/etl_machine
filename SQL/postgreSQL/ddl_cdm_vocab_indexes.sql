--Select database
SET SEARCH_PATH TO @database@;
GO

/***************
Add primary keys
***************/

--Add primary key (xpk_concept) to cdm.concept
DO $$
BEGIN
	IF NOT EXISTS (
		SELECT constraint_name 
		FROM information_schema.table_constraints 
		WHERE table_name = 'concept' 
			AND constraint_type = 'PRIMARY KEY'
			AND table_schema = 'cdm'
	) THEN
		ALTER TABLE cdm.concept ADD CONSTRAINT xpk_concept PRIMARY KEY (concept_id);
	END IF;
END;
$$;
GO

--Add primary key (xpk_vocabulary) to cdm.vocabulary
DO $$
BEGIN
	IF NOT EXISTS (
		SELECT constraint_name 
		FROM information_schema.table_constraints 
		WHERE table_name = 'vocabulary' 
			AND constraint_type = 'PRIMARY KEY'
			AND table_schema = 'cdm'
	) THEN
		ALTER TABLE cdm.vocabulary ADD CONSTRAINT xpk_vocabulary PRIMARY KEY (vocabulary_id);
	END IF;
END;
$$;
GO

--Add primary key (xpk_domain) to cdm.domain
DO $$
BEGIN
	IF NOT EXISTS (
		SELECT constraint_name 
		FROM information_schema.table_constraints 
		WHERE table_name = 'domain' 
			AND constraint_type = 'PRIMARY KEY'
			AND table_schema = 'cdm'
	) THEN
		ALTER TABLE cdm.domain ADD CONSTRAINT xpk_domain PRIMARY KEY (domain_id);
	END IF;
END;
$$;
GO

--Add primary key (xpk_concept_class) to cdm.concept_class
DO $$
BEGIN
	IF NOT EXISTS (
		SELECT constraint_name 
		FROM information_schema.table_constraints 
		WHERE table_name = 'concept_class' 
			AND constraint_type = 'PRIMARY KEY'
			AND table_schema = 'cdm'
	) THEN
		ALTER TABLE cdm.concept_class ADD CONSTRAINT xpk_concept_class PRIMARY KEY (concept_class_id);
	END IF;
END;
$$;
GO

--Add primary key (xpk_concept_relationship) cdm.concept_relationship
DO $$
BEGIN
	IF NOT EXISTS (
		SELECT constraint_name 
		FROM information_schema.table_constraints 
		WHERE table_name = 'concept_relationship' 
			AND constraint_type = 'PRIMARY KEY'
			AND table_schema = 'cdm'
	) THEN
		ALTER TABLE cdm.concept_relationship ADD CONSTRAINT xpk_concept_relationship PRIMARY KEY (concept_id_1,concept_id_2,relationship_id);
	END IF;
END;
$$;
GO

--Add primary key (xpk_relationship) to cdm.relationship
DO $$
BEGIN
	IF NOT EXISTS (
		SELECT constraint_name 
		FROM information_schema.table_constraints 
		WHERE table_name = 'relationship' 
			AND constraint_type = 'PRIMARY KEY'
			AND table_schema = 'cdm'
	) THEN
		ALTER TABLE cdm.relationship ADD CONSTRAINT xpk_relationship PRIMARY KEY (relationship_id);
	END IF;
END;
$$;
GO

--Add primary key (xpk_concept_ancestor) to cdm.concept
DO $$
BEGIN
	IF NOT EXISTS (
		SELECT constraint_name 
		FROM information_schema.table_constraints 
		WHERE table_name = 'concept_ancestor' 
			AND constraint_type = 'PRIMARY KEY'
			AND table_schema = 'cdm'
	) THEN
		ALTER TABLE cdm.concept_ancestor ADD CONSTRAINT xpk_concept_ancestor PRIMARY KEY (ancestor_concept_id,descendant_concept_id);
	END IF;
END;
$$;
GO

--Add primary key (xpk_drug_strength) to cdm.concept_ancestor
DO $$
BEGIN
	IF NOT EXISTS (
		SELECT constraint_name 
		FROM information_schema.table_constraints 
		WHERE table_name = 'drug_strength' 
			AND constraint_type = 'PRIMARY KEY'
			AND table_schema = 'cdm'
	) THEN
		ALTER TABLE cdm.drug_strength ADD CONSTRAINT xpk_drug_strength PRIMARY KEY (drug_concept_id, ingredient_concept_id);
	END IF;
END;
$$;
GO

/***************
Add indices
***************/

--Add index (idx_concept_concept_id) to cdm.concept
CREATE UNIQUE INDEX IF NOT EXISTS idx_concept_concept_id ON cdm.concept (concept_id ASC);
CLUSTER cdm.concept USING idx_concept_concept_id;
GO

--Add index (idx_concept_code) to cdm.concept
CREATE INDEX IF NOT EXISTS idx_concept_code ON cdm.concept (concept_code ASC);
GO

--Add index (idx_concept_vocabluary_id) to cdm.concept
CREATE INDEX IF NOT EXISTS idx_concept_vocabluary_id ON cdm.concept (vocabulary_id ASC);
GO

--Add index (idx_concept_domain_id) to cdm.concept
CREATE INDEX IF NOT EXISTS idx_concept_domain_id ON cdm.concept (domain_id ASC);
GO

--Add index (idx_concept_class_id) to cdm.concept
CREATE INDEX IF NOT EXISTS idx_concept_class_id ON cdm.concept (concept_class_id ASC);
GO

--Add index (idx_vocabulary_vocabulary_id) to cdm.vocabulary
CREATE UNIQUE INDEX IF NOT EXISTS idx_vocabulary_vocabulary_id ON cdm.vocabulary (vocabulary_id ASC);
CLUSTER cdm.vocabulary USING idx_vocabulary_vocabulary_id;
GO

--Add index (idx_domain_domain_id) to cdm.domain
CREATE UNIQUE INDEX IF NOT EXISTS idx_domain_domain_id ON cdm.domain (domain_id ASC);
CLUSTER cdm.domain USING idx_domain_domain_id;
GO

--Add index (idx_concept_class_class_id) to cdm.concept_class
CREATE UNIQUE INDEX IF NOT EXISTS idx_concept_class_class_id ON cdm.concept_class (concept_class_id ASC);
CLUSTER cdm.concept_class USING idx_concept_class_class_id;
GO

--Add index (idx_concept_relationship_id_1) to cdm.concept_relationship
CREATE INDEX IF NOT EXISTS idx_concept_relationship_id_1 ON cdm.concept_relationship (concept_id_1 ASC);
GO

--Add index (idx_concept_relationship_id_2) to cdm.concept_relationship
CREATE INDEX IF NOT EXISTS idx_concept_relationship_id_2 ON cdm.concept_relationship (concept_id_2 ASC);
GO

--Add index (idx_concept_relationship_id_3) to cdm.concept_relationship
CREATE INDEX IF NOT EXISTS idx_concept_relationship_id_3 ON cdm.concept_relationship (relationship_id ASC);
GO

--Add index (idx_relationship_rel_id) to cdm.relationship
CREATE UNIQUE INDEX IF NOT EXISTS idx_relationship_rel_id ON cdm.relationship (relationship_id ASC);
CLUSTER cdm.relationship USING idx_relationship_rel_id;
GO

--Add index (idx_concept_synonym_id) to cdm.concept_synonym
CREATE INDEX IF NOT EXISTS idx_concept_synonym_id ON cdm.concept_synonym (concept_id ASC);
CLUSTER cdm.concept_synonym USING idx_concept_synonym_id;
GO

--Add index (idx_concept_ancestor_id_1) to cdm.concept_ancestor
CREATE INDEX IF NOT EXISTS idx_concept_ancestor_id_1  ON cdm.concept_ancestor (ancestor_concept_id ASC);
CLUSTER cdm.concept_ancestor USING idx_concept_ancestor_id_1;
GO

--Add index (idx_concept_ancestor_id_2) to cdm.concept_ancestor
CREATE INDEX IF NOT EXISTS idx_concept_ancestor_id_2 ON cdm.concept_ancestor (descendant_concept_id ASC);
GO

--Add index (idx_drug_strength_id_1) to cdm.drug_strength
CREATE INDEX IF NOT EXISTS idx_drug_strength_id_1  ON cdm.drug_strength (drug_concept_id ASC);
CLUSTER cdm.drug_strength USING idx_drug_strength_id_1;
GO

--Add index (idx_drug_strength_id_2) to cdm.drug_strength
CREATE INDEX IF NOT EXISTS idx_drug_strength_id_2 ON cdm.drug_strength (ingredient_concept_id ASC);