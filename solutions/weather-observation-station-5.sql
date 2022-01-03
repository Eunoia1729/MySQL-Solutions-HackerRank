/*
Enter your query here.
*/
/* Min */
SELECT CITY, LENGTH(CITY)
FROM STATION 
ORDER BY LENGTH(CITY), CITY
LIMIT 1;
-- SELECT CITY, LENGTH(CITY)
-- FROM STATION 
-- WHERE LENGTH(CITY) = 
--                 (
--                     SELECT MIN(LENGTH(CITY)) 
--                     FROM STATION
--                 )
-- ORDER BY CITY
-- LIMIT 1;

/* Max */
SELECT CITY, LENGTH(CITY)
FROM STATION 
WHERE LENGTH(CITY) = 
                (
                    SELECT MAX(LENGTH(CITY)) 
                    FROM STATION
                )
ORDER BY CITY
LIMIT 1;