/*
Enter your query here.
*/

SELECT MIN(ID), AGE, MIN_COINS, W.POWER
FROM 
(
    SELECT POWER, CODE, MIN(COINS_NEEDED) AS MIN_COINS
    FROM WANDS
    GROUP BY POWER, CODE
) W
JOIN WANDS ON (WANDS.CODE = W.CODE AND WANDS.COINS_NEEDED = W.MIN_COINS AND WANDS.POWER = W.POWER)
JOIN WANDS_PROPERTY ON W.CODE = WANDS_PROPERTY.CODE
WHERE IS_EVIL = 0
GROUP BY AGE, MIN_COINS, W.POWER
ORDER BY W.POWER DESC, AGE DESC;