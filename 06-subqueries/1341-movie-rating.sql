-- Problem: 1341. Movie Rating
-- Link: https://leetcode.com/problems/movie-rating/
-- Difficulty: Medium
-- Topic: UNION ALL, JOIN
-- Approach: First query finds the user with the most ratings (GROUP BY user, ORDER BY COUNT(*) desc, name asc, LIMIT 1).
--           Second query finds the movie with the highest average rating in February 2020
--           (DATE_FORMAT filter, ORDER BY AVG(rating) desc, title asc, LIMIT 1). Combined with UNION ALL.
-- Concept: JOIN, GROUP BY, COUNT(), AVG(), DATE_FORMAT(), UNION ALL, LIMIT

(
select u.name as results
from MovieRating mr
join Users u
ON mr.user_id = u.user_id
group by mr.user_id , u.name
order by count(*) desc, u.name asc
limit 1
)
union all
(
select m.title as results
from MovieRating mr
join Movies m
on mr.movie_id = m.movie_id
where date_format(mr.created_at, '%Y-%m') = '2020-02'
group by mr.movie_id,m.title
order by avg(mr.rating) desc , m.title asc
limit 1
);
