INSERT INTO animals (name,
date_of_birth,escape_attempts,
neutered, weight_kg) VALUES 
('Agumon', '2020-02-03',
 0, true, 10.23);

 INSERT INTO animals (name,
  date_of_birth, escape_attempts,
   neutered, weight_kg) VALUES
    ('Gabumon', '2018-11-15',
     2, true, 8.00);

INSERT INTO animals (name,
 date_of_birth, escape_attempts,
  neutered, weight_kg) VALUES
   ('Pikachu', '2021-01-07',
    1, false, 15.04);

INSERT INTO animals (name,
 date_of_birth, escape_attempts,
  neutered, weight_kg) VALUES
   ('Devimon', '2017-05-12',
    5, true, 11.00);

-- INSERT DAY TWO
INSERT INTO animals(name,
 date_of_birth, escape_attempts,
  neutered, weight_kg) VALUES('Charmander',
   '2020-02-08', 0, false, -11.00),
    ('Plantmon', '2021-11-15',
     2, true, -5.70), ('Squirtle',
      '1993-04-02', 3, false, -12.13),
       ('Angemon', '2005-06-12',
        1, true, -45.00), ('Boarmon', '2005-06-07',
         7, true, 20.40), ('Blossom', '1998-10-13',
          3, true, 17.00), ('Ditto', '2022-05-14',
           4, true, 22.00);

-- Insert into owners
INSERT INTO owners(full_name, age) VALUES('Sam Smith', 34),
 ('Jennifer Orwell', 19), ('Bob', 45), ('Melody Pond', 77),
  ('Dean Winchester', 14), ('Jodie Whittaker', 38);

-- Insert into species
INSERT INTO species(name) VALUES('Pokemon'), ('Digimon');

-- Update and modify animals table for species
UPDATE animals SET species_id = (SELECT id FROM species WHERE name = 'Digimon')
 WHERE name LIKE '%mon';

UPDATE animals SET species_id = (SELECT id FROM species WHERE name = 'Pokemon')
 WHERE species_id IS NULL;

-- Update and modify animals table for owners 
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Sam Smith')
 WHERE name = 'Agumon';

UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Jennifer Orwell')
 WHERE name IN ('Gabumon', 'Pikachu');

UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Bob')
 WHERE name IN ('Devimon', 'Plantmon');

UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Melody Pond')
 WHERE name IN ('Charmander', 'Squirtle', 'Blossom');

UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Dean Winchester')
 WHERE name IN ('Angemon', 'Boarmon');

 -- Insert into vets
INSERT INTO vets
(name, age, date_of_graduation) 
VALUES('William Tatcher', 45, '2000-04-23'), 
('Maisy Smith', 26, '2019-01-17'), 
('Stephanie Mendez', 64, '1981-05-04'), 
('Jack Harkness', 38, '2008-06-08');

-- Insert into specializations
INSERT INTO specializations (species_id, vet_id) 
VALUES(1,1), (2,3), (1,3), (2,4);

-- Insert into visits
INSERT INTO visits (animals_id, vets_id, date_of_visit) 
VALUES (1, 1, '2020-05-24'), (1, 3, '2020-07-22'),
 (2, 4, '2021-02-02'), (3, 2, '2020-01-05'), (3, 2, '2020-03-08'),
  (3, 2, '2020-05-14'), (4, 3, '2021-05-04'),(5, 4, '2021-02-24'),
   (6, 2, '2019-12-21'), (6, 1, '2020-08-10'), (6, 2, '2021-04-07'),
    (7, 3, '2019-09-29'), (8, 4, '2020-10-03'), (8, 4, '2020-11-04'),
     (9, 2, '2019-01-24'), (9, 2, '2019-05-15'), (9, 2, '2020-02-27'),
      (9, 2, '2020-08-03'), (10, 3, '2020-05-24'), (10, 1, '2021-01-11');