CREATE OR REPLACE FUNCTION validate_payroll (
    p_emp_id    IN NUMBER,
    p_salary    IN NUMBER,
    p_hire_date IN DATE
) RETURN VARCHAR2 IS
    v_dummy      NUMBER;
    v_errors     VARCHAR2(4000) := '';
    v_error_count NUMBER := 0;
BEGIN
    -- 1. Check if employee exists in the database
    BEGIN
        SELECT 1 INTO v_dummy
        FROM employees
        WHERE emp_id = p_emp_id;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            v_errors := v_errors || '[ERROR: Employee ID ' || p_emp_id || ' does not exist] ';
            v_error_count := v_error_count + 1;
    END;

    -- 2. Validate Salary (must not be NULL and must be > 0)
    IF p_salary IS NULL THEN
        v_errors := v_errors || '[ERROR: Salary cannot be NULL] ';
        v_error_count := v_error_count + 1;
    ELSIF p_salary <= 0 THEN
        v_errors := v_errors || '[ERROR: Salary must be greater than zero] ';
        v_error_count := v_error_count + 1;
    END IF;

    -- 3. Validate Hire Date (must not be NULL and must not be in the future)
    IF p_hire_date IS NULL THEN
        v_errors := v_errors || '[ERROR: Hire date cannot be NULL] ';
        v_error_count := v_error_count + 1;
    ELSIF p_hire_date > SYSDATE THEN
        v_errors := v_errors || '[ERROR: Hire date cannot be in the future] ';
        v_error_count := v_error_count + 1;
    END IF;

    -- 4. Return Final Status
    IF v_error_count > 0 THEN
        RETURN 'INVALID: ' || TRIM(v_errors);
    ELSE
        RETURN 'VALID: All payroll parameters passed validation checks successfully.';
    END IF;

EXCEPTION
    WHEN OTHERS THEN
        RETURN 'ERROR: Unexpected exception occurred - ' || SQLERRM;
END validate_payroll;
/