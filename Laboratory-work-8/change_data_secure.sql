CREATE OR REPLACE FUNCTION change_data_secure(attr_1 varchar, attr_2 varchar)
RETURNS VARCHAR AS $$
DECLARE 
	str VARCHAR;
BEGIN
	str:= 'UPDATE university SET name = $2 WHERE name = $1';
	RAISE NOTICE 'Query=%', str;
	EXECUTE str USING attr_1, attr_2;
	RETURN 'Name updated';
END;
$$ LANGUAGE plpgsql;
