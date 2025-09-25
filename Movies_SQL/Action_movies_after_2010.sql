SELECT 
    m.title,
    m.release_date
FROM movies m
CROSS JOIN LATERAL json_array_elements(genres::json) AS g
WHERE g ->> 'name' = 'Action'
  AND m.release_date > '2010-01-01'
ORDER BY m.release_date;