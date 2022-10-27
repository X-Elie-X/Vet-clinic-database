 SELECT * FROM animals WHERE  name  LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth >= '2016-01-01' AND date_of_birth < '2019-12-31';
SELECT name FROM animals WHERE neutered is TRUE AND escape_attempts < 3;
SELECT date_of_birth  FROM animals WHERE name = 'Agumon' OR  name = 'Pikachu';
SELECT name , escape_attempts  FROM animals WHERE weight_kg >10.5;
 SELECT * FROM animals WHERE  neutered ='TRUE';
 SELECT * FROM animals WHERE  name != 'Gabumon';
  SELECT * FROM animals WHERE   weight_kg >= 10.4 AND weight_kg <= 17.3;

-- query and update animals table
update animals set species = 'unspecified';
update animals set species = 'digimon',
where name like '%mon%';

update animals set species = 'pokemon',
where species != 'digimon';

delete FROM animals where date_of_birth > '2022-01-01';

update animals set weight_kg = weight_kg * -1;
update animals set weight_kg = weight_kg * -1 where weight_kg < 0;

--  answer the following questions:
-- How many animals are there?
SELECT count (*) FROM animals;
-- How many animals have never tried to escape?
SELECT count (*) FROM animals WHERE escape_attempts > 0;
-- What is the average weight of animals?
SELECT AVG (weight_kg) FROM animals;
-- Who escapes the most, neutered or not neutered animals?
SELECT neutered, MAX (escape_attempts) FROM animals GROUP BY neutered;
-- What is the minimum and maximum weight of each type of animal?
SELECT species, MIN  (weight_kg),MAX(weight_kg) FROM animals GROUP BY species;
-- What is the average number of escape attempts per animal type of those born between 1990 and 2000?
SELECT species, AVG (escape_attempts) FROM animals WHERE date_of_birth >= '1990-01-01' AND date_of_birth < '2000-12-31' GROUP BY species;

-- Write queries (using JOIN) to answer the following questions:
-- What animals belong to Melody Pond?
SELECT owner_id,name,full_name FROM owners INNER JOIN animals ON owners.id = animals.owner_id WHERE owners.full_name ='Melody Pond';
-- List of all animals that are pokemon (their type is Pokemon)
SELECT * from Animals INNER JOIN species on species.id = animals.species_id WHERE species.name = 'Pokemon';
-- List all owners and their animals, remember to include those that don't own any animal
select * FROM owners FULL outer JOIN animals ON owners.id = animals.owner_id;
-- How many animals are there per species?
SELECT species.name, count(*) FROM species INNER JOIN animals on species.id = animals.species_id  GROUP  BY species.name;
-- List all Digimon owned by Jennifer Orwell.
SELECT * FROM animals INNER JOIN owners on animals.owner_id = owners.id INNER join species ON species.id = animals.species_id where species.name = 'Digimon' AND owners.full_name = 'Jennifer Orwell';
-- List all animals owned by Dean Winchester that haven't tried to escape
SELECT * FROM animals INNER JOIN owners on owners.id = animals.owner_id WHERE owners.full_name = 'Dean Winchester' and animals.escape_attempts = 0;
-- Who owns the most animals?
SELECT owners.full_name, COUNT(*) FROM animals INNER JOIN owners ON owners.id = animals.owner_id GROUP BY owners.full_name ORDER BY Count DESC LIMIT 1;