WITH 
    RECURSIVE numbers(n) AS (
        SELECT 2
        UNION ALL
        SELECT n + 1 FROM numbers
        WHERE n < 1000
    )
    SELECT GROUP_CONCAT(n SEPARATOR '&') 
    FROM (    
        SELECT nums.n
        FROM numbers nums
        JOIN numbers factors ON nums.n % factors.n = 0
        GROUP BY nums.n
        HAVING COUNT(factors.n) = 1
        ORDER BY nums.n
    ) primes