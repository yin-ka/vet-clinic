SELECT * FROM animals WHERE name LIKE '%mon';

SELECT name FROM animals where date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';

SELECT name FROM animals WHERE neutered = true AND escape_attempts < 3;

SELECT date_of_birth FROM animals WHERE name = 'Agumon' or name = 'Pikachu';

SELECT name,escape_attempts FROM animals WHERE weight_kg > 10.50;

SELECT * FROM animals where neutered = true;

SELECT * FROM animals WHERE name <> 'Gabumon';

SELECT * FROM animals WHERE weight_kg BETWEEN 10.40 AND 17.30;

-- Update and Delete changes to species
BEGIN;

UPDATE animals SET species = 'unspecified';

SELECT * FROM animals;

ROLLBACK;

SELECT species from animals;

-- Setting animals species
BEGIN;

UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';

UPDATE animals SET species = 'pokemon' WHERE species IS NULL;

SELECT * FROM animals;

COMMIT;

SELECT * FROM animals;

-- Delete and rollback table;
BEGIN;

DELETE FROM animals;

ROLLBACK;

SELECT * FROM animals;

-- Savepoint
BEGIN;

DELETE FROM animals WHERE date_of_birth > '2022-01-01';

SAVEPOINT SP1;

UPDATE animals SET weight_kg = weight_kg * -1;

ROLLBACK TO SAVEPOINT SP1;

UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;

COMMIT;

-- Final
SELECT COUNT(*) AS total_animals FROM animals;

SELECT COUNT(*) AS animals_not_escaped FROM animals WHERE escape_attempts = 0;

SELECT AVG(weight_kg) AS avg_weight FROM animals;

SELECT neutered, SUM(escape_attempts) AS count_escape FROM animals GROUP BY neutered ORDER BY count_escape DESC;

SELECT species, MIN(weight_kg) AS min_weight, MAX(weight_kg) AS max_weight FROM animals GROUP BY species;

SELECT species, AVG(escape_attempts) AS escape_attempts_avg FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY species;

-- Day 3 queries
SELECT animals.name FROM animals JOIN owners ON animals.owner_id = owners.id WHERE owners.full_name = 'Melody Pond';

SELECT animals.name FROM animals JOIN species ON animals.species_id = species.id WHERE species.name = 'Pokemon';

SELECT owners.full_name, animals.name AS animal_name FROM owners LEFT JOIN animals ON owners.id = animals.owner_id;

SELECT species.name AS species_name, COUNT(*) AS animal_count FROM animals JOIN species ON animals.species_id = species.id GROUP BY species.name;

SELECT animals.name AS animal_name, species.name AS species_name FROM animals JOIN owners ON animals.owner_id = owners.id JOIN species ON animals.species_id = species.id WHERE owners.full_name = 'Jennifer Orwell' AND species.name = 'Digimon';

SELECT animals.name AS animal_name, animals.escape_attempts FROM animals JOIN owners ON animals.owner_id = owners.id WHERE owners.full_name = 'Dean Winchester' AND animals.escape_attempts = 0;

SELECT owners.full_name, COUNT(animals.id) AS num_animals FROM owners LEFT JOIN animals ON owners.id = animals.owner_id GROUP BY owners.id, owners.full_name ORDER BY num_animals DESC LIMIT 1;

-- Day 4

SELECT name AS animal 
FROM animals 
JOIN visits ON animals.id = visits.animals_id 
WHERE date_of_visit = '2021-01-11';

SELECT name AS animal 
FROM animals 
JOIN visits ON animals.id = visits.animals_id 
WHERE vets_id = 3;

SELECT vets.name AS vet, species.name AS species 
FROM vets 
LEFT JOIN specializations ON vets.id = specializations.vet_id
LEFT JOIN species ON specializations.species_id = species.id;

 SELECT animals.name AS animal 
 FROM animals 
 JOIN visits ON animals.id = visits.animals_id 
 WHERE (vets_id = 3) AND (date_of_visit BETWEEN '2020-04-01' AND '2020-08-30');

 SELECT animals.name AS animal, COUNT(vets_id) AS visits 
 FROM animals 
 JOIN visits ON animals.id = visits.animals_id 
 GROUP BY animals.name 
 ORDER BY visits DESC 
 LIMIT 1;

 SELECT name AS animal 
 FROM animals 
 JOIN visits ON animals.id = visits.animals_id 
 WHERE date_of_visit = '2020-01-05';

 SELECT animals.name AS animal, vets.name, date_of_visit 
 FROM animals 
 JOIN visits ON animals.id = visits.animals_id 
 JOIN vets ON visits.vets_id = vets.id 
 WHERE vets_id = 1 AND date_of_visit = '2021-01-11';

 SELECT COUNT(DISTINCT date_of_visit) AS visits
 FROM visits 
 JOIN animals ON visits.animals_id = animals.id 
 WHERE date_of_visit 
 IN ('2020-05-24', '2020-07-22', '2020-01-05', '2020-03-08', '2020-05-14', '2021-02-24', '2019-12-21', '2020-08-10', '2021-04-07', '2019-01-24', '2019-05-15', '2020-02-27', '2020-08-03');

 SELECT species.name AS specialty 
 FROM animals 
 JOIN visits ON animals.id = visits.animals_id 
 JOIN species ON animals.species_id = species.id 
 WHERE animals.id = 9 AND vets_id = 2 
 LIMIT 1;