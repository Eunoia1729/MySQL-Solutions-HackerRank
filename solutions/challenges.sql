/*
Enter your query here.
*/
SELECT COUNT(DISTINCT CHALLENGE_ID) AS NUM_CHALLENGES
FROM CHALLENGES
GROUP BY HACKER_ID
ORDER BY NUM_CHALLENGES DESC
LIMIT 1
INTO @maxx;

-- CREATE TEMPORARY TABLE C_COUNT
-- SELECT HACKER_ID, COUNT(DISTINCT CHALLENGE_ID) AS NUM_CHALLENGES
-- FROM CHALLENGES
-- GROUP BY HACKER_ID;

-- SELECT * 
-- FROM C_COUNT;
SELECT HACKERS.HACKER_ID, NAME, NUM_CHALLENGES
FROM (
SELECT HACKER_ID, COUNT(DISTINCT CHALLENGE_ID) AS NUM_CHALLENGES
FROM CHALLENGES
GROUP BY HACKER_ID ) C_COUNT
JOIN HACKERS ON C_COUNT.HACKER_ID = HACKERS.HACKER_ID
JOIN (
    SELECT NUM_CHALLENGES AS COUNT_ID, COUNT(HACKER_ID) AS HACKERS_COUNT
    FROM 
    (SELECT HACKER_ID, COUNT(DISTINCT CHALLENGE_ID) AS NUM_CHALLENGES
    FROM CHALLENGES
    GROUP BY HACKER_ID
    ) X
    GROUP BY NUM_CHALLENGES 
) H_COUNT ON H_COUNT.COUNT_ID = C_COUNT.NUM_CHALLENGES
WHERE ( 
        HACKERS_COUNT = 1
        OR
        @maxx = NUM_CHALLENGES
    )
ORDER BY NUM_CHALLENGES DESC, HACKER_ID ASC;