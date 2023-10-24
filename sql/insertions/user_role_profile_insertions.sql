-- Вставка данных в таблицу "role"
INSERT INTO "role" (role_id, name) VALUES
(1, 'superuser'),
(2, 'staff'),
(3, 'common');

-- Вставка данных в таблицу "user"
INSERT INTO "user" (user_id, username, password, fk_role_id) VALUES
(1, 'admin', 'admin123', 1),
(2, 'manager', 'manager123', 2),
(3, 'user1', 'user123', 3),
(4, 'user2', 'user456', 3),
(5, 'user3', 'user789', 3),
(6, 'john_doe', 'password1', 3),
(7, 'jane_doe', 'password2', 3),
(8, 'bob_smith', 'password3', 3),
(9, 'alice_jones', 'password4', 3),
(10, 'sam_wilson', 'password5', 3),
(11, 'tony_stark', 'ironman', 2),
(12, 'natasha_romanoff', 'blackwidow', 2),
(13, 'peter_parker', 'spiderman', 3),
(14, 'bruce_banner', 'hulk1', 3),
(15, 'clark_kent', 'superman', 3),
(16, 'diana_prince', 'wonderwoman', 3),
(17, 'barry_allen', 'flash', 3),
(18, 'hal_jordan', 'greenlantern', 3),
(19, 'logan', 'wolverine', 3),
(20, 'selina_kyle', 'catwoman', 3);

-- Вставка данных в таблицу profile
INSERT INTO profile (profile_id, phone, email, first_name, last_name, fk_user_id) VALUES
(1, '+1234567890', 'admin@example.com', 'Admin', 'User', 1),
(2, '+9876543210', 'manager@example.com', 'Manager', 'User', 2),
(3, '+1112223333', 'user1@example.com', 'User', 'One', 3),
(4, '+4445556666', 'user2@example.com', 'User', 'Two', 4),
(5, '+7778889999', 'user3@example.com', 'User', 'Three', 5),
(6, '+1111111111', 'john_doe@example.com', 'John', 'Doe', 6),
(7, '+2222222222', 'jane_doe@example.com', 'Jane', 'Doe', 7),
(8, '+3333333333', 'bob_smith@example.com', 'Bob', 'Smith', 8),
(9, '+4444444444', 'alice_jones@example.com', 'Alice', 'Jones', 9),
(10, '+5555555555', 'sam_wilson@example.com', 'Sam', 'Wilson', 10),
(11, '+6666666666', 'tony_stark@example.com', 'Tony', 'Stark', 11),
(12, '+7777777777', 'natasha_romanoff@example.com', 'Natasha', 'Romanoff', 12),
(13, '+8888888888', 'peter_parker@example.com', 'Peter', 'Parker', 13),
(14, '+9999999999', 'bruce_banner@example.com', 'Bruce', 'Banner', 14),
(15, '+1231231234', 'clark_kent@example.com', 'Clark', 'Kent', 15),
(16, '+2342342345', 'diana_prince@example.com', 'Diana', 'Prince', 16),
(17, '+3453453456', 'barry_allen@example.com', 'Barry', 'Allen', 17),
(18, '+4564564567', 'hal_jordan@example.com', 'Hal', 'Jordan', 18),
(19, '+5675675678', 'logan@example.com', 'Logan', 'X', 19),
(20, '+6786786789', 'selina_kyle@example.com', 'Selina', 'Kyle', 20);
