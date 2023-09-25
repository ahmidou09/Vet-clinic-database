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


INSERT INTO vets (name, age, date_of_graduation) VALUES
  ('William Tatcher', 45, '2000-04-23'),
  ('Maisy Smith', 26, '2019-01-17'),
  ('Stephanie Mendez', 64, '1981-05-04'),
  ('Jack Harkness', 38, '2008-06-08');

INSERT INTO specializations (vet_id, species_id) VALUES
  (1, 1),
  (3, 2),
  (3, 1),
  (4, 2);

INSERT INTO visits (animal_id, vet_id, visit_date) VALUES
  (1, 1, '2020-05-24'),
  (1, 3, '2020-07-22'),
  (2, 4, '2021-02-02'),
  (4, 2, '2020-01-05'),
  (4, 2, '2020-03-08'),
  (4, 2, '2020-05-14'),
  (6, 3, '2021-05-04'),
  (8, 4, '2021-02-24'),
  (9, 2, '2019-12-21'),
  (9, 1, '2020-08-10'),
  (9, 2, '2021-04-07'),
  (10, 3, '2019-09-29'),
  (11, 4, '2020-10-03'),
  (11, 4, '2020-11-04'),
  (12, 2, '2019-01-24'),
  (12, 2, '2019-05-15'),
  (12, 2, '2020-02-27'),
  (12, 2, '2020-08-03'),
  (13, 3, '2020-05-24'),
  (13, 1, '2021-01-11');


  
-- This will add 3.594.280 visits considering you have 10 animals, 4 vets, and it will use around ~87.000 timestamps (~4min approx.)
INSERT INTO visits (animal_id, vet_id, visit_date) SELECT * FROM (SELECT id FROM animals) animal_ids, (SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;

-- This will add 2.500.000 owners with full_name = 'Owner <X>' and email = 'owner_<X>@email.com' (~2min approx.)
insert into owners (full_name, email) select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';