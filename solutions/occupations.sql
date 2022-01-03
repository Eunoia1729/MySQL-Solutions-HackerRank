/*
Enter your query here.
*/

SET @r1 = 0, @r2 = 0, @r3 = 0, @r4 = 0;

SELECT MIN(DOCTOR), MIN(PROFESSOR), MIN(SINGER), MIN(ACTOR)
-- SELECT *
FROM (
        SELECT 
            (CASE 
                WHEN OCCUPATION = 'Doctor' THEN (@r1 := @r1 + 1)
                WHEN OCCUPATION = 'Professor' THEN (@r2 := @r2 + 1)
                WHEN OCCUPATION = 'Singer' THEN @r3 := @r3 + 1
                ELSE @r4 := @r4 + 1 
            END) AS ROWNUMBER,
            IF(OCCUPATION='Doctor',NAME, NULL) AS DOCTOR,
            IF(OCCUPATION='Professor',NAME, NULL) AS PROFESSOR,
            IF(OCCUPATION='Singer',NAME, NULL) AS SINGER,
            IF(OCCUPATION='Actor',NAME, NULL) AS ACTOR
        FROM OCCUPATIONS
        ORDER BY NAME
    ) D
GROUP BY ROWNUMBER;