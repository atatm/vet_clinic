/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
   id INT GENERATED ALWAYS AS IDENTITY,
   name varchar(50),
   date_of_birth date,
   escape_attempts  INT,
   neutered  boolean,
   weight_kg  decimal,
   PRIMARY KEY(id)
);

 alter table animals
 add column species varchar(250);
 
 create table owners (
 id int GENERATED ALWAYS AS IDENTITY,
 full_name varchar(250),
 age int,
 primary key(id)
);

create table species (
 id int GENERATED ALWAYS AS IDENTITY,
 name varchar(250),
 primary key (id)
);

alter table animals
drop column species;
select * from animals;

alter table animals 
add column species_id int;

alter table animals
add foreign key (species_id) references species(id); 


alter table animals
add column owner_id int;

alter table animals 
add foreign key (owner_id) references owners(id);

select * from animals;

-- Create a table named vets with the following columns:
CREATE TABLE vets ( 
   id INT GENERATED ALWAYS AS IDENTITY,
   name VARCHAR(255), 
   age INT, 
   date_of_graduation date,
   PRIMARY KEY(id) 
 );

 -- Create the specializations table:
 CREATE TABLE specializations (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    vet_id INT REFERENCES vets(id) ON UPDATE CASCADE ON DELETE CASCADE,
    species_id INT REFERENCES species(id) ON UPDATE CASCADE ON DELETE CASCADE
);

-- Create the visits table:
CREATE TABLE visits (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    animal_id INT REFERENCES animals(id) ON UPDATE CASCADE ON DELETE CASCADE,
    vet_id INT REFERENCES vets(id) ON UPDATE CASCADE ON DELETE CASCADE,
    visit_date DATE NOT NULL
);





