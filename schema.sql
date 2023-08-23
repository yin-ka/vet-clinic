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