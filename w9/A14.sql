SELECT (CAST((t.premiered / 10) AS INTEGER) * 10) || 's' AS name_of_the_decade,
       title, rating
FROM titles t
JOIN ratings r ON t.title_id = r.title_id
WHERE rating = (
    SELECT MAX(rating)
    FROM ratings r2
    WHERE r2.title_id IN (
        SELECT t2.title_id
        FROM titles t2
        WHERE CAST(t2.premiered AS INTEGER) / 10 = CAST(t.premiered AS INTEGER) / 10
    )
)
ORDER BY CAST(t.premiered AS INTEGER) / 10;
