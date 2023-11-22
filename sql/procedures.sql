--Изменить информацию о животном
CREATE OR REPLACE PROCEDURE update_animal(
    id integer,
    new_name varchar(64),
	new_age smallint,
	new_desc text,
	new_species_name varchar(64),
	new_aviary_id smallint,
	new_popularity smallint
)
AS
    $$
        BEGIN
            UPDATE animal
            SET
				name = COALESCE(new_name, name),
				age = COALESCE(new_age, age),
				description = COALESCE(new_desc, description),
				
				fk_species_name = COALESCE(new_species_name, fk_species_name),
				fk_aviary_id = COALESCE(new_aviary_id, fk_aviary_id),
				
				new_popularity = COALESCE(new_popularity, popularity)
				
            WHERE animal_id = id;
            COMMIT;
        END;
    $$
LANGUAGE plpgsql;

-- Создать нового пользователя и его профиль
CREATE OR REPLACE PROCEDURE add_new_user(
    u_username varchar(64),
    u_password varchar(32),
    u_role_id smallint,
	u_phone varchar(13),
	u_email varchar(64),
    u_first_name varchar(64),
    u_last_name varchar(64)
)
AS $$
DECLARE
    u_user_id smallint;
BEGIN
    INSERT INTO "user" (username, password, role_id)
    VALUES (u_username, u_password, u_role_id)
    RETURNING user_id INTO u_user_id;

    INSERT INTO profile (user_id, phone, email, first_name, last_name)
    VALUES (u_user_id, u_email,u_phone, u_first_name, u_last_name);
END;
$$ LANGUAGE plpgsql;
