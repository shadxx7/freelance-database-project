CREATE OR REPLACE FUNCTION test_time_validator() RETURNS TRIGGER AS $BODY$

BEGIN
	IF (NEW.start_time > NEW.end_time) THEN
        raise exception 'Invalid data entered.';
    END IF;	
	RETURN NULL;
END;
$BODY$ LANGUAGE 'plpgsql';

CREATE TRIGGER test_time_validation BEFORE INSERT OR UPDATE ON test_result FOR EACH ROW EXECUTE PROCEDURE test_time_validator();

