-- Problem: 610. Triangle Judgement
-- Link: https://leetcode.com/problems/triangle-judgement/
-- Difficulty: Easy
-- Topic: Advanced Select (IF / conditional logic)
-- Approach: Three sides form a triangle when the sum of any two sides
--           is greater than the third side (x+y>z, y+z>x, z+x>y).
--           Used IF() to return Yes or No.
-- Concept: IF(), AND conditions

SELECT *,
       IF(x + y > z AND y + z > x AND z + x > y, "Yes", "No") AS triangle
FROM Triangle;