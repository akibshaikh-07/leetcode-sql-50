-- Problem: 1484. Group Sold Products By The Date
-- Link: https://leetcode.com/problems/group-sold-products-by-the-date/
-- Difficulty: Easy
-- Topic: GROUP_CONCAT
-- Approach: Grouped the rows by sell_date, counted the different products with COUNT(DISTINCT product),
--           and joined the product names into one sorted, comma-separated string with GROUP_CONCAT.
--           Ordered the result by sell_date.
-- Concept: GROUP_CONCAT, COUNT(DISTINCT), GROUP BY, ORDER BY

select sell_date ,
    count(distinct product) as num_sold,
        group_concat(distinct product order by product asc separator ',') as products
from Activities
group by sell_date
order by sell_date asc;
