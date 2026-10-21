-- Problem: 550. Game Play Analysis IV
-- Link: https://leetcode.com/problems/game-play-analysis-iv/
-- Difficulty: Medium
-- Topic: Subquery, Dates
-- Approach: Found each player's first login date with MIN(event_date) in a subquery,
--           then matched players who logged in exactly one day later using DATE_SUB().
--           Divided that count by total distinct players and rounded to 2 decimals.
-- Concept: Subquery, MIN(), DATE_SUB(), ROUND()

$f = "05-advanced-select-and-joins\0550-game-play-analysis-iv.sql"
$header = @'
-- Problem: 550. Game Play Analysis IV
-- Link: https://leetcode.com/problems/game-play-analysis-iv/
-- Difficulty: Medium
-- Topic: Subquery, Dates
-- Approach: Found each player's first login date with MIN(event_date) in a subquery,
--           then matched players who logged in exactly one day later using DATE_SUB().
--           Divided that count by total distinct players and rounded to 2 decimals.
-- Concept: Subquery, MIN(), DATE_SUB(), ROUND()

'@
$code = Get-Clipboard | Where-Object { $_ -notmatch '^# Write your MySQL' }
Set-Content -Encoding ascii -Path $f -Value $header
Add-Content -Encoding ascii -Path $f -Value $code
Get-Content $f
