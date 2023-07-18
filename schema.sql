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

CREATE TABLE species (
  id INT GENERATED ALWAYS AS IDENTITY,
  name varchar(100) NOT NULL,
  PRIMARY KEY(id)
);