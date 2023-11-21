-- Вставка данных в таблицу "role"
INSERT INTO "role" ( name) VALUES
('superuser'),
('staff'),
('common');

-- Вставка данных в таблицу "user"
INSERT INTO "user" ( username, password, fk_role_id) VALUES
('admin', 'admin123', 1),
('manager', 'manager123', 2),
('user1', 'user123', 3),
('user2', 'user456', 3),
('user3', 'user789', 3),
('john_doe', 'password1', 3),
('jane_doe', 'password2', 3),
('bob_smith', 'password3', 3),
('alice_jones', 'password4', 3),
('sam_wilson', 'password5', 3),
('tony_stark', 'ironman', 2),
('natasha_romanoff', 'blackwidow', 2),
('peter_parker', 'spiderman', 3),
('bruce_banner', 'hulk1', 3),
('clark_kent', 'superman', 3),
('diana_prince', 'wonderwoman', 3),
('barry_allen', 'flash', 3),
('hal_jordan', 'greenlantern', 3),
('logan', 'wolverine', 3),
('selina_kyle', 'catwoman', 3);

-- Вставка данных в таблицу profile
INSERT INTO profile ( phone, email, first_name, last_name, fk_user_id) VALUES
('+1234567890', 'admin@example.com', 'Admin', 'User', 1),
('+9876543210', 'manager@example.com', 'Manager', 'User', 2),
('+1112223333', 'user1@example.com', 'User', 'One', 3),
('+4445556666', 'user2@example.com', 'User', 'Two', 4),
('+7778889999', 'user3@example.com', 'User', 'Three', 5),
('+1111111111', 'john_doe@example.com', 'John', 'Doe', 6),
('+2222222222', 'jane_doe@example.com', 'Jane', 'Doe', 7),
('+3333333333', 'bob_smith@example.com', 'Bob', 'Smith', 8),
('+4444444444', 'alice_jones@example.com', 'Alice', 'Jones', 9),
('+5555555555', 'sam_wilson@example.com', 'Sam', 'Wilson', 10),
('+6666666666', 'tony_stark@example.com', 'Tony', 'Stark', 11),
('+7777777777', 'natasha_romanoff@example.com', 'Natasha', 'Romanoff', 12),
('+8888888888', 'peter_parker@example.com', 'Peter', 'Parker', 13),
('+9999999999', 'bruce_banner@example.com', 'Bruce', 'Banner', 14),
('+1231231234', 'clark_kent@example.com', 'Clark', 'Kent', 15),
('+2342342345', 'diana_prince@example.com', 'Diana', 'Prince', 16),
('+3453453456', 'barry_allen@example.com', 'Barry', 'Allen', 17),
('+4564564567', 'hal_jordan@example.com', 'Hal', 'Jordan', 18),
('+5675675678', 'logan@example.com', 'Logan', 'X', 19),
('+6786786789', 'selina_kyle@example.com', 'Selina', 'Kyle', 20);
