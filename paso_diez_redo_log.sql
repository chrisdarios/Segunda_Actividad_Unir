-- 1. Consultar el modo de funcionamiento de la base de datos respecto a los Redo Log
SELECT name, log_mode, open_mode
FROM v$database;

-- 2. Consultar los grupos de archivos Redo Log, su tamaño, estado y número de secuencia
SELECT group#, sequence#, bytes / 1024 / 1024 AS tamano_mb, members, archived, status
FROM v$log
ORDER BY group#;

-- 3. Consultar la ubicación física de los ficheros Redo Log en disco
SELECT group#, type, member
FROM v$logfile
ORDER BY group#;

-- 4. Forzar un cambio de grupo (Log Switch) para observar el funcionamiento circular
ALTER SYSTEM SWITCH LOGFILE;

-- 5. Verificar el desplazamiento del estado CURRENT al siguiente grupo y el aumento de SEQUENCE#
SELECT group#, sequence#, archived, status
FROM v$log
ORDER BY group#;
