/*Queries that applied in the animals table.*/

/* Find all animals whose name ends in "mon". */
SELECT * FROM animals WHERE name LIKE '%mon';

/* List the name of all animals born between 2016 and 2019. */
SELECT * FROM animals WHERE date_of_birth BETWEEN '20160101' AND '20190101';

/* List the name of all animals that are neutered and have less than 3 escape attempts. */
SELECT name FROM animals WHERE neutered IS true AND escape_attempts < 3;

/* List the date of birth of all animals named either "Agumon" or "Pikachu". */
SELECT date_of_birth as "Date of Birth" FROM animals WHERE name IN ('Agumon', 'Pikachu');

/* List name and escape attempts of animals that weigh more than 10.5kg */
SELECT name, escape_attempts as "Escape attempts" FROM animals WHERE weight_kg > 10.5;

/* Find all animals that are neutered. */
SELECT *  FROM animals WHERE neutered IS true;

/* Find all animals not named Gabumon. */
SELECT *  FROM animals WHERE name NOT IN ('Gabumon');

/* Find all animals with a weight between 10.4kg and 17.3kg (including the animals with the weights that equals precisely 10.4kg or 17.3kg) */
SELECT *  FROM animals WHERE weigth_kg BETWEEN 10.4 and 17.3;

/* Inside a transaction update the animals table by setting the species column to unspecified */
BEGIN;
UPDATE animals
SET species = 'unspecified';

/* Verify that change was made. Then roll back the change and verify that the species columns went back to the state before the transaction. */
SELECT   * FROM animals;
ROLLBACK;
SELECT  * FROM animals;

/* Inside a transaction: */
BEGIN;
/* Update the animals table by setting the species column to digimon for all animals that have a name ending in mon. */
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';

/* Update the animals table by setting the species column to pokemon for all animals that don't have species already set. */
UPDATE animals SET species = 'pokemon' WHERE species IS NULL;

/* Verify that changes were made. */
SELECT  * FROM animals;

/*Commit the transaction. and Verify that changes persist after commit.  */
COMMIT;
SELECT   * FROM animals;

/* Inside a transaction delete all records in the animals table, then roll back the transaction. */
BEGIN;
DELETE FROM animals;
ROLLBACK;

/* After the rollback verify if all records in the animals table still exists */
SELECT   * FROM animals;

/* Delete all animals born after Jan 1st, 2022. */
DELETE FROM animals WHERE date_of_birth > '20220101';

/* Create a savepoint for the transaction. */
BEGIN;
SAVEPOINT SP1;
