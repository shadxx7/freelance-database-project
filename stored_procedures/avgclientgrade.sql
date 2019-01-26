CREATE OR REPLACE FUNCTION freelance.avgclientgr(
	freelancerid integer DEFAULT 1)
    RETURNS numeric
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
AS $BODY$

DECLARE
	avggrade numeric(5,2) := 0;
	notest integer := 0;
	i proposal%rowtype;
BEGIN
	for i in SELECT * from proposal where freelancerid = freelancer_id
	LOOP
		avggrade := avggrade + i.Client_Grade;
		notest := notest + 1;
	END LOOP;
	if notest > 0 then
		avggrade := avggrade / notest;
	else 
		avggrade := 0;
	END IF;
	Return avggrade;
END	

$BODY$;
