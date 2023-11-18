CREATE OR REPLACE FUNCTION get_data_secure(university_name VARCHAR)
RETURNS TABLE
(u_id INTEGER, name VARCHAR, year INTEGER)
AS $$
DECLARE
	str VARCHAR;
BEGIN
	str := 'SELECT * FROM university WHERE name = $1';
	RAISE NOTICE 'Query=%',str;
	RETURN QUERY EXECUTE str USING university_name;
END;
$$ LANGUAGE plpgsql;
