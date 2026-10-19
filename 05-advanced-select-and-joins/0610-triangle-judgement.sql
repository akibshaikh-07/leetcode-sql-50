-- Problem: 610. Triangle Judgement
-- Link: https://leetcode.com/problems/triangle-judgement/
-- Difficulty: Easy
-- Topic: Advanced Select (IF / conditional logic)
-- Approach: Teen sides ek triangle banati hain jab kisi bhi do sides ka sum
--           teesri side se bada ho (x+y>z, y+z>x, z+x>y). IF() se Yes/No nikala.
-- Concept: IF(), AND conditions

SELECT *,
       IF(x + y > z AND y + z > x AND z + x > y, "Yes", "No") AS triangle
FROM Triangle;