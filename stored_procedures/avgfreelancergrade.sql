CREATE OR REPLACE FUNCTION freelance.avgfreelancergr(
	freelancerid integer)
    RETURNS numeric
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
AS $BODY$
DECLARE
	avgrade numeric(5,2) := 0;
	num integer := 0;
	o proposal%rowtype;
BEGIN
	for o in SELECT * from proposal where freelancer_id = freelancerid
	LOOP
		avgrade := avgrade + o.freelancer_grade;
		num := num + 1;
	END LOOP;
	if num > 0 then
		avgrade := avgrade / num;
	else 
		avgrade := 0;
	END IF;
	Return avgrade;
END	

$BODY$;