-- Problem: 196. Delete Duplicate Emails
-- Link: https://leetcode.com/problems/delete-duplicate-emails/
-- Difficulty: Easy
-- Topic: CTE, ROW_NUMBER
-- Approach: Numbered the rows of each email with ROW_NUMBER() OVER (PARTITION BY email ORDER BY id ASC) in a CTE.
--           Deleted every row whose number is greater than 1, so only the smallest id of each email is kept.
-- Concept: CTE, ROW_NUMBER(), PARTITION BY, DELETE with subquery

with cte as ( select id ,
                    ROW_NUMBER() over(partition by email
                    order by id asc ) as ranking
from Person
)
delete from Person
where id in(
    select id
    from cte
    where ranking > 1
);
