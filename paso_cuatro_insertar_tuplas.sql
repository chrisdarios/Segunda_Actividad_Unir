-- 1. Eliminar los dos índices únicos que quedaron activos
DROP INDEX dept_id_pk;
DROP INDEX emp_emp_id_pk;

-- 2. Insertar las tuplas que incumplen las restricciones
INSERT INTO departments (department_id, department_name, manager_id, location_id)
VALUES (10, 'Departamento Invalido', 9999, 9999);

INSERT INTO employees (
    employee_id, first_name, last_name, email,
    hire_date, job_id, salary, manager_id, department_id
)
VALUES (
    100, 'Prueba', 'Invalido', 'SKING',
    SYSDATE, 'JOB_FAKE', -500, 9999, 9999
);

COMMIT;

-- 3. Comprobar la coexistencia de las tuplas inválidas con las originales
SELECT department_id, department_name, manager_id, location_id
FROM departments
WHERE department_id = 10;

SELECT employee_id, first_name, last_name, email, job_id, salary, manager_id, department_id
FROM employees
WHERE employee_id = 100;
