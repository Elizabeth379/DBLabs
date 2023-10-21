DROP TABLE IF EXISTS species;
DROP TABLE IF EXISTS animal;
DROP TABLE IF EXISTS aviary;
DROP TABLE IF EXISTS aviary_type;
DROP TABLE IF EXISTS aviary_size;
DROP TABLE IF EXISTS profile;
DROP TABLE IF EXISTS "user";
DROP TABLE IF EXISTS "role";
DROP TABLE IF EXISTS rewiew;
DROP TABLE IF EXISTS food;
DROP TABLE IF EXISTS food_order;
DROP TABLE IF EXISTS ticket_type;
DROP TABLE IF EXISTS ticket;
DROP TABLE IF EXISTS action_type;
DROP TABLE IF EXISTS "action";

CREATE TABLE species
(
	name varchar(64) PRIMARY KEY,
	description text
);

CREATE TABLE aviary_type
(
	aviary_type_id smallint PRIMARY KEY,
	name varchar(64) NOT NULL
);

CREATE TABLE aviary
(
	aviary_id smallint PRIMARY KEY,
	name varchar(64) NOT NULL,
	fk_aviary_type_id smallint,
	FOREIGN KEY (fk_aviary_type_id) REFERENCES aviary_type(aviary_type_id) ON DELETE CASCADE ON UPDATE CASCADE

);

CREATE TABLE animal
(
	animal_id smallint PRIMARY KEY,
	name varchar(64) NOT NULL,
	age smallint,
	description text,
	fk_species_name varchar(64),
	fk_aviary_id smallint NOT NULL DEFAULT 0,
	FOREIGN KEY (fk_species_name) REFERENCES species(name) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (fk_aviary_id) REFERENCES aviary(aviary_id) ON DELETE SET DEFAULT ON UPDATE CASCADE

);

CREATE TABLE aviary_size
(
	aviary_size_id smallint PRIMARY KEY,
	name varchar(64) NOT NULL
);

CREATE TABLE "role"
(
	role_id smallint PRIMARY KEY,
	name varchar(64) NOT NULL
);

CREATE TABLE "user"
(
	user_id smallint PRIMARY KEY,
	username varchar(64) NOT NULL,
    password varchar(32) NOT NULL UNIQUE,
	fk_role_id smallint,
	FOREIGN KEY (fk_role_id) REFERENCES "role"(role_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE profile
(
	profile_id smallint PRIMARY KEY,
	phone varchar(10) UNIQUE,
	email varchar(64) UNIQUE,
    first_name varchar(64) NOT NULL,
    last_name varchar(64) NOT NULL,
	fk_user_id smallint UNIQUE,
	FOREIGN KEY (fk_user_id) REFERENCES "user"(user_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE rewiew
(
	rewiew_id smallint PRIMARY KEY,
	rewiew_text text NOT NULL,
	rewiew_time timestamp NOT NULL,
	fk_user_id smallint NOT NULL DEFAULT 0,
	FOREIGN KEY (fk_user_id) REFERENCES "user"(user_id) ON DELETE SET DEFAULT ON UPDATE CASCADE
);

CREATE TABLE food
(
	name varchar(64) PRIMARY KEY
);

CREATE TABLE food_order
(
	food_order_id smallint PRIMARY KEY,
	price smallint NOT NULL,
	fk_food_name varchar(64),
	fk_user_id smallint NOT NULL,
	FOREIGN KEY (fk_user_id) REFERENCES "user"(user_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (fk_food_name) REFERENCES food(name) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE ticket_type
(
	ticket_type_id smallint PRIMARY KEY,
	name varchar(64) NOT NULL
);

CREATE TABLE ticket
(
	ticket_id smallint PRIMARY KEY,
	price smallint NOT NULL,
	fk_ticket_type_id smallint,
	fk_user_id smallint NOT NULL,
	FOREIGN KEY (fk_user_id) REFERENCES "user"(user_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (fk_ticket_type_id) REFERENCES ticket_type(ticket_type_id) ON DELETE CASCADE ON UPDATE CASCADE

);

CREATE TABLE action_type
(
    name varchar(32) PRIMARY KEY

);

CREATE TABLE "action"
(
    action_id integer PRIMARY KEY,
    action_time timestamp NOT NULL,
	fk_action_type_name varchar(32) NOT NULL,
	fk_user_id smallint NOT NULL,
	FOREIGN KEY (fk_user_id) REFERENCES "user"(user_id) ON DELETE SET NULL ON UPDATE CASCADE,
	FOREIGN KEY (fk_action_type_name) REFERENCES action_type(name) ON DELETE CASCADE ON UPDATE CASCADE
);
