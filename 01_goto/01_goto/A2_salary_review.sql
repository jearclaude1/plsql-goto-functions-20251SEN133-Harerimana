SET SERVEROUTPUT ON;

DECLARE
    v_salary NUMBER := 82000;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Reviewing salary: $' || v_salary);

    IF v_salary < 50000 THEN
        GOTO low_tier;

    ELSIF v_salary BETWEEN 50000 AND 100000 THEN
        GOTO mid_tier;

    ELSE
        GOTO high_tier;

    END IF;

    <<low_tier>>
    DBMS_OUTPUT.PUT_LINE('Action: Eligible for 10% market adjustment raise.');
    GOTO exit_review;

    <<mid_tier>>
    DBMS_OUTPUT.PUT_LINE('Action: Eligible for standard 5% merit increase.');
    GOTO exit_review;

    <<high_tier>>
    DBMS_OUTPUT.PUT_LINE('Action: Salary is at executive band. No mandatory raise.');
    GOTO exit_review;

    <<exit_review>>
    DBMS_OUTPUT.PUT_LINE('Salary review process finished.');
END;
/