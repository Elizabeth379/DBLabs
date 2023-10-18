CREATE TABLE species
(
	species_id smallint PRIMARY KEY,
	name varchar(64) NOT NULL,
	description text
);

CREATE TABLE animal
(
	animal_id smallint PRIMARY KEY,
	name varchar(64) NOT NULL,
	age smallint,
	description text
);