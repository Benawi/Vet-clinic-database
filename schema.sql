/* Database schema to keep the structure of entire database. */
/* Create a table named animals */
CREATE TABLE animals(
    id INT PRIMARY KEY,
    name varchar(100) NOT NULL,
    date_of_birth date NOT NULL,
    escape_attempts INT, 
    neutered boolean NOT NULL, 
    weight_kg float NOT NULL);