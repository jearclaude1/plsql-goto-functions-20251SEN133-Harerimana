SET SERVEROUTPUT ON;

DECLARE
    v_num NUMBER := 7;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Evaluating number: ' || v_num);

    IF v_num > 0 THEN
        GOTO positive_block;
    ELSIF v_num < 0 THEN
        GOTO negative_block;
    ELSE
        GOTO zero_block;
    END IF;

    <<positive_block>>
    DBMS_OUTPUT.PUT_LINE('Result: The number is Positive.');
    GOTO end_program;

    <<negative_block>>
    DBMS_OUTPUT.PUT_LINE('Result: The number is Negative.');
    GOTO end_program;

    <<zero_block>>
    DBMS_OUTPUT.PUT_LINE('Result: The number is Zero.');
    <<end_program>>
    
    DBMS_OUTPUT.PUT_LINE('Execution completed.');
END;
/