CREATE OR REPLACE FUNCTION freelance.avgskill(freelanceid integer)
    RETURNS numeric
    LANGUAGE 'plpgsql'
    VOLATILE
    PARALLEL UNSAFE
    COST 100
AS $BODY$DECLARE
	avgskill numeric(5,2) := 0;
	noskill integer := 0;
	r has_skill%rowtype;
BEGIN
	for r in SELECT * from has_skill where freelancer_id = freelanceid
	LOOP
		avgskill := avgskill + r.skill_level;
		noskill := noskill + 1;
	END LOOP;
	if noskill > 0 then
		avgskill := avgskill / noskill;
	else 
		avgskill := 0;
	END IF;
	Return avgskill;
END	

$BODY$;