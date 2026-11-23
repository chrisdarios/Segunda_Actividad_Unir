-- 1. Iniciar una transacción insertando un primer registro en DEPARTMENTS2
INSERT INTO departments2 (department_id, department_name, manager_id, location_id)
VALUES (310, 'Operaciones TI', 100, 1700);

-- 2. Definir un punto de guardado intermedio dentro de la transacción
SAVEPOINT sp_despues_310;

-- 3. Insertar un segundo registro dentro de la misma transacción
INSERT INTO departments2 (department_id, department_name, manager_id, location_id)
VALUES (320, 'Departamento Erroneo', 101, 1700);

-- Comprobar que ambos registros son visibles en la sesión actual
SELECT * FROM departments2
WHERE department_id IN (310, 320);

-- 4. Reversión parcial: deshacer únicamente los cambios posteriores al SAVEPOINT
ROLLBACK TO SAVEPOINT sp_despues_310;

-- Verificar que se revirtió el registro 320 pero se conserva el 310
SELECT * FROM departments2
WHERE department_id IN (310, 320);

-- 5. Reversión total: deshacer por completo la transacción abierta
ROLLBACK;

-- Verificar que ninguno de los dos registros persistió en la tabla
SELECT * FROM departments2
WHERE department_id IN (310, 320);
