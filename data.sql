/* Populate database with Animals Data. */

/* 
  Requeriment:
    Animal: His name is Agumon. He was born on Feb 3rd, 2020, and currently weighs 10.23kg. He was neutered and he has never tried to escape.
    Animal: Her name is Gabumon. She was born on Nov 15th, 2018, and currently weighs 8kg. She is neutered and she has tried to escape 2 times.
    Animal: His name is Pikachu. He was born on Jan 7th, 2021, and currently weighs 15.04kg. He was not neutered and he has tried to escape once.
    Animal: Her name is Devimon. She was born on May 12th, 2017, and currently weighs 11kg. She is neutered and she has tried to escape 5 times.
 */

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES
  ('Agumon', '2020-02-03', 0, true, 10.23),
  ('Gabumon', '2018-11-15', 2, true, 8),
  ('Pikachu', '2021-01-07', 1, false, 15.04),
  ('Devimon', '2017-05-12', 5, true, 11);


INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg, species)
VALUES
  ('Charmander', '2020-02-08', 0, false, -11, 'Fire'),
  ('Plantmon', '2021-11-15', 2, true, -5.7, 'Plant'),
  ('Squirtle', '1993-04-02', 3, false, -12.13, 'Water'),
  ('Angemon', '2005-06-12', 1, true, -45, 'Angel'),
  ('Boarmon', '2005-06-07', 7, true, 20.4, 'Mammal'),
  ('Blossom', '1998-10-13', 3, true, 17, 'Plant'),
  ('Ditto', '2022-05-14', 4, true, 22, 'Unknown');


-- Insert data into owners table
INSERT INTO owners (full_name, age) VALUES
  ('Sam Smith', 34),
  ('Jennifer Orwell', 19),
  ('Bob', 45),
  ('Melody Pond', 77),
  ('Dean Winchester', 14),
  ('Jodie Whittaker', 38);

-- Insert data into species table
INSERT INTO species (name) VALUES
  ('Pokemon'),
  ('Digimon');

-- data.sql

-- Modify animals to include species_id
UPDATE animals SET species_id = (CASE 
                                  WHEN name LIKE '%mon' THEN 2
                                  ELSE 1
                                END);

-- Modify animals to include owner_id
UPDATE animals SET owner_id = (CASE 
                                WHEN name IN ('Agumon', 'Gabumon', 'Pikachu', 'Devimon', 'Plantmon') THEN 2
                                WHEN name IN ('Charmander', 'Squirtle', 'Blossom', 'Angemon', 'Boarmon') THEN 4
                                ELSE 5
                              END);
