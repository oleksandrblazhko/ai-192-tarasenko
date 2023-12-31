CREATE OR REPLACE FUNCTION get_data(university_name VARCHAR)
RETURNS TABLE
(u_id INTEGER, name VARCHAR, year INTEGER)
AS $$
DECLARE
	str VARCHAR;
BEGIN
	str := 'SELECT * FROM university WHERE name = ''' || university_name || '''';
	RAISE NOTICE 'Query=%',str;
	RETURN QUERY EXECUTE str;
END;
$$ LANGUAGE plpgsql;
