SELECT p.person_id, p.name,
    COUNT(DISTINCT cm.title_id) AS number_of_top250_movies
FROM people p
JOIN castmembers cm ON p.person_id = cm.person_id
GROUP BY p.person_id, p.name
ORDER BY number_of_top250_movies DESC;
