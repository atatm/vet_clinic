/* Populate database with sample data. */

insert into animals(name,date_of_birth,escape_attempts,neutered,weight_kg) values('Agumon','3-Feb-2020',0,true,10.23);
insert into animals(name,date_of_birth,escape_attempts,neutered,weight_kg) values('Gabumon','15-Nov-2018',2,true,8);
insert into animals(name,date_of_birth,escape_attempts,neutered,weight_kg) values('Pikachu','7-Jan-2021',1,false,15.04);
insert into animals(name,date_of_birth,escape_attempts,neutered,weight_kg) values('Devimon','12-May-2017',5,true,11);


insert into animals(name,date_of_birth,escape_attempts,neutered,weight_kg) values('Charmander','8-Feb-2020',0,false,-11);
insert into animals(name,date_of_birth,escape_attempts,neutered,weight_kg) values('Plantmon','15-Nov-2021',2,true,-5.7);
insert into animals(name,date_of_birth,escape_attempts,neutered,weight_kg) values('Squirtle','2-Apr-1993',3,false,-12.13);
insert into animals(name,date_of_birth,escape_attempts,neutered,weight_kg) values('Angemon','12-Jun-2005',1,true,-45);
insert into animals(name,date_of_birth,escape_attempts,neutered,weight_kg) values('Boarmon','7-Jun-2005',7,true,20.4);
insert into animals(name,date_of_birth,escape_attempts,neutered,weight_kg) values('Blossom','13-Oct-1998',3,true,17);
insert into animals(name,date_of_birth,escape_attempts,neutered,weight_kg) values('Ditto','14-May-2022',4,true,22);


insert into owners (full_name,age) values ('Sam Smith',34);
insert into owners (full_name,age) values ('Jennifer Orwell',19),('Bob',45),('Melody Pond',77),('Dean Winchester',14),('Jodie Whittaker',38);
select * from owners;

insert into species (name) values ('Pokemon'),('Digimon');
select * from species;

update animals
SET species_id = (
    SELECT id FROM species WHERE name = (
        CASE
            WHEN animals.name LIKE '%mon' THEN 'Digimon'
            ELSE 'Pokemon'
        END
    )
); 

select * from animals;

UPDATE animals 
SET owner_id = (
    SELECT id FROM owners WHERE full_name = (
        CASE animals.name 
            WHEN 'Agumon' THEN 'Sam Smith' 
            WHEN 'Gabumon' THEN 'Jennifer Orwell' 
            WHEN 'Pikachu' THEN 'Jennifer Orwell' 
            WHEN 'Devimon' THEN 'Bob' 
            WHEN 'Plantmon' THEN 'Bob' 
            WHEN 'Charmander' THEN 'Melody Pond' 
            WHEN 'Squirtle' THEN 'Melody Pond' 
            WHEN 'Blossom' THEN 'Melody Pond' 
            WHEN 'Angemon' THEN 'Dean Winchester' 
            WHEN 'Boarmon' THEN 'Dean Winchester' 
        END
    )
);

-- Insert the following data for vets:
INSERT INTO vets (name, age, date_of_graduation) VALUES ('William Tatcher','45','2000-04-23'),
('Maisy Smith','26','2019-01-17'),('Stephanie Mendez','64','1981-05-04'),
('Jack Harkness','38','2008-06-08');

-- Insert the following data for specialties:
INSERT INTO specializations (vet_id, species_id) VALUES 
((SELECT id FROM vets WHERE name = 'William Tatcher'),
 (SELECT id FROM species WHERE name = 'Pokemon')),
((SELECT id FROM vets WHERE name = 'Stephanie Mendez'),
 (SELECT id FROM species WHERE name = 'Pokemon')),
((SELECT id FROM vets WHERE name = 'Stephanie Mendez'),
 (SELECT id FROM species WHERE name = 'Digimon')),
((SELECT id FROM vets WHERE name = 'Jack Harkness'),
 (SELECT id FROM species WHERE name = 'Digimon'));


  
   INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES
    ((SELECT id FROM animals WHERE name = 'Agumon'), 
    (SELECT id FROM vets WHERE name = 'William Tatcher'), '2020-05-24'),
    ((SELECT id FROM animals WHERE name = 'Agumon'), 
    (SELECT id FROM vets WHERE name = 'Stephanie Mendez'), '2020-07-22'),
    ((SELECT id FROM animals WHERE name = 'Gabumon'), 
    (SELECT id FROM vets WHERE name = 'Jack Harkness'), '2021-02-02'),
    ((SELECT id FROM animals WHERE name = 'Pikachu'), 
    (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2020-01-05'),
    ((SELECT id FROM animals WHERE name = 'Pikachu'), 
    (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2020-03-08'),
    ((SELECT id FROM animals WHERE name = 'Pikachu'), 
    (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2020-05-14'),
    ((SELECT id FROM animals WHERE name = 'Devimon'), 
    (SELECT id FROM vets WHERE name = 'Stephanie Mendez'), '2021-05-04'),
    ((SELECT id FROM animals WHERE name = 'Charmander'), 
    (SELECT id FROM vets WHERE name = 'Jack Harkness'), '2021-02-24'),
    ((SELECT id FROM animals WHERE name = 'Plantmon'), 
    (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2019-12-21'),
    ((SELECT id FROM animals WHERE name = 'Plantmon'), 
    (SELECT id FROM vets WHERE name = 'William Tatcher'), '2020-08-10'),
    ((SELECT id FROM animals WHERE name = 'Plantmon'), 
    (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2021-04-07'),
    ((SELECT id FROM animals WHERE name = 'Squirtle'), 
    (SELECT id FROM vets WHERE name = 'Stephanie Mendez'), '2019-09-29'),
    ((SELECT id FROM animals WHERE name = 'Angemon'), 
    (SELECT id FROM vets WHERE name = 'Jack Harkness'), '2020-10-03'),
    ((SELECT id FROM animals WHERE name = 'Angemon'), 
    (SELECT id FROM vets WHERE name = 'Jack Harkness'), '2020-11-04'),
    ((SELECT id FROM animals WHERE name = 'Boarmon'), 
    (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2019-01-24'),
    ((SELECT id FROM animals WHERE name = 'Boarmon'), 
    (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2019-05-15'),
    ((SELECT id FROM animals WHERE name = 'Boarmon'), 
    (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2020-02-27'),
    ((SELECT id FROM animals WHERE name = 'Boarmon'), 
    (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2020-08-03'),
    ((SELECT id FROM animals WHERE name = 'Blossom'), 
    (SELECT id FROM vets WHERE name = 'Stephanie Mendez'), '2020-05-24'),
    ((SELECT id FROM animals WHERE name = 'Blossom'), 
    (SELECT id FROM vets WHERE name = 'William Tatcher'), '2021-01-11');



