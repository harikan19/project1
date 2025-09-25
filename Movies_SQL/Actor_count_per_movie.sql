SELECT 
    mc.title,
    COUNT(*) AS actor_count
FROM movie_credits mc
CROSS JOIN LATERAL json_array_elements("cast"::json) AS actor
GROUP BY mc.title
ORDER BY actor_count DESC;