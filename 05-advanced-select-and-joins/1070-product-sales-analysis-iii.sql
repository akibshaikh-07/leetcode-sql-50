-- Problem: 1070. Product Sales Analysis III
-- Link: https://leetcode.com/problems/product-sales-analysis-iii/
-- Difficulty: Medium
-- Topic: Subquery, Aggregation
-- Approach: Found the first year of each product with MIN(year) grouped by product_id in a subquery,
--           then filtered Sales with WHERE (product_id, year) IN (...) to keep only first-year rows.
--           Returned product_id, year as first_year, quantity and price.
-- Concept: Subquery, MIN(), GROUP BY, IN with multiple columns

SELECT
    product_id,
    year AS first_year,
    quantity,
    price
FROM Sales
WHERE (product_id, year) IN (
    SELECT product_id, MIN(year)
    FROM Sales
    GROUP BY product_id
);
