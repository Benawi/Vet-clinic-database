/* Database schema to keep the structure of entire database. */
/*Create sequence and  a table named animals */
CREATE SEQUENCE table_id_seq;
CREATE TABLE animals(id INTEGER NOT NULL DEFAULT nextval('table_id_seq'),
 name varchar(100) NOT NULL,
 date_of_birth date NOT NULL, 
 escape_attempts INT, 
 neutered boolean NOT NULL,
 weight_kg float NOT NULL, 
 PRIMARY KEY(id));

/* Add a column species of type string to animals table.  */
ALTER TABLE animals 
ADD COLUMN species VARCHAR(100);

/* Create a table named owners */
CREATE TABLE owners (
  id INT GENERATED ALWAYS AS IDENTITY,
  full_name varchar(100) NOT NULL,
  age INT NOT NULL,
  PRIMARY KEY(id)
);

/* Create a table named species */
CREATE TABLE species (
  id INT GENERATED ALWAYS AS IDENTITY,
  name varchar(100) NOT NULL,
  PRIMARY KEY(id)
);

/* Remove column species */
 ALTER TABLE animals DROP COLUMN species;

/*Add column owner_id which is a foreign key referencing the owners table */
ALTER TABLE animals
ADD species_id INT,
ADD  owner_id INT,
ADD  CONSTRAINT fk_species
FOREIGN KEY(species_id)
REFERENCES species(id)
ON DELETE CASCADE,
/* Add column species_id which is a foreign key referencing species table*/
ADD  CONSTRAINT fk_owners
FOREIGN KEY(owner_id)
REFERENCES owners(id)
ON DELETE CASCADE;

/* ==============================================================
   ||Vet clinic database project: add "join table" for visits  ||
   ============================================================== */
   
/* Create a table named vets */
CREATE TABLE vets(
  id INT GENERATED ALWAYS AS IDENTITY,
  name varchar(80) NOT NULL,
  age INT NOT NULL,
  date_of_graduation date NOT NULL,
  PRIMARY KEY(id)
);

/* Create a "join table" called specializations */
CREATE TABLE specializations(
  id INT GENERATED ALWAYS AS IDENTITY,
  specie_id INT NOT NULL,
  vet_id INT NOT NULL,
  CONSTRAINT fk_species
    FOREIGN KEY(specie_id)
      REFERENCES species(id)
        ON DELETE CASCADE,
  CONSTRAINT fk_vets
    FOREIGN KEY(vet_id)
      REFERENCES vets(id)
        ON DELETE CASCADE,
  PRIMARY KEY(id)
);

/* Create a "join table" called visits  */
CREATE TABLE visits(
  id INT GENERATED ALWAYS AS IDENTITY,
  animal_id INT NOT NULL,
  vet_id INT NOT NULL,
  date_of_visit date NOT NULL,
  CONSTRAINT fk_animals
    FOREIGN KEY(animal_id)
      REFERENCES animals(id)
        ON DELETE CASCADE,
  CONSTRAINT fk_vets
    FOREIGN KEY(vet_id)
      REFERENCES vets(id)
        ON DELETE CASCADE,
  PRIMARY KEY(id)
);