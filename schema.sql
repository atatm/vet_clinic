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







