SELECT * FROM food_order
ORDER BY fk_food_name;

--CALL update_animal(1, 'Bimba'::varchar(64), cast(6 as smallint), text('The Lion King'), 'Lion'::varchar(64), cast(1 as smallint));

--CALL update_review(cast(2 as smallint), text('Hello'));

--CALL add_food_order(cast(15 as smallint), 'Apples'::varchar(64), cast(2 as smallint));

--CALL add_new_user('Rick123'::varchar(64), 'Password123'::varchar(32), cast(2 as smallint), cast('+22234' as varchar(13)), 'rick@gmail.com'::varchar(64), 'Richard'::varchar(64), 'Nelson'::varchar(64));

-- UPDATE food
-- SET weight = 2000
-- WHERE name = 'Seeds';

-- UPDATE food
-- SET weight = 3000
-- WHERE name = 'Fish';

--CALL add_food_order(cast(44 as smallint), 'Seeds'::varchar(64), cast(3 as smallint));