CREATE OR REPLACE FUNCTION log_action()
RETURNS TRIGGER AS $$
BEGIN
  INSERT INTO "action" (action_time, fk_action_type_name, fk_user_id)
  VALUES (CURRENT_TIMESTAMP, TG_OP, CURRENT_USER);
  RETURN NULL;
END;
$$ LANGUAGE plpgsql;

-- Триггер для таблицы "food_order"
CREATE TRIGGER log_food_order
AFTER INSERT OR UPDATE OR DELETE
ON food_order
FOR EACH ROW
EXECUTE FUNCTION log_action();

-- Триггер для таблицы "ticket"
CREATE TRIGGER log_ticket
AFTER INSERT OR UPDATE OR DELETE
ON ticket
FOR EACH ROW
EXECUTE FUNCTION log_action();

-- Триггер для таблицы "rewiew"
CREATE TRIGGER log_rewiew
AFTER INSERT OR UPDATE OR DELETE
ON rewiew
FOR EACH ROW
EXECUTE FUNCTION log_action();
