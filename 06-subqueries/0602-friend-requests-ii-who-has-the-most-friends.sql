-- Problem: 602. Friend Requests II: Who Has the Most Friends
-- Link: https://leetcode.com/problems/friend-requests-ii-who-has-the-most-friends/
-- Difficulty: Medium
-- Topic: CTE, UNION ALL
-- Approach: Stacked requester_id and accepter_id into one id column using UNION ALL inside a CTE,
--           since each accepted request adds a friend for both people.
--           Grouped by id, counted with COUNT(*), ordered descending and used LIMIT 1.
-- Concept: CTE, UNION ALL, GROUP BY, COUNT(), ORDER BY, LIMIT

with allfriends as (
    select requester_id as id from RequestAccepted
    UNION ALL
    select accepter_id as id from RequestAccepted
)
select
    id,
    COUNT(*) as num
from AllFriends
group by id
order by num desc
limit 1;
