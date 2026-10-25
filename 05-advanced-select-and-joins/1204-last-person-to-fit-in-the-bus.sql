-- Problem: 1204. Last Person to Fit in the Bus
-- Link: https://leetcode.com/problems/last-person-to-fit-in-the-bus/
-- Difficulty: Medium
-- Topic: Window Functions, CTE
-- Approach: Calculated the running total of weight ordered by turn using SUM() OVER() inside a CTE,
--           kept only rows where total_weight <= 1000, then sorted by turn descending
--           and used LIMIT 1 to get the last person who fits on the bus.
-- Concept: CTE, Window Function, Running Total, ORDER BY, LIMIT

with runningtotal as (select person_name , turn ,
sum(weight) over(order by turn) as total_weight
from Queue)
select person_name
from runningtotal
where total_weight <= 1000
order by turn desc
limit 1;
