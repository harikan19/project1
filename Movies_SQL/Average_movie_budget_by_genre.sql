SELECT 
    g ->> 'name' AS genre,
    AVG(m.budget) AS avg_budget
FROM movies m
CROSS JOIN LATERAL json_array_elements(genres::json) AS g
WHERE m.budget > 0   -- ignore missing/zero budgets
GROUP BY genre
ORDER BY avg_budget DESC;