CREATE OR REPLACE FUNCTION user_register_secure(
    v_user_name varchar, 
    v_password varchar
)
RETURNS INTEGER
AS $$
BEGIN
	IF NOT EXISTS (SELECT FROM user_pass_combo_jay WHERE passname = v_password) THEN
    IF password_is_correct(v_password) THEN
      INSERT INTO users (user_name,password_hash) VALUES (v_user_name, md5(v_password)); 
      RETURN 1;
    ELSE
			RAISE NOTICE 'Passname = % incorrect!', v_password;
			RETURN -1;
    END IF;
  ELSE
    RAISE NOTICE 'Passname = % is bad passname!', v_password;
    RETURN -1;                                             
  END IF; 
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION password_is_correct(password VARCHAR)
RETURNS BOOLEAN AS $$
BEGIN

    IF LENGTH(password) < 11 THEN
        RETURN FALSE;
    END IF;


    IF NOT bool_or(ch >= '0' AND ch <= '9' FOR ch IN password) THEN
        RETURN FALSE;
    END IF;


    IF LENGTH(REGEXP_REPLACE(password, '[^a-z]', '', 'g')) < 2 THEN
        RETURN FALSE;
    END IF;


    IF LENGTH(REGEXP_REPLACE(password, '[^A-Z]', '', 'g')) < 4 THEN
        RETURN FALSE;
    END IF;


    IF LENGTH(REGEXP_REPLACE(password, '[^!@#$%^&*]', '', 'g')) < 2 THEN
        RETURN FALSE;
    END IF;

    RETURN TRUE;
END;
$$ LANGUAGE plpgsql;
