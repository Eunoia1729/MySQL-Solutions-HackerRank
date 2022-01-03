SELECT S.NAME
FROM FRIENDS
JOIN PACKAGES F1 ON F1.ID = FRIENDS.ID
JOIN PACKAGES F2 ON F2.ID = FRIENDS.FRIEND_ID
JOIN STUDENTS S ON S.ID = FRIENDS.ID
WHERE F1.SALARY < F2.SALARY
ORDER BY F2.SALARY;