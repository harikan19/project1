SELECT 
    title,
    json_array_elements("cast"::json) ->> 'name' AS actor_name
FROM movie_credits
WHERE title = 'Avatar';