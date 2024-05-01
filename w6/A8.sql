SELECT yr AS year, COUNT(winnerName) AS matches_won
FROM WTAResult
WHERE winnerCountry = 'AUS'
GROUP BY yr
ORDER BY yr;
