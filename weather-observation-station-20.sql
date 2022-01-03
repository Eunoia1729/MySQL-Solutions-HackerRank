/*
Enter your query here.
*/
SET  @i = -1;
SELECT ROUND( AVG(DISTANCE), 4)
FROM (
        SELECT @i := @i + 1 AS IND,
                LAT_N AS DISTANCE
        FROM STATION
        ORDER BY DISTANCE
    ) AS D
WHERE IND IN (CEIL(@i/2), FLOOR(@i/2));