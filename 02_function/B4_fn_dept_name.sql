CREATE OR REPLACE FUNCTION fn_dept_name(
    p_dept_id IN NUMBER
) RETURN VARCHAR2
IS
    v_dept_name departments.department_name%TYPE;
BEGIN
    IF p_dept_id IS NULL THEN
        RAISE_APPLICATION_ERROR(-20005, 'Department ID cannot be NULL.');
    END IF;

    SELECT department_name
    INTO v_dept_name
    FROM departments
    WHERE department_id = p_dept_id;

    RETURN v_dept_name;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20006, 'Department ' || p_dept_id || ' not found.');
    WHEN TOO_MANY_ROWS THEN
        RAISE_APPLICATION_ERROR(-20007, 'Multiple departments found for ID ' || p_dept_id || '.');
END fn_dept_name;
/   


-- test

SET SERVEROUTPUT ON;

DECLARE
    v_name VARCHAR2(100);
BEGIN
    v_name := fn_dept_name(10);
    DBMS_OUTPUT.PUT_LINE('Department: ' || v_name);

    v_name := fn_dept_name(20);
    DBMS_OUTPUT.PUT_LINE('Department: ' || v_name);

    -- Test error handling
    BEGIN
        v_name := fn_dept_name(999);
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
    END;
END;
/   