-- Problem: 1907. Count Salary Categories
-- Link: https://leetcode.com/problems/count-salary-categories/
-- Difficulty: Medium
-- Topic: UNION, COUNT
-- Approach: Wrote one SELECT per salary category (Low < 20000, Average 20000 to 50000, High > 50000),
--           used a fixed string as the category label and COUNT(*) as accounts_count,
--           then combined the three results with UNION.
-- Concept: UNION, COUNT(*), BETWEEN, string literals

select 'Low Salary' as category , count(*) as accounts_count
from Accounts where income < 20000

union

select 'Average Salary' as category , count(*) as accounts_count
from Accounts where income between 20000 and 50000

union

select 'High Salary' as category , count(*) as accounts_count
from Accounts where income > 50000;
