-- Problem: 1321. Restaurant Growth
-- Link: https://leetcode.com/problems/restaurant-growth/
-- Difficulty: Medium
-- Topic: Window Functions
-- Approach: Summed the amount per day in a CTE, then used SUM() and AVG() as window functions with
--           ROWS 6 PRECEDING to get a 7-day moving total and average (rounded to 2 decimals).
--           Kept only days on or after the first date + 6 days so every window has 7 days.
-- Concept: CTE, Window Functions, ROWS PRECEDING, Moving Average, DATE_ADD()

WITH Daily AS (
    SELECT visited_on, SUM(amount) AS amount
    FROM Customer
    GROUP BY visited_on
)
SELECT *
FROM (
    SELECT
        visited_on,
        SUM(amount) OVER(ORDER BY visited_on ROWS 6 PRECEDING) AS amount,
        ROUND(AVG(amount) OVER(ORDER BY visited_on ROWS 6 PRECEDING), 2) AS average_amount
    FROM Daily
) t
WHERE visited_on >= (
    SELECT DATE_ADD(MIN(visited_on), INTERVAL 6 DAY)
    FROM Customer
    );
