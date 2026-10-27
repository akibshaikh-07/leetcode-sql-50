-- Problem: 626. Exchange Seats
-- Link: https://leetcode.com/problems/exchange-seats/
-- Difficulty: Medium
-- Topic: CASE WHEN
-- Approach: Used CASE on id: odd ids get id + 1 (except the last id, found with MAX(id) in a subquery),
--           even ids get id - 1, everything else stays the same. Ordered by id at the end.
-- Concept: CASE WHEN, modulo, subquery, ORDER BY

select
case
when id % 2 = 1 and id != (select max(id) from Seat) then id + 1
when id % 2 = 0 then id - 1
else id
end as id , student
from Seat
order by id asc;
