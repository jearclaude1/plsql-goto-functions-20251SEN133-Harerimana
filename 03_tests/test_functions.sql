SET SERVEROUTPUT ON;

PROMPT ============================================
PROMPT  TESTING B1: fn_annual_salary
PROMPT ============================================

DECLARE
    v_result NUMBER;
BEGIN
    v_result := annual_salary(1000);
    DBMS_OUTPUT.PUT_LINE('Annual salary: ' || v_result);
END;
/