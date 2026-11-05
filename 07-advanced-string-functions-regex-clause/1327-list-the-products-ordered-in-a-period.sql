-- Problem: 1327. List the Products Ordered in a Period
-- Link: https://leetcode.com/problems/list-the-products-ordered-in-a-period/
-- Difficulty: Easy
-- Topic: JOIN, HAVING
-- Approach: Joined Products with Orders on product_id and filtered February 2020 with LIKE '2020-02%'.
--           Grouped by product, summed the units and kept products with SUM(unit) >= 100 using HAVING.
-- Concept: INNER JOIN, LIKE, GROUP BY, SUM(), HAVING

select p.product_name , sum(o.unit) as unit
from Products p
inner join Orders o
on p.product_id = o.product_id
where o.order_date like '2020-02%'
group by p.product_id, p.product_name
having sum(o.unit) >= 100;
