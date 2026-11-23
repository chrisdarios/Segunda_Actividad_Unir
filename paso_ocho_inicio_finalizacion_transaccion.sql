SET SERVEROUTPUT ON;

DECLARE
    v_tx_id VARCHAR2(100);
BEGIN
    -- Comienzo explícito de la transacción
    SET TRANSACTION READ WRITE NAME 'tx_departments2';
    DBMS_OUTPUT.PUT_LINE('INICIO DE LA TRANSACCIÓN (tx_departments2)');

    -- Operaciones DML dentro de la transacción sobre DEPARTMENTS2
    INSERT INTO departments2 (department_id, department_name, manager_id, location_id)
    VALUES (280, 'Arquitectura Cloud', 100, 1700);

    UPDATE departments2
    SET department_name = 'Arquitectura Cloud y DevOps'
    WHERE department_id = 280;

    -- Consultar el identificador interno de la transacción activa
    v_tx_id := DBMS_TRANSACTION.LOCAL_TRANSACTION_ID;
    DBMS_OUTPUT.PUT_LINE('Operaciones DML ejecutadas. ID de transacción activa: ' || v_tx_id);

    -- Finalización explícita y confirmación de la transacción
    COMMIT;
    v_tx_id := DBMS_TRANSACTION.LOCAL_TRANSACTION_ID;
    DBMS_OUTPUT.PUT_LINE('FIN DE LA TRANSACCIÓN (COMMIT ejecutado)');
    DBMS_OUTPUT.PUT_LINE('Estado tras COMMIT - ID de transacción: ' || NVL(v_tx_id, 'Ninguna (transacción cerrada)'));

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Error en la transacción. Cambios revertidos (ROLLBACK): ' || SQLERRM);
END;
/

-- Verificar que el cambio persistió tras finalizar la transacción
SELECT * FROM departments2
WHERE department_id = 280;
