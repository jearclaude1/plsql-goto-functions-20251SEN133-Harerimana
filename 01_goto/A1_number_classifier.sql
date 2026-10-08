SET SERVEROUTPUT ON;

DECLARE
    v_number NUMBER ;
BEGIN
    v_number := 42;
    
    IF v_number > 0 THEN
        GOTO positive;
    ELSIF v_number < 0 THEN
        GOTO negative;
    ELSE
        GOTO zero;
    END IF;

<<positive>>
    DBMS_OUTPUT.PUT_LINE(v_number || ' is POSITIVE');
    GOTO done;

<<negative>>
    DBMS_OUTPUT.PUT_LINE(v_number || ' is NEGATIVE');
    GOTO done;

<<zero>>
    DBMS_OUTPUT.PUT_LINE(v_number || ' is ZERO');

<<done>>
    DBMS_OUTPUT.PUT_LINE('Classification complete.');
END;
/