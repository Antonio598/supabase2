-- Forzamos la creación de los roles base
DO $$ 
BEGIN
  IF NOT EXISTS (SELECT FROM pg_catalog.pg_roles WHERE rolname = 'authenticator') THEN
    CREATE ROLE authenticator NOINHERIT LOGIN PASSWORD 'Synexia_Secure_Pass_2026!';
  END IF;
  -- Repite para los demás si es necesario
END $$;

-- Ahora sí cambiamos contraseñas
ALTER USER authenticator WITH PASSWORD 'Synexia_Secure_Pass_2026!';
