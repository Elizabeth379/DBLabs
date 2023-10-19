DROP TABLE IF EXISTS species;
DROP TABLE IF EXISTS animal;
DROP TABLE IF EXISTS aviary;
DROP TABLE IF EXISTS aviary_type;
DROP TABLE IF EXISTS aviary_size;
DROP TABLE IF EXISTS profile;
DROP TABLE IF EXISTS client;
DROP TABLE IF EXISTS place;
DROP TABLE IF EXISTS rewiew;

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

CREATE TABLE aviary
(
	aviary_id smallint PRIMARY KEY,
	name varchar(64) NOT NULL
);

CREATE TABLE aviary_type
(
	aviary_type_id smallint PRIMARY KEY,
	name varchar(64) NOT NULL
);

CREATE TABLE aviary_size
(
	aviary_size_id smallint PRIMARY KEY,
	name varchar(64) NOT NULL
);

CREATE TABLE profile
(
	profile_id smallint PRIMARY KEY,
	phone varchar(10) UNIQUE,
	email varchar(64) UNIQUE,
    first_name varchar(64) NOT NULL,
    last_name varchar(64) NOT NULL
);

CREATE TABLE client
(
	client_id smallint PRIMARY KEY,
	username varchar(64) NOT NULL,
    password varchar(32) NOT NULL UNIQUE
);

CREATE TABLE place
(
	place_id smallint PRIMARY KEY,
	name varchar(64) NOT NULL
);

CREATE TABLE rewiew
(
	rewiew_id smallint PRIMARY KEY,
	rewiew_text text NOT NULL,
	rewiew_time timestamp NOT NULL
);

CREATE TABLE food
(
	food_id smallint PRIMARY KEY,
	name varchar(64) NOT NULL
);

CREATE TABLE food_order
(
	food_order_id smallint PRIMARY KEY,
	price smallint NOT NULL
);

CREATE TABLE ticket_type
(
	ticket_type_id smallint PRIMARY KEY,
	name varchar(64) NOT NULL
);

CREATE TABLE ticket
(
	ticket_id smallint PRIMARY KEY,
	price smallint NOT NULL
);