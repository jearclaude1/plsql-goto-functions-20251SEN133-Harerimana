SET SERVEROUTPUT ON;

DECLARE
    v_num NUMBER := 15;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Evaluating number: ' || v_num);

    IF v_num > 0 THEN
        DBMS_OUTPUT.PUT_LINE('Result: Positive');
    ELSIF v_num < 0 THEN
        DBMS_OUTPUT.PUT_LINE('Result: Negative');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Result: Zero');
    END IF;

    DBMS_OUTPUT.PUT_LINE('xecution completed successfully without GOTO.');
END;
/