CREATE OR REPLACE FUNCTION get_data(
  v_user_name VARCHAR,
	v_token VARCHAR
)
RETURNS TABLE
(u_id INTEGER, name VARCHAR, year INTEGER)
AS $$
BEGIN
	CALL sso_control(v_user_name,v_token);
	RETURN QUERY EXECUTE 'SELECT * FROM university;';
END;
$$ LANGUAGE plpgsql;
