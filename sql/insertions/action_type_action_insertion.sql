-- Вставка данных в таблицу action_type
INSERT INTO action_type (name) VALUES
('ticket_insert'),
('ticket_delete'),
('food_order_insert'),
('food_order_delete'),
('rewiew_insert'),
('rewiew_update'),
('rewiew_delete'),
('user_update'),
('user_delete'),
('user_insert');

-- Вставка данных в таблицу action
INSERT INTO "action" ( action_time, fk_action_type_name, fk_user_id) VALUES
('2023-10-18 12:30:00', 'ticket', 3),
('2023-10-18 13:45:00', 'food_order', 7),
('2023-10-18 14:20:00', 'rewiew', 10),
('2023-10-18 15:10:00', 'update', 15),
('2023-10-18 16:00:00', 'delete', 20),
('2023-10-18 17:30:00', 'ticket', 2),
('2023-10-18 18:15:00', 'food_order', 12),
('2023-10-18 19:00:00', 'rewiew', 5),
('2023-10-18 20:45:00', 'update', 18),
('2023-10-18 21:30:00', 'delete', 8),
('2023-10-18 22:15:00', 'ticket', 4),
('2023-10-18 23:00:00', 'food_order', 14),
('2023-10-19 09:30:00', 'rewiew', 1),
('2023-10-19 10:15:00', 'update', 6),
('2023-10-19 11:00:00', 'delete', 11),
('2023-10-19 12:45:00', 'ticket', 16),
('2023-10-19 13:30:00', 'food_order', 19),
('2023-10-19 14:15:00', 'rewiew', 9),
('2023-10-19 15:00:00', 'update', 13),
('2023-10-19 15:45:00', 'delete', 17);
