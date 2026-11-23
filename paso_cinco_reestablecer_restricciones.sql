-- Intentar reactivar las claves primarias con las tuplas inválidas presentes.
-- Falla con ORA-02437
ALTER TABLE departments ENABLE CONSTRAINT dept_id_pk;
ALTER TABLE employees ENABLE CONSTRAINT emp_emp_id_pk;

-- Eliminar únicamente las dos tuplas inválidas de prueba
DELETE FROM employees WHERE employee_id = 100 AND salary = -500;
DELETE FROM departments WHERE department_id = 10 AND location_id = 9999;
COMMIT;

-- Reactivar claves primarias, unicidad, CHECK y NOT NULL
ALTER TABLE departments ENABLE CONSTRAINT dept_id_pk;
ALTER TABLE departments ENABLE CONSTRAINT dept_name_nn;

ALTER TABLE employees ENABLE CONSTRAINT emp_emp_id_pk;
ALTER TABLE employees ENABLE CONSTRAINT emp_email_uk;
ALTER TABLE employees ENABLE CONSTRAINT emp_salary_min;
ALTER TABLE employees ENABLE CONSTRAINT emp_last_name_nn;
ALTER TABLE employees ENABLE CONSTRAINT emp_email_nn;
ALTER TABLE employees ENABLE CONSTRAINT emp_hire_date_nn;
ALTER TABLE employees ENABLE CONSTRAINT emp_job_nn;

-- Reactivar todas las claves foráneas
ALTER TABLE departments ENABLE CONSTRAINT dept_loc_fk;
ALTER TABLE departments ENABLE CONSTRAINT dept_mgr_fk;

ALTER TABLE employees ENABLE CONSTRAINT emp_dept_fk;
ALTER TABLE employees ENABLE CONSTRAINT emp_job_fk;
ALTER TABLE employees ENABLE CONSTRAINT emp_manager_fk;

ALTER TABLE job_history ENABLE CONSTRAINT jhist_dept_fk;
ALTER TABLE job_history ENABLE CONSTRAINT jhist_emp_fk;

-- Verificar que todas las restricciones quedaron ENABLED
SELECT table_name, constraint_name, constraint_type, status
FROM user_constraints
WHERE table_name IN ('EMPLOYEES', 'DEPARTMENTS', 'JOB_HISTORY')
ORDER BY table_name, status, constraint_name;

-- Verificar que Oracle recreó automáticamente los índices únicos
SELECT table_name, index_name, uniqueness, status
FROM user_indexes
WHERE table_name IN ('EMPLOYEES', 'DEPARTMENTS')
  AND uniqueness = 'UNIQUE'
ORDER BY table_name, index_name;
