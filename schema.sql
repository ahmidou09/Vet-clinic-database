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