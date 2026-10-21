-- Problem: 550. Game Play Analysis IV
-- Link: https://leetcode.com/problems/game-play-analysis-iv/
-- Difficulty: Medium
-- Topic: Subquery, Dates
-- Approach: Found the first login date of each player with MIN(event_date) in a subquery,
--           then matched players who logged in exactly one day later using DATE_SUB().
--           Divided that count by total distinct players and rounded to 2 decimals.
-- Concept: Subquery, MIN(), DATE_SUB(), ROUND()

select
round(
    count(player_id)/(select count(distinct player_id)from activity),2
    )
as fraction
From Activity
where (
    player_id, DATE_SUB(event_date, interval 1 day))
    in (
    select player_id, MIN(event_date)
    from Activity
    Group by player_id
    );
