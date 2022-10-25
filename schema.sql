CREATE TABLE animals(
id BIGSERIAL NOT NULL PRIMARY KEY,
"name" VARCHAR(100) NOT NULL ,
date_of_birth date NOT NULL ,
escape_attempts integer NOT NULL,
neutered boolean NOT NULL,
weight_kg decimal NOT NULL);
