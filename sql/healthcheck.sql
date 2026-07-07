SELECT name, open_mode FROM v$database;

SELECT instance_name, status FROM v$instance;

SELECT tablespace_name, status
FROM dba_tablespaces;
