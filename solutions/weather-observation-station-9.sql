/*
Enter your query here.
*/

SELECT distinct(CITY)
FROM STATION
WHERE CITY REGEXP '^[^aeiou]'