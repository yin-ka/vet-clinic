CREATE TABLE animals(
    id INT GENERATED ALWAYS AS IDENTITY, 
    name TEXT, 
    date_of_birth DATE, 
    escape_attempts INT, 
    neutered BOOLEAN, 
    weight_kg DECIMAL(10,2),
    PRIMARY KEY (id)
);

-- Add new column 
ALTER TABLE animals ADD COLUMN species TEXT;

-- Create table owners 
CREATE TABLE owners(
    id INT GENERATED ALWAYS AS IDENTITY,
    full_name VARCHAR(255),
    age INT
 )

--  Create table species
CREATE TABLE species(
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(255),
 )

--  Remove column species
ALTER TABLE animals DROP COLUMN species;

-- Add species_id
 ALTER TABLE animals ADD COLUMN species_id INT,
  ADD CONSTRAINT fk_species FOREIGN KEY(species_id)
   REFERENCES species(id);

--  Add owner_id
 ALTER TABLE animals ADD COLUMN owner_id INT,
  ADD CONSTRAINT fk_owner FOREIGN KEY(owner_id)
   REFERENCES owners(id);