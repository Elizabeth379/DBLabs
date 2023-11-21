-- Заполнение данными таблицы food
INSERT INTO food (name) VALUES
('Meat'),
('Hay'),
('Fish'),
('Insects'),
('Grains'),
('Vegetables'),
('Fruits'),
('Nuts'),
('Berries'),
('Pellets'),
('Seeds'),
('Shrimp'),
('Mealworms'),
('Apples'),
('Carrots'),
('Lettuce'),
('Bananas'),
('Walnuts'),
('Blueberries'),
('Dog Food'),
('Cat Food'),
('Rabbit Food'),
('Hay Cubes'),
('Cricket Treats'),
('Almonds');

-- Заполнение данными таблицы food_order
INSERT INTO food_order ( price, fk_food_name, fk_user_id) VALUES
(10, 'Meat', 3),
(5, 'Hay', 7),
(8, 'Fish', 10),
(3, 'Insects', 15),
(6, 'Grains', 20),
(4, 'Vegetables', 2),
(5, 'Fruits', 12),
(3, 'Nuts', 5),
(4, 'Berries', 18),
(7, 'Pellets', 8),
(2, 'Seeds', 11),
(6, 'Shrimp', 14),
(4, 'Mealworms', 1),
(2, 'Apples', 6),
(3, 'Carrots', 11),
(5, 'Lettuce', 16),
(4, 'Bananas', 19),
(8, 'Walnuts', 13),
(5, 'Blueberries', 17),
(9, 'Dog Food', 9),
(7, 'Cat Food', 13),
(6, 'Rabbit Food', 17),
(4, 'Hay Cubes', 19),
(3, 'Cricket Treats', 4),
(5, 'Almonds', 20),
(4, 'Meat', 3),
(6, 'Fish', 7),
(3, 'Insects', 10),
(5, 'Grains', 15),
(8, 'Vegetables', 20);