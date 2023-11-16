--Возвращает имена видов животных, для которых есть данные в таблице animal--
SELECT name
FROM species s
WHERE EXISTS (
    SELECT 1
    FROM animal a
    WHERE a.fk_species_name = s.name
);

--Возвращает имена видов животных и их категории возраста--
SELECT name,
       CASE 
          WHEN age > 5 THEN 'Senior'
          WHEN age > 2 THEN 'Adult'
          ELSE 'Young'
       END AS age_category
FROM animal;

--Возвращает план выполнения запроса для выборки животных в аквариуме--
EXPLAIN SELECT name
FROM animal
WHERE fk_aviary_id = 3;
