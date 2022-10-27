-- Animals Table

CREATE TABLE animals(
id BIGSERIAL NOT NULL PRIMARY KEY,
"name" VARCHAR(100) NOT NULL ,
date_of_birth date NOT NULL ,
escape_attempts integer NOT NULL,
neutered boolean NOT NULL,
weight_kg decimal NOT NULL,
species character varying(100)
);

-- Owners Table

CREATE TABLE owners(
id BIGSERIAL NOT NULL PRIMARY KEY,
full_name character varying(100)  NOT NULL,
age integer NOT NULL
);


-- Species Table

CREATE TABLE species(
id BIGSERIAL NOT NULL PRIMARY KEY, 
"name" character varying(100)  NOT NULL
);

-- Remove column species
alter table animals drop column species; 

--  Add species_id to animal table
alter table animals add column species_id INT references species(id);

-- Add owner_id to animal table
alter table animals add column owner_id INT references owners(id);

