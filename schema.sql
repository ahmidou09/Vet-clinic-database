/* Updated Scheme v1 */
/* 
    Requeriment:
    Create a table named animals with the following columns:
        id: integer
        name: string
        date_of_birth: date
        escape_attempts: integer
        neutered: boolean
        weight_kg: decimal
 */


CREATE TABLE animals (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    date_of_birth DATE,
    escape_attempts INTEGER,
    neutered BOOLEAN,
    weight_kg DECIMAL(5,2)
);

 /*Added a column `species` of type string to the animals table.*/

ALTER TABLE animals
ADD COLUMN species VARCHAR(255);


CREATE TABLE owners (
    id SERIAL PRIMARY KEY,
    full_name VARCHAR(255),
    age INTEGER
);

CREATE TABLE species (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255)
);

-- Modify animals table
ALTER TABLE animals
    DROP COLUMN species,
    ADD COLUMN species_id INTEGER,
    ADD COLUMN owner_id INTEGER,
    ALTER COLUMN id SET DEFAULT nextval('animals_id_seq');

ALTER TABLE animals
    ADD FOREIGN KEY (species_id) REFERENCES species(id),
    ADD FOREIGN KEY (owner_id) REFERENCES owners(id);

--Create a table named vets
CREATE TABLE vets (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    age INTEGER,
    date_of_graduation DATE
);

--many-to-many relationship between the tables species and vets:
CREATE TABLE specializations (
    vet_id INTEGER,
    species_id INTEGER,
    PRIMARY KEY (vet_id, species_id),
    FOREIGN KEY (vet_id) REFERENCES vets(id),
    FOREIGN KEY (species_id) REFERENCES species(id)
);

--many-to-many relationship between the tables animals and vets
CREATE TABLE visits (
    animal_id INTEGER,
    vet_id INTEGER,
    visit_date DATE,
    FOREIGN KEY (animal_id) REFERENCES animals(id),
    FOREIGN KEY (vet_id) REFERENCES vets(id)
);

/* Add an email column to owners table */

ALTER TABLE owners ADD COLUMN email VARCHAR(120);


/* 
    Optimized
    - Created an INDEX for the animals ID help us to optimize A LOT the performance of the query.
 */
CREATE INDEX idx_animal_id ON visits (animal_id);
CREATE INDEX idx_vets_id ON visits (vet_id);
CREATE INDEX idx_email ON owners (email);