INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg)
VALUES('Agumon', date'2020-02-03','0','TRUE','10.23'),
('Gabumon', date'2018-11-15','2','TRUE','8'),
('Pikachu', date'2021-01-07','1','FALSE','15.04'),
('Devimon', date'2017-05-12','5','TRUE','11');

-- Add animals data
INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg)
VALUES('Charmander',date'2020-02-08', '0', 'FALSE', '-11'),
('Plantmon',date'2021-10-15', '2', 'TRUE', '-5.7'),
('Squirtle',date'1993-04-02', '3', ' FALSE', '-12.13'),
('Angemon',date'2005-06-12', '1', 'TRUE', '-45'),
('Boarmon',date'2005-06-07', '7', 'TRUE', '20.4'),
('Blossom',date'1998-10-13', '3', 'TRUE ', '17'),
('Ditto',date'2022-05-14', '4', 'TRUE ', '22'),


--Add owners data
INSERT INTO owners (full_name, age)  VALUES ( 'Sam Smith',34),('Jennifer Orwell',19),('Bob',45),('Melody Pond',77),('Dean Winchester',14),('Jodie Whittaker',38);

--ADD species data

INSERT INTO  species (name) VALUES ('Pokemon'),('Digimon');


-- Modify animals so it includes the species_id value

update animals SET species_id =(SELECT id From species WHERE name = 'Digimon') WHERE name LIKE '%mon%';
update animals SET species_id =(SELECT id From species WHERE name = 'Pokemon') WHERE name not LIKE '%mon%';

-- Modify your inserted animals to include owner information (owner_id)
update animals SET owner_id =(SELECT id From  owners WHERE full_name='Sam Smith') WHERE name ='Agumon';
update animals SET owner_id =(SELECT id From  owners WHERE full_name='Jennifer Orwell') WHERE name in ('Gabumon','Pikachu');
update animals SET owner_id =(SELECT id From  owners WHERE full_name='Bob') WHERE name in ('Devimon','Plantmon');
update animals SET owner_id =(SELECT id From  owners WHERE full_name='Melody Pond') WHERE name in ('Charmander','Squirtle','Blossom');
update animals SET owner_id =(SELECT id From  owners WHERE full_name='Dean Winchester') WHERE name in ('Angemon','Boarmon');
