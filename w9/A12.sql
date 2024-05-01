SELECT premiered AS year,COUNT(*) AS number_of_movies 
FROM titles GROUP BY premiered 
ORDER BY number_of_movies DESC, premiered DESC;
