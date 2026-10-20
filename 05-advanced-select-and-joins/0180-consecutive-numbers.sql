-- Problem: 180. Consecutive Numbers
-- Link: https://leetcode.com/problems/consecutive-numbers/
-- Difficulty: Medium
-- Topic: Advanced Select and Joins (Window functions)
-- Approach: Used LEAD() to get the next two values for each row (in a CTE),
--           then kept the numbers where all three values are equal.
--           DISTINCT removes duplicates.
-- Concept: CTE, LEAD(), DISTINCT

WITH cte AS (
    SELECT num,
           LEAD(num, 1) OVER (ORDER BY id) AS nextnum,
           LEAD(num, 2) OVER (ORDER BY id) AS nextnextnum
    FROM Logs
)
SELECT DISTINCT num AS ConsecutiveNums
FROM cte
WHERE num = nextnum AND num = nextnextnum;