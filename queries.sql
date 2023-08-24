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