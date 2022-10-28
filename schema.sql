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

--  vets table 

CREATE TABLE vets(id BIGSERIAL NOT NULL PRIMARY KEY,
"name" character varying(100)  NOT NULL,
age integer NOT NULL,
date_of_graduation date NOT NULL);

--  Create a  specializations table
CREATE TABLE specializations (id INT GENERATED ALWAYS AS IDENTITY, species_id INT NOT NULL, vet_id INT NOT NULL, PRIMARY KEY(id), FOREIGN KEY (species_id) REFERENCES species (id), FOREIGN KEY (vet_id) REFERENCES vets (id));

-- Creat a Visits table

CREATE TABLE visits (id INT GENERATED ALWAYS AS IDENTITY,animal_id INT NOT NULL, vet_id INT NOT NULL, date_of_visit DATE NOT NULL, PRIMARY KEY(id), FOREIGN KEY (animal_id) REFERENCES animals (id), FOREIGN KEY (vet_id) REFERENCES vets (id));