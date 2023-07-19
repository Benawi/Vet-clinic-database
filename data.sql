/* Populate the animals table with the following data. */

INSERT INTO animals VALUES 
(default, 'Agumon', '20200203', 0, true, 10.23 ),
(default, 'Gabumon', '20181115', 2, true, 8 ),
(default, 'Pikachu', '20210107', 1, false, 15.04 ),
(default, 'Devimon', '20170512', 5, true, 11 );

INSERT INTO animals VALUES
/* Animal: His name is Charmander. He was born on Feb 8th, 2020, and currently weighs -11kg. He is not neutered and he has never tried to escape */
(default, 'Charmander', '20200208', 0, false, -11 ),
/* Animal: Her name is Plantmon. She was born on Nov 15th, 2021, and currently weighs -5.7kg. She is neutered and she has tried to escape 2 times. */
(default, 'Plantmon', '20221115', 2, true, -5.7 ),
/* Animal: His name is Squirtle. He was born on Apr 2nd, 1993, and currently weighs -12.13kg. He was not neutered and he has tried to escape 3 times. */
(default, 'Squirtle', '19930402', 3, false, -12.13 ),
/* Animal: His name is Angemon. He was born on Jun 12th, 2005, and currently weighs -45kg. He is neutered and he has tried to escape once. */
(default, 'Angemon', '20050712', 1, true, -45 ),
/* Animal: His name is Boarmon. He was born on Jun 7th, 2005, and currently weighs 20.4kg. He is neutered and he has tried to escape 7 times. */
(default, 'Boarmon', '20050707', 7, true, 20.4 ),
/* Animal: Her name is Blossom. She was born on Oct 13th, 1998, and currently weighs 17kg. She is neutered and she has tried to escape 3 times. */
(default, 'Blossom', '19981013', 3, true, 17 ),
/*  Animal: His name is Ditto. He was born on May 14th, 2022, and currently weighs 22kg. He is neutered and he has tried to escape 4 times.*/
(default, 'Ditto', '20220614', 4, true, 22 );

/* Insert the following data into the owners  */
INSERT INTO owners(full_name, age) VALUES ('Sam Smith', 34),
('Jennifer Orwell', 19),
('Bob', 45),
('Melody Pond', 77),
('Dean Winchester', 14),
('Jodie Whittaker', 38);

/* Insert the following data into the species */
INSERT INTO species(name) VALUES ('Pokemon'),('Digimon');

/* Modify inserted animals so it includes the species_id value:
If the name ends in "mon" it will be Digimon */

BEGIN;
UPDATE animals
SET species_id = (
  SELECT id FROM species
  WHERE name ='Pokemon'
)
WHERE name LIKE '%mon';
COMMIT;

/* Modify your inserted animals so it includes the species_id value:
If the name not ends in "mon" it will be Digimon */
BEGIN;
UPDATE animals
SET species_id = (
  SELECT id FROM species
  WHERE name ='Digimon'
)
WHERE name NOT LIKE '%mon';
COMMIT;

/* Modify your inserted animals to include owner information (owner_id) */
BEGIN;
UPDATE animals
SET owner_id = (SELECT id from owners WHERE full_name = 'Sam Smith')
WHERE name = 'Agumon';
COMMIT;

BEGIN;
UPDATE animals
SET owner_id = (SELECT id from owners WHERE full_name = 'Jennifer Orwell')
WHERE name = 'Gabumon' OR name = 'Pikachu';
COMMIT;

BEGIN;
UPDATE animals
SET owner_id = (SELECT id from owners WHERE full_name = 'Bob')
WHERE name = 'Devimon' OR name = 'Plantmon';
COMMIT;

BEGIN;
UPDATE animals
SET owner_id = (SELECT id from owners WHERE full_name = 'Melody Pond')
WHERE name = 'Charmander' OR name = 'Squirtle' OR name = 'Blossom';
COMMIT;

BEGIN;
UPDATE animals
SET owner_id = (SELECT id from owners WHERE full_name = 'Dean Winchester')
WHERE name = 'Angemon'  OR name = 'Boarmon';
COMMIT;

/* Insert the following data for vets */
INSERT INTO vets(name, age, date_of_graduation) 
VALUES ('William Tatcher', 45, '20000423'),
('Maisy Smith', 26, '20190117'),
('Stephanie Mendez', 64, '19810504'),
('Jack Harkness', 38, '20080608');

/* Insert the following data for specializations */
BEGIN;
INSERT INTO specializations(vet_id, specie_id) VALUES(
(SELECT vt.id from vets vt WHERE vt.name = 'William Tatcher'), 
(SELECT sp.id from species sp WHERE sp.name = 'Pokemon'));
COMMIT;

BEGIN;
INSERT INTO specializations(vet_id, specie_id) VALUES(
(SELECT vt.id from vets vt WHERE vt.name = 'Stephanie Mendez'), 
(SELECT id from species WHERE name = 'Digimon'));
COMMIT;

BEGIN;
INSERT INTO specializations(vet_id, specie_id) VALUES(
(SELECT vt.id from vets vt WHERE vt.name = 'Stephanie Mendez'), 
(SELECT id from species WHERE name = 'Pokemon'));
COMMIT;

BEGIN;
INSERT INTO specializations(vet_id, specie_id) VALUES(
(SELECT id from vets WHERE name = 'Jack Harkness'),
(SELECT id from species WHERE name = 'Digimon'));
COMMIT;

/* Insert the following data for visits */
BEGIN;
INSERT INTO visits(animal_id, vet_id, date_of_visit) VALUES
(
  (SELECT id from animals WHERE name = 'Agumon'),
  (SELECT id from vets WHERE name = 'William Tatcher'),
  '20200524'
),
(
  (SELECT id from animals WHERE name = 'Agumon'),
  (SELECT id from vets WHERE name = 'Stephanie Mendez'),
  '20200722'
),
(
  (SELECT id from animals WHERE name = 'Gabumon'),
  (SELECT id from vets WHERE name = 'Jack Harkness'),
  '20210202'
),
(
  (SELECT id from animals WHERE name = 'Pikachu'),
  (SELECT id from vets WHERE name = 'Maisy Smith'),
  '20200105'
),
(
  (SELECT id from animals WHERE name = 'Pikachu'),
  (SELECT id from vets WHERE name = 'Maisy Smith'),
  '20200308'
),
(
  (SELECT id from animals WHERE name = 'Pikachu'),
  (SELECT id from vets WHERE name = 'Maisy Smith'),
  '20200514'
),
(
  (SELECT id from animals WHERE name = 'Devimon'),
  (SELECT id from vets WHERE name = 'Stephanie Mendez'),
  '20210504'
),
(
  (SELECT id from animals WHERE name = 'Charmander'),
  (SELECT id from vets WHERE name = 'Jack Harkness'),
  '20210224'
),
(
  (SELECT id from animals WHERE name = 'Plantmon'),
  (SELECT id from vets WHERE name = 'Maisy Smith'),
  '20191221'
),
(
  (SELECT id from animals WHERE name = 'Plantmon'),
  (SELECT id from vets WHERE name = 'William Tatcher'),
  '20200810'
),
(
  (SELECT id from animals WHERE name = 'Plantmon'),
  (SELECT id from vets WHERE name = 'Maisy Smith'),
  '20210407'
),
(
  (SELECT id from animals WHERE name = 'Squirtle'),
  (SELECT id from vets WHERE name = 'Stephanie Mendez'),
  '20190929'
),
(
  (SELECT id from animals WHERE name = 'Angemon'),
  (SELECT id from vets WHERE name = 'Jack Harkness'),
  '20201003'
),
(
  (SELECT id from animals WHERE name = 'Angemon'),
  (SELECT id from vets WHERE name = 'Jack Harkness'),
  '20201104'
),
(
  (SELECT id from animals WHERE name = 'Boarmon'),
  (SELECT id from vets WHERE name = 'Maisy Smith'),
  '20190124'
),
(
  (SELECT id from animals WHERE name = 'Boarmon'),
  (SELECT id from vets WHERE name = 'Maisy Smith'),
  '20190515'
),
(
  (SELECT id from animals WHERE name = 'Boarmon'),
  (SELECT id from vets WHERE name = 'Maisy Smith'),
  '20200227'
),
(
  (SELECT id from animals WHERE name = 'Boarmon'),
  (SELECT id from vets WHERE name = 'Maisy Smith'),
  '20200803'
),
(
  (SELECT id from animals WHERE name = 'Blossom'),
  (SELECT id from vets WHERE name = 'Stephanie Mendez'),
  '20200524'
),
(
  (SELECT id from animals WHERE name = 'Blossom'),
  (SELECT id from vets WHERE name = 'Maisy Smith'),
  '20210111'
);
COMMIT;
