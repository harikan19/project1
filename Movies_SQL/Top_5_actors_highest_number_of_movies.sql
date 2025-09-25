SELECT 
    actor ->> 'name' AS actor_name,
    COUNT(*) AS movie_count
FROM movie_credits mc
CROSS JOIN LATERAL json_array_elements("cast"::json) AS actor
GROUP BY actor_name
ORDER BY movie_count DESC
LIMIT 5;