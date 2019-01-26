CREATE OR REPLACE FUNCTION update_display_result() RETURNS TRIGGER AS $BODY$
DECLARE 
    r test_result%rowtype;
BEGIN
    FOR r IN SELECT * FROM test_result  
    LOOP
		IF (NEW.test_id = r.test_id) THEN
			IF (NEW.freelancer_id = r.freelancer_id) THEN
            	IF (NEW.score > r.score) THEN
                	UPDATE test_result SET display_on_profile=true WHERE (testest_result.test_id = NEW.test_id AND test_result.freelancer_id = NEW.freelancer_id);        
				END IF;
			END IF;	
		END IF;	
    END LOOP;
	RETURN NULL;
END;
$BODY$ LANGUAGE 'plpgsql';

CREATE TRIGGER updateDisplay AFTER INSERT OR UPDATE ON test_result FOR EACH ROW EXECUTE PROCEDURE update_display_result();

