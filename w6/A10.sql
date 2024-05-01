SELECT
    winnerName AS player_name,
    COUNT(*) AS matches_won,
    ROUND(AVG(minutes), 2) AS avg_match_length
FROM ATPResult
GROUP BY winnerName
HAVING matches_won >= 10
ORDER BY avg_match_length;
