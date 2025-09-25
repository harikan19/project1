SELECT 
    member ->> 'name' AS director,
    COUNT(*) AS movie_count
FROM movie_credits mc
CROSS JOIN LATERAL json_array_elements(crew::json) AS member
WHERE member ->> 'job' = 'Director'
GROUP BY director
ORDER BY movie_count DESC
LIMIT 5;