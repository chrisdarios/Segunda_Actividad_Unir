-- 1. Consultar las restricciones activas antes de desactivarlas
SELECT table_name, constraint_name, constraint_type, status
FROM user_constraints
WHERE table_name IN ('EMPLOYEES', 'DEPARTMENTS')
ORDER BY table_name, constraint_type, constraint_name;

-- 2. Desactivar restricciones en DEPARTMENTS
ALTER TABLE departments DISABLE CONSTRAINT dept_mgr_fk;
ALTER TABLE departments DISABLE CONSTRAINT dept_loc_fk;
ALTER TABLE departments DISABLE CONSTRAINT dept_name_nn;
ALTER TABLE departments DISABLE CONSTRAINT dept_id_pk CASCADE;

-- 3. Desactivar restricciones en EMPLOYEES
ALTER TABLE employees DISABLE CONSTRAINT emp_dept_fk;
ALTER TABLE employees DISABLE CONSTRAINT emp_job_fk;
ALTER TABLE employees DISABLE CONSTRAINT emp_manager_fk;
ALTER TABLE employees DISABLE CONSTRAINT emp_email_uk;
ALTER TABLE employees DISABLE CONSTRAINT emp_salary_min;
ALTER TABLE employees DISABLE CONSTRAINT emp_last_name_nn;
ALTER TABLE employees DISABLE CONSTRAINT emp_email_nn;
ALTER TABLE employees DISABLE CONSTRAINT emp_hire_date_nn;
ALTER TABLE employees DISABLE CONSTRAINT emp_job_nn;
ALTER TABLE employees DISABLE CONSTRAINT emp_emp_id_pk CASCADE;

-- 4. Verificar que quedaron desactivadas
SELECT table_name, constraint_name, constraint_type, status
FROM user_constraints
WHERE table_name IN ('EMPLOYEES', 'DEPARTMENTS', 'JOB_HISTORY')
ORDER BY table_name, status, constraint_name;
