SHOW USER;

SELECT USER AS usuario_conectado, SYS_CONTEXT('USERENV', 'CON_NAME') AS pdb_activa
FROM dual;
