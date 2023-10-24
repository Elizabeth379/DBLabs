-- Вставка данных в таблицу species
INSERT INTO species (name, description) VALUES
('Lion', 'Large carnivorous feline'),
('Tiger', 'Big cat with distinctive stripes'),
('Giraffe', 'Tall herbivorous mammal with a long neck'),
('Elephant', 'Large herbivorous mammal with tusks'),
('Penguin', 'Flightless bird with a black and white coloration'),
('Kangaroo', 'Marsupial with powerful hind legs'),
('Zebra', 'Horse-like mammal with black and white stripes'),
('Panda', 'Bear native to south-central China'),
('Koala', 'Tree-dwelling marsupial native to Australia'),
('Gorilla', 'Largest extant primate'),
('Hippopotamus', 'Large herbivorous aquatic mammal'),
('Ostrich', 'Flightless bird native to Africa'),
('Crocodile', 'Large aquatic reptile'),
('Polar Bear', 'Carnivorous bear native to the Arctic Circle'),
('Dolphin', 'Marine mammal known for its intelligence');

-- Вставка данных в таблицу aviary_type
INSERT INTO aviary_type (aviary_type_id, name) VALUES
(1, 'Open-air enclosure'),
(2, 'Indoor exhibit'),
(3, 'Aquatic habitat');

-- Вставка данных в таблицу aviary_size
INSERT INTO aviary_size (aviary_size_id, name) VALUES
(1, 'Small'),
(2, 'Medium'),
(3, 'Large');

-- Вставка данных в таблицу aviary
INSERT INTO aviary (aviary_id, name, fk_aviary_type_id, fk_aviary_size_id) VALUES
(1, 'Savanna Enclosure', 1, 3),
(2, 'Jungle Exhibit', 2, 2),
(3, 'Aquatic Zone', 3, 1);

-- Вставка данных в таблицу animal
INSERT INTO animal (animal_id, name, age, description, fk_species_name, fk_aviary_id) VALUES
(1, 'Simba', 5, 'The Lion King', 'Lion', 1),
(2, 'Tony', 4, 'Striped beauty', 'Tiger', 1),
(3, 'Melman', 6, 'Loves heights', 'Giraffe', 2),
(4, 'Dumbo', 8, 'Big ears and a big heart', 'Elephant', 2),
(5, 'Skipper', 3, 'Leader of the penguins', 'Penguin', 3),
(6, 'Jack', 2, 'Hops around', 'Kangaroo', 1),
(7, 'Marty', 4, 'Striped and wild', 'Zebra', 2),
(8, 'Po', 3, 'Loves bamboo', 'Panda', 2),
(9, 'Kenny', 5, 'Sleeps a lot', 'Koala', 2),
(10, 'Harambe', 8, 'Gentle giant', 'Gorilla', 1),
(11, 'Hippo', 7, 'Loves water', 'Hippopotamus', 3),
(12, 'Ozzie', 5, 'Fast runner', 'Ostrich', 1),
(13, 'Snappy', 6, 'Lives in the water', 'Crocodile', 3),
(14, 'Snowy', 4, 'White fur in the snow', 'Polar Bear', 1),
(15, 'Flipper', 5, 'Friendly and playful', 'Dolphin', 3),
(16, 'Grace', 4, 'Elegant neck', 'Giraffe', 2),
(17, 'Roo', 3, 'Jumps around', 'Kangaroo', 1),
(18, 'Pengy', 2, 'Loves fish', 'Penguin', 3),
(19, 'Stripes', 4, 'Bold black and white', 'Zebra', 2),
(20, 'Bamboo', 3, 'Bamboo lover', 'Panda', 2);
