--Присоединение species и animal по видам--
SELECT animal.animal_id, animal.name AS animal_name, animal.age, animal.description AS animal_description, species.name AS species_name
FROM animal
INNER JOIN species ON animal.fk_species_name = species.name;

--Присоединение animal, species, aviary, и aviary_type для полной информации с типами вольеров--
SELECT animal.animal_id, animal.name AS animal_name, animal.age, animal.description AS animal_description, species.name AS species_name, aviary.name AS aviary_name, aviary_type.name AS aviary_type
FROM animal
INNER JOIN species ON animal.fk_species_name = species.name
INNER JOIN aviary ON animal.fk_aviary_id = aviary.aviary_id
INNER JOIN aviary_type ON aviary.fk_aviary_type_id = aviary_type.aviary_type_id;

--все записи из левой таблицы и соответствующие записи из правой--
SELECT animal.animal_id, animal.name AS animal_name, animal.age, animal.description AS animal_description, species.name AS species_name
FROM animal
LEFT OUTER JOIN species ON animal.fk_species_name = species.name;

--все записи из правой таблицы и соответствующие записи из левой--
SELECT species.name AS species_name, animal.animal_id, animal.name AS animal_name, animal.age, animal.description AS animal_description
FROM species
RIGHT OUTER JOIN animal ON species.name = animal.fk_species_name;

--все записи из обеих таблиц, заполняя NULL для несоответствующих записей--
SELECT animal.animal_id, animal.name AS animal_name, animal.age, animal.description AS animal_description, species.name AS species_name
FROM animal
FULL OUTER JOIN species ON animal.fk_species_name = species.name;

--набор строк, где каждая строка из одной таблицы соединяется с каждой строкой из второй таблицы--
SELECT species.name AS species_name, aviary.name AS aviary_name
FROM species
CROSS JOIN aviary;

--Объединение имен видов животных из таблиц species и animal--
SELECT name FROM species
UNION 
SELECT fk_species_name FROM animal;

--Разность имен видов животных между таблицами species и animal--
SELECT name FROM species
EXCEPT
SELECT fk_species_name FROM animal;

--Пересечение имен видов животных между таблицами species и animal--
SELECT name FROM species
INTERSECT
SELECT fk_species_name FROM animal;

