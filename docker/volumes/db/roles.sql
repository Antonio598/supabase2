-- 1. Creamos los roles base de Supabase si no existen
DO $$ 
BEGIN
  IF NOT EXISTS (SELECT FROM pg_catalog.pg_roles WHERE rolname = 'authenticator') THEN
    CREATE ROLE authenticator NOINHERIT LOGIN PASSWORD 'Synexia_Secure_Pass_2026!';
  END IF;

  IF NOT EXISTS (SELECT FROM pg_catalog.pg_roles WHERE rolname = 'anon') THEN
    CREATE ROLE anon NOLOGIN;
  END IF;

  IF NOT EXISTS (SELECT FROM pg_catalog.pg_roles WHERE rolname = 'authenticated') THEN
    CREATE ROLE authenticated NOLOGIN;
  END IF;

  IF NOT EXISTS (SELECT FROM pg_catalog.pg_roles WHERE rolname = 'service_role') THEN
    CREATE ROLE service_role NOLOGIN;
  END IF;

  IF NOT EXISTS (SELECT FROM pg_catalog.pg_roles WHERE rolname = 'supabase_auth_admin') THEN
    CREATE ROLE supabase_auth_admin NOLOGIN;
  END IF;

  IF NOT EXISTS (SELECT FROM pg_catalog.pg_roles WHERE rolname = 'supabase_storage_admin') THEN
    CREATE ROLE supabase_storage_admin NOLOGIN;
  END IF;

  IF NOT EXISTS (SELECT FROM pg_catalog.pg_roles WHERE rolname = 'supabase_functions_admin') THEN
    CREATE ROLE supabase_functions_admin NOLOGIN;
  END IF;

  IF NOT EXISTS (SELECT FROM pg_catalog.pg_roles WHERE rolname = 'pgbouncer') THEN
    CREATE ROLE pgbouncer NOLOGIN;
  END IF;
END $$;

-- 2. Ahora que sabemos que existen, actualizamos sus contraseñas
-- Usamos la misma que tienes en tus variables de entorno de Easypanel
ALTER USER authenticator WITH PASSWORD 'Synexia_Secure_Pass_2026!';
ALTER USER supabase_auth_admin WITH PASSWORD 'Synexia_Secure_Pass_2026!';
ALTER USER supabase_functions_admin WITH PASSWORD 'Synexia_Secure_Pass_2026!';
ALTER USER supabase_storage_admin WITH PASSWORD 'Synexia_Secure_Pass_2026!';
ALTER USER pgbouncer WITH PASSWORD 'Synexia_Secure_Pass_2026!';

-- 3. Asignamos los permisos de membresía básicos
GRANT anon TO authenticator;
GRANT authenticated TO authenticator;
GRANT service_role TO authenticator;
