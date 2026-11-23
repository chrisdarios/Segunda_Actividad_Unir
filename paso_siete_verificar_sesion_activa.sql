-- Verificar la nueva sesión activa
SHOW USER;

-- Consultar el total de filas y buscar las tres tuplas insertadas previamente
SELECT COUNT(*) AS total_filas FROM departments2;

SELECT * FROM departments2
WHERE department_id IN (280, 290, 300);
