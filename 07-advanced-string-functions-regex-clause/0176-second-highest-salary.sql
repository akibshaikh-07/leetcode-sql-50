-- Problem: 176. Second Highest Salary
-- Link: https://leetcode.com/problems/second-highest-salary/
-- Difficulty: Medium
-- Topic: DENSE_RANK, CTE
-- Approach: Ranked salaries in descending order with DENSE_RANK() inside a CTE so equal salaries share a rank.
--           Selected MAX(salary) where the rank is 2, which returns NULL when there is no second highest salary.
-- Concept: CTE, DENSE_RANK(), MAX(), NULL handling

with highestsalary as (
    select salary ,
    DENSE_RANK() over(order by salary desc) as ranking
from Employee
)
select max(salary) as SecondHighestSalary
from highestsalary
where ranking = 2 ;
