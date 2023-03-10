/*Queries that provide answers to the questions from all projects.*/

select * from animals where name like '%mon';
select name from animals where date_of_birth between '2016-01-01' AND '2019-12-31';
select name from animals where neutered = true and escape_attempts < 3;
select date_of_birth from animals where name in ('Agumon','Pikachu');
select name,escape_attempts from animals where weight_kg > 10.5;
select * from animals where neutered=true;
select * from animals where name not like 'Gabumon';
select * from animals where weight_kg >=10.4 and weight_kg <=17.3 ;


BEGIN; 
UPDATE animals SET species = 'unspecified';
SELECT * from animals;
ROLLBACK;
SELECT * from animals;


BEGIN;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokemon' WHERE species is NULL;
COMMIT;
SELECT * from animals;


BEGIN;
DELETE FROM animals;
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;


BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT date2022;
UPDATE animals SET weight_kg = weight_kg * -1;
ROLLBACK TO date2022;
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
COMMIT;
SELECT * FROM animals;

SELECT COUNT(*) FROM animals;
SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;
SELECT name,AVG(weight_kg) FROM animals GROUP BY name;
SELECT neutered, COUNT(*) FROM animals GROUP BY neutered ORDER BY COUNT(*) DESC LIMIT 1;
SELECT species, MIN(weight_kg), MAX(weight_kg) FROM animals GROUP BY species;
SELECT species, AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY species;


SELECT name, full_name
FROM animals A
JOIN owners O ON A.owner_id = O.id
WHERE O.full_name = 'Melody Pond';

SELECT A.name, S.name
FROM animals A
JOIN species S ON A.species_id = S.id
WHERE S.name = 'Pokemon';


SELECT O.full_name, A.name
FROM owners O
LEFT JOIN animals A ON O.id = A.owner_id;

SELECT S.name, COUNT(A.name)
FROM species S
JOIN animals A ON S.id = A.species_id 
GROUP BY S.name;


SELECT A.name,O.full_name
FROM animals A
JOIN species S ON A.species_id = S.id
JOIN owners O ON A.owner_id = O.id
WHERE S.name = 'Digimon' AND O.full_name = 'Jennifer Orwell';


SELECT A.name,O.full_name
FROM animals A
JOIN owners O ON A.owner_id = O.id
WHERE O.full_name = 'Dean Winchester' AND escape_attempts = 0;

SELECT owners.full_name, COUNT(owners.full_name) FROM animals
   LEFT JOIN owners
   ON animals.species_id = owners.id
   GROUP BY owners.full_name
   ORDER BY COUNT(owners.full_name) DESC


