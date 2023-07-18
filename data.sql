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
  WHERE name IN ('%mon1%', '%mon2%')  
)
WHERE name LIKE '%mon';
COMMIT;