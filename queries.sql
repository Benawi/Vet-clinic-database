
/* Find all animals whose name ends in "mon". */
SELECT * FROM animals WHERE name LIKE '%mon';

/* List the name of all animals born between 2016 and 2019. */
SELECT * FROM animals WHERE date_of_birth BETWEEN '20160101' AND '20190101';

/* List the name of all animals that are neutered and have less than 3 escape attempts. */
SELECT name FROM animals WHERE neutered IS true AND escape_attempts < 3;

/* List the date of birth of all animals named either "Agumon" or "Pikachu". */
SELECT date_of_birth as "Date of Birth" FROM animals WHERE name IN ('Agumon', 'Pikachu');