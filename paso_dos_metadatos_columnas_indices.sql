-- 1. Metadatos de los índices de ambas tablas
SELECT table_name, index_name, index_type, uniqueness, status
FROM user_indexes
WHERE table_name IN ('EMPLOYEES', 'DEPARTMENTS')
ORDER BY table_name, index_name;

-- 2. Columnas que componen cada índice y su posición
SELECT table_name, index_name, column_name, column_position
FROM user_ind_columns
WHERE table_name IN ('EMPLOYEES', 'DEPARTMENTS')
ORDER BY table_name, index_name, column_position;
