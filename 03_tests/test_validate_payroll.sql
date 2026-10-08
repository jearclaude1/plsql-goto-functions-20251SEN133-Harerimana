SET SERVEROUTPUT ON;

PROMPT ============================================
PROMPT  TESTING C1: fn_validate_payroll
PROMPT ============================================

DECLARE
    v_result VARCHAR2(4000);
BEGIN
    -- Test 1: Valid employee, valid salary, valid date
    v_result := validate_payroll(100, 29000, TO_DATE('2003-06-17', 'YYYY-MM-DD'));
    DBMS_OUTPUT.PUT_LINE('Test 1 (all valid):');
    DBMS_OUTPUT.PUT_LINE('  ' || v_result);

    -- Test 2: Non-existent employee
    v_result := validate_payroll(999, 50000, TO_DATE('2020-01-01', 'YYYY-MM-DD'));
    DBMS_OUTPUT.PUT_LINE('Test 2 (bad emp_id):');
    DBMS_OUTPUT.PUT_LINE('  ' || v_result);

    -- Test 3: Negative salary
    v_result := validate_payroll(100, -1000, TO_DATE('2003-06-17', 'YYYY-MM-DD'));
    DBMS_OUTPUT.PUT_LINE('Test 3 (negative salary):');
    DBMS_OUTPUT.PUT_LINE('  ' || v_result);

    -- Test 4: Future hire date
    v_result := validate_payroll(100, 50000, TO_DATE('2030-01-01', 'YYYY-MM-DD'));
    DBMS_OUTPUT.PUT_LINE('Test 4 (future date):');
    DBMS_OUTPUT.PUT_LINE('  ' || v_result);

    -- Test 5: NULL hire date
    v_result := validate_payroll(100, 50000, NULL);
    DBMS_OUTPUT.PUT_LINE('Test 5 (NULL date):');
    DBMS_OUTPUT.PUT_LINE('  ' || v_result);

    -- Test 6: NULL salary
    v_result := validate_payroll(100, NULL, TO_DATE('2003-06-17', 'YYYY-MM-DD'));
    DBMS_OUTPUT.PUT_LINE('Test 6 (NULL salary):');
    DBMS_OUTPUT.PUT_LINE('  ' || v_result);

    -- Test 7: Multiple errors at once
    v_result := validate_payroll(999, -500, NULL);
    DBMS_OUTPUT.PUT_LINE('Test 7 (multiple errors):');
    DBMS_OUTPUT.PUT_LINE('  ' || v_result);

    -- Test 8: Employee with no department
    v_result := validate_payroll(200, 4400, TO_DATE('1987-09-17', 'YYYY-MM-DD'));
    DBMS_OUTPUT.PUT_LINE('Test 8 (dept check):');
    DBMS_OUTPUT.PUT_LINE('  ' || v_result);

END;
/