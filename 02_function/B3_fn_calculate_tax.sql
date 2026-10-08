CREATE OR REPLACE FUNCTION calculate_tax ( annual_salary IN NUMBER ) RETURN NUMBER 
IS

BEGIN
    IF annual_salary <= 40000 THEN
        RETURN annual_salary * 0.10;
    ELSIF annual_salary <= 90000 THEN
        RETURN annual_salary * 0.20;
    ELSE
        RETURN annual_salary * 0.30;
    END IF;
END calculate_tax;
/

-- test 
SET SERVEROUTPUT ON;

DECLARE
    annual_salary NUMBER;
BEGIN
    annual_salary := calculate_tax(20000);
    DBMS_OUTPUT.PUT_LINE('Result: ' || annual_salary);

END;
/   