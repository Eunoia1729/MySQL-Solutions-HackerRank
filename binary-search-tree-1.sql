/*
Enter your query here.
*/

-- SELECT N, 
--     IF(P IS NULL,'Root', 
--        IF( (N IN (SELECT P FROM BST)),'Inner', 'Leaf')
--     )    
-- FROM BST
-- ORDER BY N;

SELECT N, 
    IF(P IS NULL,'Root', 
       IF( (N NOT IN (SELECT DISTINCT(P) FROM BST WHERE P IS NOT NULL)), 'Leaf', 'Inner')
    )    
FROM BST
ORDER BY N;

-- SELECT DISTINCT(P)
-- FROM BST 
-- ORDER BY P;
-- SELECT N, 'HEHE' 
-- FROM BST 
-- WHERE N IN (SELECT P FROM BST);