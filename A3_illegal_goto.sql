SET SERVEROUTPUT ON;
--
--/*
--  NOTE: The following code will fail to compile with ORA-02431: illegal GOTO statement
--  because it attempts to jump into an inner BEGIN...END block scope.
--*/
--
--DECLARE
--    v_flag BOOLEAN := TRUE;
--BEGIN
--    IF v_flag THEN
--        GOTO inner_block_label; -- ILLEGAL JUMP
--    END IF;
--
--    BEGIN
--        <<inner_block_label>>
--        DBMS_OUTPUT.PUT_LINE('This will cause a compilation failure.');
--    END;
--END;


DECLARE
    v_x NUMBER := 10;
BEGIN
    IF v_x > 5 THEN
        DECLARE
            v_y NUMBER := 20;
        BEGIN
            DBMS_OUTPUT.PUT_LINE('v_x > 5, so v_y = ' || v_y);
        END;
    END IF;

    DBMS_OUTPUT.PUT_LINE('Done.');
END;
/   



