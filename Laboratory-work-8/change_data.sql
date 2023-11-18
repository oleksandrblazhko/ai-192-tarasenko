CREATE OR REPLACE FUNCTION change_data(attr_1 varchar, attr_2 varchar)
RETURNS VARCHAR AS $$
DECLARE 
	str VARCHAR;
BEGIN
	str:= 'UPDATE university SET name = ''' || attr_2 || ''' WHERE name = ''' || attr_1 ||'''';
	RAISE NOTICE 'Query=%', str;
	EXECUTE str;
	RETURN 'Name updated';
END;
$$ LANGUAGE plpgsql;
