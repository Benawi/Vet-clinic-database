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
SELECT *  FROM animals WHERE weight_kg BETWEEN 10.4 and 17.3;
/* =======================================================
   ||Vet clinic database project: query and update animals table||
   ======================================================= */
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

/* Update all animals' weight to be their weight multiplied by -1. */
UPDATE animals SET weight_kg = weight_kg * -1;
/* Rollback to the savepoint */
ROLLBACK;

BEGIN;
/* Update all animals' weights that are negative to be their weight multiplied by -1. */
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;

/* Commit transaction */
COMMIT;
SELECT   * FROM animals;

/* How many animals are there? */
SELECT  COUNT(*) as "Animals" FROM animals;

/* How many animals have never tried to escape? */
SELECT  COUNT(*) as "Animals" FROM animals WHERE escape_attempts = 0;

/* What is the average weight of animals? */
SELECT  AVG(weight_kg) as "Average weigth of Animals" FROM animals;

/* Who escapes the most, neutered or not neutered animals? */
SELECT neutered, SUM(escape_attempts) as "Escape Attempts" FROM animals 
GROUP BY neutered;

/* What is the minimum and maximum weight of each type of animal? */
SELECT species as "Species", MIN(weight_kg) as "Min Weight", MAX(weight_kg)as
"Max Weight" FROM animals GROUP BY species;

/* What is the average number of escape attempts per animal type of those born between 1990 and 2000? */
SELECT species as "Species", AVG(escape_attempts) FROM animals WHERE date_of_birth
 BETWEEN '19900101' and '20000101' GROUP BY species;

/* =======================================================
   ||Vet clinic database project: query multiple table  ||
   ======================================================= */
/* What animals belong to Melody Pond? */
 SELECT a.name FROM animals a JOIN owners o ON a.owner_id = o.id
WHERE o.full_name = 'Melody Pond';

/* List of all animals that are pokemon (their type is Pokemon). */
SELECT a.name
FROM animals a 
JOIN species s ON a.species_id = s.id
WHERE s.name = 'Pokemon';

/* List all owners and their animals, remember to include those that don't own any animal. */
SELECT full_name as "Owner", name as "Animal Name"
FROM owners
LEFT JOIN animals
ON owners.id = animals.owner_id;

/* How many animals are there per species? */
SELECT species.name as "Species", COUNT(animals.name) as "Number of Animals"
FROM species
JOIN animals
ON species.id = animals.species_id
GROUP BY species.name;

/* List all Digimon owned by Jennifer Orwell. */
SELECT animals.name as "Animal Name", owners.full_name as "Owner" FROM animals 
JOIN owners
ON animals.owner_id = owners.id
WHERE owners.full_name = 'Jennifer Orwell';

/* List all animals owned by Dean Winchester that haven't tried to escape. */
SELECT animals.name as "Animal Name", owners.full_name as "Owner"
FROM animals
JOIN owners
ON animals.owner_id = owners.id
WHERE owners.full_name = 'Dean Winchester' and animals.escape_attempts = 0; 

/* Who owns the most animals? */
SELECT owners.full_name as "Owners", COUNT(animals.name) as "Number of Animals"
FROM owners
JOIN animals
ON owners.id = animals.owner_id
GROUP BY owners.full_name
ORDER BY "Number of Animals" DESC LIMIT 1;


/* ==============================================================
   ||Vet clinic database project: add "join table" for visits  ||
   ============================================================== */
/* 
    Who was the last animal seen by William Tatcher? */
SELECT vets.name as "Veterinary", animals.name as "Animal",
visits.date_of_visit as "Last Visit"
FROM vets
JOIN visits
ON vets.id = visits.vet_id
JOIN animals ON visits.animal_id = animals.id
WHERE vets.name = 'William Tatcher'
ORDER BY visits.date_of_visit DESC LIMIT 1;

/* How many different animals did Stephanie Mendez see? */
SELECT animals.name as "Animals", vets.name as "Veterinary"
FROM animals
JOIN visits
ON animals.id = visits.animal_id
JOIN vets 
ON visits.vet_id = vets.id
WHERE vets.name = 'Stephanie Mendez'
GROUP BY animals.name, vets.name;

/*  List all vets and their specialties, including vets with no specialties. */
SELECT vets.name as "Veterinaries", species.name as "Specialty"
FROM vets
FULL JOIN specializations
ON vets.id = specializations.vet_id
FULL JOIN species
ON specializations.specie_id = species.id;

 /* List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.*/
SELECT animals.name as "Animals", vets.name as "Veterinary", visits.date_of_visit as "Visit Date"
FROM animals
JOIN visits
ON animals.id = visits.animal_id
JOIN vets 
ON visits.vet_id = vets.id
WHERE vets.name = 'Stephanie Mendez' AND date_of_visit BETWEEN '20200401' AND '20200830'; 

/* -- What animal has the most visits to vets? */

SELECT animals.name as "Animals", COUNT(visits.date_of_visit) as "Number of Visits"
FROM animals
JOIN visits
ON animals.id = visits.animal_id
GROUP BY animals.name
ORDER BY "Number of Visits" DESC LIMIT 1;

/* -- Who was Maisy Smith's first visit? */

SELECT vets.name as "Veterinary", animals.name as "Animal",
visits.date_of_visit as "First Visit"
FROM vets
JOIN visits
ON vets.id = visits.vet_id
JOIN animals ON visits.animal_id = animals.id
WHERE vets.name = 'Maisy Smith'
ORDER BY visits.date_of_visit ASC LIMIT 1;

/* - Details for most recent visit: animal information, vet information, and date of visit.
 */
SELECT 
  animals.id as "Animal Id",
  animals.name as "Animal",
  animals.date_of_birth as "Date of Birth",
  animals.escape_attempts as "Escape Attempts",
  animals.neutered as "Animal is Neutered?",
  animals.weigth_kg as "Animal Weight", 
  vets.id as "Vet Id",
  vets.name as "Veterinary",
  vets.age as "Vet Age",
  vets.date_of_graduation as "Vet Graduation Date", 
  visits.date_of_visit as "Date of Visit"
FROM vets
JOIN visits
ON vets.id = visits.vet_id
JOIN animals ON visits.animal_id = animals.id
ORDER BY visits.date_of_visit DESC LIMIT 1;

/*  How many visits were with a vet that did not specialize in that animal's species? */

SELECT COUNT(visits.date_of_visit) as "Visits were the vet was not specialized in the animal"
FROM animals
LEFT JOIN visits
ON animals.id = visits.animal_id
JOIN vets 
ON visits.vet_id = vets.id
FULL JOIN specializations 
ON vets.id = specializations.vet_id
FULL JOIN species 
ON specializations.specie_id = species.id
WHERE specializations.specie_id != animals.species_id and vets.name != 'Stephanie Mendez' or vets.name = 'Maisy Smith';


/*  What specialty should Maisy Smith consider getting? Look for the species she gets the most.
 */
SELECT count(sp.name) AS "How many calls?",
		sp.name as "Specialty Suggestion:",
		ve.name as "Vet Looking for specialty"
FROM animals an
JOIN owners AS ow ON (an.owner_id = ow.id)
JOIN species AS sp ON (sp.id = an.species_id)
JOIN visits AS vi ON (vi.animal_id = an.id)
JOIN vets AS ve ON (ve.id = vi.vet_id)
left join specializations as spec on (spec.vet_id = ve.id)
WHERE spec.vet_id is null
group by sp.name, ve.name
limit 1;

explain analyze SELECT COUNT(*) FROM visits where animals_id = 4;
explain analyze SELECT * FROM visits where vet_id = 2;
explain analyze SELECT * FROM owners where email = 'owner_18327@mail.com';