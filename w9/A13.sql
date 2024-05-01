SELECT ROUND(runtime_minutes / 60.0) AS number_of_hours, COUNT(*) AS number_of_movies 
FROM titles GROUP BY number_of_hours;
