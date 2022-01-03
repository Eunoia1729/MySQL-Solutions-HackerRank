/*
Enter your query here.
*/
-- WITH 
--     RECURSIVE fib(n, a, b) AS
--         (
--             SELECT 1, 1, 0
--             UNION ALL
--             SELECT n + 1, a + b, a
--             FROM fib
--             WHERE n < 10
--         )
--     SELECT a
--     FROM fib;

WITH 
    RECURSIVE print(n, s) AS
    (
        SELECT 1, CAST('* ' as char(255))
        UNION ALL
        SELECT n + 1, CONCAT(s, "* ")
        FROM print
        WHERE n < 20
    )    
    SELECT s
    FROM print;