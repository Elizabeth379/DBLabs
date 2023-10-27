SELECT * FROM animal;

SELECT name, age FROM animal;

SELECT name, age * 2
FROM animal;

SELECT name AS nickname, 
age * 2  AS doubleage
FROM animal;

SELECT * FROM animal
WHERE age = 5;

SELECT * FROM animal
WHERE age < 5;

SELECT * FROM animal
WHERE fk_species_name = 'Zebra' AND age < 5;

SELECT * FROM animal
WHERE age IS NULL;

SELECT * FROM animal
WHERE age IS NOT NULL;

SELECT * FROM "user"
WHERE fk_role_id = (SELECT role_id FROM "role" WHERE name = 'superuser');

SELECT COUNT(*) AS user_count FROM "user";

SELECT COUNT(*)
FROM "user"
WHERE fk_role_id = (SELECT role_id FROM "role" WHERE name = 'staff');

SELECT * FROM "user"
ORDER BY username;

SELECT first_name, last_name
FROM profile
ORDER BY first_name, last_name;

-- Животных в каждом вольере
SELECT fk_aviary_id, COUNT(*) AS animal_count
FROM animal
GROUP BY fk_aviary_id;

-- Средний возраст животных для каждого вида
SELECT fk_species_name, AVG(age) AS average_age
FROM animal
GROUP BY fk_species_name;

-- Первые 5 видов животных и их количество
SELECT fk_species_name, COUNT(*) AS animal_count
FROM animal
GROUP BY fk_species_name
LIMIT 5;

-- Хотя бы один представитель младше 4 лет
SELECT fk_species_name
FROM animal
WHERE age < 4
GROUP BY fk_species_name
HAVING COUNT(*) > 0;

SELECT DISTINCT fk_species_name FROM animal;

-- Уникальный вид, более чем 1 представитель
SELECT DISTINCT fk_species_name
FROM animal
GROUP BY fk_species_name
HAVING COUNT(*) > 1;
