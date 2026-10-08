# Reflection

## What I learned

The GOTO part (A1–A4) was the most eye-opening. I always thought GOTO was just "bad code to avoid," but actually it has strict rules — you can't jump into or out of a nested block. When I tried the illegal GOTO in A3, it failed at compile time, not runtime, which surprised me.

Rewriting A2 without GOTO (A4) made me realize how much cleaner IF/ELSIF is. The GOTO version had repeated print statements in every label. The rewrite just assigned a value to a variable and printed once.

For the functions (B1–B4), the main thing I learned is that a function must return a value and can be called inside a SELECT. That's the whole point vs a procedure. I also learned that SELECT INTO in PL/SQL is different from a normal SELECT — it expects exactly one row, so you need to handle NO_DATA_FOUND.

C1 was the hardest because it had to call the other three functions, and if they weren't created first, it wouldn't compile. I kept getting PLS-00201 errors until I created B1–B3 first.

## What was hard

- Forgetting to create the functions in the right order
- Using the wrong column name (employee_id vs emp_id)
- Mixing up function names between the test files and the actual definitions

## What I'd do differently

Test each function right after creating it instead of writing everything and testing at the end. Would have saved me a lot of debugging.

## Key points for the quiz

- GOTO: same block only, never across a block boundary
- Function returns a value, procedure doesn't
- SELECT INTO needs EXCEPTION handling for NO_DATA_FOUND
- %TYPE is safer than hardcoding the data type
- RAISE_APPLICATION_ERROR gives custom error messages
- Avoid GOTO, use IF/ELSIF or CASE instead   
