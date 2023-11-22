-- Мониторинг действий с заказами корма
CREATE OR REPLACE FUNCTION log_action_food_order()
RETURNS TRIGGER AS $$
BEGIN
  IF TG_OP ='INSERT' THEN
    INSERT INTO "action" (action_id, action_time, fk_action_type_name, fk_user_id)
    VALUES (DEFAULT, CURRENT_TIMESTAMP, 'food_order_insert', NEW.fk_user_id);
  ELSIF TG_OP ='DELETE' THEN
    INSERT INTO "action" (action_id, action_time, fk_action_type_name, fk_user_id)
    VALUES (DEFAULT, CURRENT_TIMESTAMP, 'food_order_delete', OLD.fk_user_id);
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Триггер для таблицы "food_order"
CREATE OR REPLACE TRIGGER log_food_order
AFTER INSERT OR DELETE
ON food_order
FOR EACH ROW
EXECUTE FUNCTION log_action_food_order();

-- Мониторинг действий с билетами
CREATE OR REPLACE FUNCTION log_action_ticket()
RETURNS TRIGGER AS $$
BEGIN
  IF TG_OP ='INSERT' THEN
    INSERT INTO "action" (action_id, action_time, fk_action_type_name, fk_user_id)
    VALUES (DEFAULT, CURRENT_TIMESTAMP, 'ticket_insert', NEW.fk_user_id);
  ELSIF TG_OP ='DELETE' THEN
    INSERT INTO "action" (action_id, action_time, fk_action_type_name, fk_user_id)
    VALUES (DEFAULT, CURRENT_TIMESTAMP, 'ticket_delete', OLD.fk_user_id);
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Триггер для таблицы "ticket"
CREATE OR REPLACE TRIGGER log_ticket
AFTER INSERT OR UPDATE OR DELETE
ON ticket
FOR EACH ROW
EXECUTE FUNCTION log_action_ticket();

-- Мониторинг действий с отзывами
CREATE OR REPLACE FUNCTION log_action_rewiew()
RETURNS TRIGGER AS $$
BEGIN
  IF TG_OP ='INSERT' THEN
    INSERT INTO "action" (action_id, action_time, fk_action_type_name, fk_user_id)
    VALUES (DEFAULT, CURRENT_TIMESTAMP, 'rewiew_insert', NEW.fk_user_id);
  ELSIF TG_OP ='UPDATE' THEN
    INSERT INTO "action" (action_id, action_time, fk_action_type_name, fk_user_id)
    VALUES (DEFAULT, CURRENT_TIMESTAMP, 'rewiew_update', NEW.fk_user_id);
  ELSIF TG_OP ='DELETE' THEN
    INSERT INTO "action" (action_id, action_time, fk_action_type_name, fk_user_id)
    VALUES (DEFAULT, CURRENT_TIMESTAMP, 'rewiew_delete', OLD.fk_user_id);
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Триггер для таблицы "rewiew"
CREATE OR REPLACE TRIGGER log_rewiew
AFTER INSERT OR UPDATE OR DELETE
ON rewiew
FOR EACH ROW
EXECUTE FUNCTION log_action_rewiew();

-- Мониторинг действий с пользователем
CREATE OR REPLACE FUNCTION log_action_user()
RETURNS TRIGGER AS $$
BEGIN
  IF TG_OP ='INSERT' THEN
    INSERT INTO "action" (action_id, action_time, fk_action_type_name, fk_user_id)
    VALUES (DEFAULT, CURRENT_TIMESTAMP, 'user_insert', NEW.user_id);
  ELSIF TG_OP ='UPDATE' THEN
    INSERT INTO "action" (action_id, action_time, fk_action_type_name, fk_user_id)
    VALUES (DEFAULT, CURRENT_TIMESTAMP, 'user_update', NEW.user_id);
  ELSIF TG_OP ='DELETE' THEN
    INSERT INTO "action" (action_id, action_time, fk_action_type_name, fk_user_id)
    VALUES (DEFAULT, CURRENT_TIMESTAMP, 'user_delete', OLD.user_id);
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Триггер для таблицы "user"
CREATE OR REPLACE TRIGGER log_user
AFTER INSERT OR UPDATE OR DELETE
ON "user"
FOR EACH ROW
EXECUTE FUNCTION log_action_user();

-- При создании пользователя создается профиль
CREATE OR REPLACE FUNCTION create_user_profile()
RETURNS TRIGGER AS $$
BEGIN
  INSERT INTO profile (fk_user_id) VALUES (NEW.user_id);
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER create_profile
AFTER INSERT ON "user"
FOR EACH ROW
EXECUTE FUNCTION create_user_profile();

--Обновление цены заказа в зависимости от обновления веса еды
CREATE OR REPLACE FUNCTION update_order_price()
RETURNS TRIGGER AS
$$
	BEGIN
		UPDATE food_order
		SET price = NEW.weight / 100 * price
		WHERE is_paid = false AND fk_food_name = NEW.name;
		
		RETURN NEW;
	END;
$$
LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER trigger_update_order_price
AFTER UPDATE OF weight
ON food
FOR EACH ROW
EXECUTE function update_order_price();