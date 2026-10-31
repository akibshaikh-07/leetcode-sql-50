-- Problem: 585. Investments in 2016
-- Link: https://leetcode.com/problems/investments-in-2016/
-- Difficulty: Medium
-- Topic: Subquery, HAVING
-- Approach: Kept rows whose tiv_2015 appears more than once (subquery with GROUP BY tiv_2015 and HAVING COUNT(*) > 1)
--           and whose (lat, lon) pair appears exactly once (subquery with GROUP BY lat, lon and HAVING COUNT(*) = 1).
--           Summed tiv_2016 for those rows and rounded to 2 decimals.
-- Concept: Subquery, IN with multiple columns, GROUP BY, HAVING, SUM(), ROUND()

SELECT ROUND(SUM(tiv_2016), 2) AS tiv_2016
FROM Insurance
WHERE tiv_2015 IN (
    SELECT tiv_2015
    FROM Insurance
    GROUP BY tiv_2015
    HAVING COUNT(*) > 1
)
AND (lat, lon) IN (
    SELECT lat, lon
    FROM Insurance
    GROUP BY lat, lon
    HAVING COUNT(*) = 1
);
