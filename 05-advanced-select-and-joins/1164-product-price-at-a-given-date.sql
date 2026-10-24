-- Problem: 1164. Product Price at a Given Date
-- Link: https://leetcode.com/problems/product-price-at-a-given-date/
-- Difficulty: Medium
-- Topic: Subquery, UNION
-- Approach: Found the latest change_date on or before 2019-08-16 for each product with MAX(change_date),
--           matched (product_id, change_date) pairs with IN to get that price.
--           Used UNION with HAVING MIN(change_date) > '2019-08-16' to return the default price 10.
-- Concept: Subquery, MAX(), MIN(), UNION, GROUP BY, HAVING

select product_id , new_price as price
from Products
where(product_id , change_date) in (
    select product_id , max(change_date)
    from Products
    where change_date <= '2019-08-16'
    group by product_id
)
union
select product_id , 10 as price
from Products
group by product_id
having min(change_date) > '2019-08-16';
