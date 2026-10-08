CREATE OR REPLACE FUNCTION annual_salary( monthly_salary IN NUMBER ) RETURN NUMBER
IS
    annual NUMBER;
BEGIN
    IF monthly_salary IS NULL OR monthly_salary < 0 THEN
        DBMS_OUTPUT.PUT_LINE('Salary must be a positive number.');
    END IF;

    annual := monthly_salary * 12;
    
    RETURN annual;
END annual_salary;
/ 

-- test function 
SET SERVEROUTPUT ON;

DECLARE
    v_result NUMBER;
BEGIN
    v_result := annual_salary(5000);
    DBMS_OUTPUT.PUT_LINE('Annual salary: ' || v_result);
END;
/   