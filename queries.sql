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

-- answer the following:

-- Who was the last animal seen by William Tatcher?
SELECT vets.name AS vet_name, animals.name AS animal_name, visits.date_of_visit AS last_visit FROM animals INNER JOIN visits ON animals.id = visits.animal_id INNER JOIN vets ON vets.id = visits.vet_id where vets.name='William Tatcher' ORDER BY  date_of_visit DESC LIMIT 1 ; 

-- How many different animals did Stephanie Mendez see?
SELECT vets.name AS vet_name , COUNT(visits.date_of_visit) AS number_of_visits FROM visits INNER JOIN vets ON vets.id = visits.vet_id WHERE vets.name='Stephanie Mendez' GROUP BY vets.name;

-- List all vets and their specialties, including vets with no specialties.
SELECT specializations.species_id, specializations.vet_id, vets.name AS vet_name, species.name AS species_name FROM specializations FULL OUTER JOIN species ON species.id = specializations.species_id FULL OUTER JOIN vets ON vets.id = specializations.vet_id;

-- List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.
SELECT vets.name AS vet_name, animals.name AS animal_name, visits.date_of_visit as visit_date FROM animals INNER JOIN visits ON animals.id = visits.animal_id INNER JOIN vets ON vets.id = visits.vet_id WHERE vets.name='Stephanie Mendez' AND  date_of_visit BETWEEN '2020-04-01' And '2020-08-30'; 

-- What animal has the most visits to vets?
SELECT animals.name AS animal_name, COUNT(visits.date_of_visit) AS number_of_visits from visits INNER JOIN animals ON animals.id = visits.animal_id GROUP BY animals.name ORDER BY COUNT(visits.date_of_visit) DESC LIMIT 1 ;

-- Who was Maisy Smith's first visit?
SELECT vets.name AS vet_name, animals.name as animal_name, visits.date_of_visit AS first_visit FROM animals INNER JOIN visits ON animals.id = visits.animal_id INNER JOIN vets ON vets.id = visits.vet_id WHERE vets.name='Maisy Smith' ORDER BY  date_of_visit ASC limit 1;   

-- Details for most recent visit: animal information, vet information, and date of visit.
SELECT animals.id AS animal_id, animals.name AS animal_name, animals.date_of_birth, vets.id AS vet_id,  vets.name AS vet_name, vets.age AS vet_age, date_of_visit FROM visits INNER JOIN animals ON animals.id = visits.animal_id INNER JOIN vets ON vets.id = visits.vet_id;

-- How many visits were with a vet that did not specialize in that animal's species?
SELECT vets.name AS vet_name, COUNT(*) FROM visits INNER JOIN vets ON vets.id = visits.vet_id INNER JOIN specializations ON specializations.vet_id = visits.vet_id WHERE specializations.species_id IS NULL GROUP BY vets.name;

-- What specialty should Maisy Smith consider getting? Look for the species she gets the most.
SELECT vets.name AS vet_name, species.name AS species_name, COUNT(species.name) FROM visits LEFT JOIN animals ON animals.id = visits.animal_id INNER JOIN vets ON vets.id = visits.vet_id INNER JOIN species ON species.id = animals.species_id WHERE vets.name = 'Maisy Smith' GROUP BY vets.name, species.name ORDER BY COUNT DESC LIMIT 1;


-- queries are taking too much time:
EXPLAIN ANALYZE SELECT COUNT(*) FROM visits where animal_id = 4;
--  Execution Time: 1168.544 ms
EXPLAIN ANALYZE SELECT * FROM visits where vet_id = 2;
-- Execution Time: 1320.952 ms
EXPLAIN ANALYZE SELECT * FROM owners where email = 'owner_18327@mail.com';
-- Execution Time: 1097.297 ms
-- create index
CREATE INDEX index_animal ON visits(animal_id);
EXPLAIN ANALYZE SELECT COUNT(*) FROM visits where animal_id = 4;
--  Execution Time: 197.137 ms
CREATE INDEX index_vet ON visits (vet_id);
EXPLAIN ANALYZE SELECT * FROM visits where vet_id = 2;
--  Execution Time: 1280.134 ms
CREATE INDEX index_email ON owners(email);
EXPLAIN ANALYZE SELECT * FROM owners where email = 'owner_18327@mail.com';
-- Execution Time: 4.362 ms