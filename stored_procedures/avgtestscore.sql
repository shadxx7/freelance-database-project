CREATE OR REPLACE FUNCTION freelance.score(
	testid integer)
    RETURNS numeric
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
AS $BODY$
DECLARE
	avgscore numeric(5,2) := 0;
	notest integer := 0;
	r test_result%rowtype;
BEGIN
	for r in SELECT * from test_result where test_id = testid
	LOOP
		avgscore := avgscore + r.score;
		notest := notest + 1;
	END LOOP;
	if notest > 0 then
		avgscore := avgscore / notest;
	else 
		avgscore := 0;
	END IF;
	Return avgscore;
END	

$BODY$;