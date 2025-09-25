SELECT 
    mc.title
FROM movie_credits mc
CROSS JOIN LATERAL json_array_elements("cast"::json) AS actor
WHERE actor ->> 'name' = 'Tom Hanks'
ORDER BY mc.title;