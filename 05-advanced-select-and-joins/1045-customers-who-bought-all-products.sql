-- Problem: 1045. Customers Who Bought All Products
-- Link: https://leetcode.com/problems/customers-who-bought-all-products/
-- Difficulty: Medium
-- Topic: Subquery, GROUP BY, HAVING
-- Approach: Grouped the Customer table by customer_id and used HAVING to compare each customer's
--           COUNT(DISTINCT product_key) with the total product count from a subquery on Product.
--           Customers whose counts match have bought every product.
-- Concept: Subquery, GROUP BY, HAVING, COUNT(DISTINCT)

select customer_id
from Customer
group by customer_id
having count(distinct product_key) = (
    select count(distinct product_key) from Product
    );
