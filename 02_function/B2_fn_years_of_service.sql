CREATE OR REPLACE FUNCTION years_of_service( hire_date IN DATE ) RETURN NUMBER
IS
    years NUMBER;
BEGIN
    IF hire_date IS NULL THEN
        RAISE_APPLICATION_ERROR(-20002, 'Hire date cannot be NULL.');
    END IF;

    IF hire_date > SYSDATE THEN
        RAISE_APPLICATION_ERROR(-20003, 'Hire date cannot be in the future.');
    END IF;

    years := FLOOR(MONTHS_BETWEEN(SYSDATE, hire_date) / 12);
    RETURN years;
    
END years_of_service;
/   


-- test 
SET SERVEROUTPUT ON;

DECLARE
    years NUMBER;
BEGIN
    years := years_of_service(TO_DATE('2019-03-15', 'YYYY-MM-DD'));
    DBMS_OUTPUT.PUT_LINE('Years of service: ' || years);

    years := years_of_service(TO_DATE('2025-11-01', 'YYYY-MM-DD'));
    DBMS_OUTPUT.PUT_LINE('Years of service: ' || years);
END;
/   