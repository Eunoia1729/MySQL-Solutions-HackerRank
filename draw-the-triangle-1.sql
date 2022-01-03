/*
Enter your query here.
*/

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
    FROM print
    ORDER BY n DESC;