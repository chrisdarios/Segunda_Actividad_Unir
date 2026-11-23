-- 1. Crear un duplicado de la tabla DEPARTMENTS llamado DEPARTMENTS2
CREATE TABLE departments2 AS
SELECT * FROM departments;

-- Verificar las filas copiadas y las restricciones heredadas
SELECT COUNT(*) AS total_filas FROM departments2;

SELECT constraint_name, constraint_type, status
FROM user_constraints
WHERE table_name = 'DEPARTMENTS2';

-- 2. Insertar tres tuplas en DEPARTMENTS2
INSERT INTO departments2 (department_id, department_name, manager_id, location_id)
VALUES (280, 'Arquitectura Cloud', 100, 1700);

INSERT INTO departments2 (department_id, department_name, manager_id, location_id)
VALUES (290, 'Ciberseguridad', 101, 1700);

INSERT INTO departments2 (department_id, department_name, manager_id, location_id)
VALUES (300, 'Inteligencia Artificial', 102, 1700);

-- Comprobar que las filas son visibles dentro de la sesión actual
SELECT * FROM departments2
WHERE department_id IN (280, 290, 300);
