-- Problem: 1517. Find Users With Valid E-Mails
-- Link: https://leetcode.com/problems/find-users-with-valid-e-mails/
-- Difficulty: Easy
-- Topic: REGEXP_LIKE
-- Approach: Used REGEXP_LIKE with a regex that requires the mail to start with a letter, allow letters, digits,
--           underscore, period and dash after it, and end with @leetcode.com. The dot is written as [.]
--           and the match type 'c' makes the check case-sensitive.
-- Concept: REGEXP_LIKE, regular expressions, character classes

select *
from Users
where REGEXP_LIKE(
    mail,
    '^[A-Za-z][A-Za-z0-9_.-]*@leetcode[.]com$',
    'c'
);
