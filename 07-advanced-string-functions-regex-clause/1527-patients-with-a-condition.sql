-- Problem: 1527. Patients With a Condition
-- Link: https://leetcode.com/problems/patients-with-a-condition/
-- Difficulty: Easy
-- Topic: LIKE, Strings
-- Approach: Used LIKE with the % wildcard to match conditions that start with DIAB1 ('DIAB1%')
--           or have DIAB1 after a space ('% DIAB1%'). The space avoids false matches such as ACNE_DIAB100.
--           Combined both patterns with OR.
-- Concept: LIKE, wildcard %, OR

select * from Patients
where conditions like 'DIAB1%' or conditions like '% DIAB1%';
