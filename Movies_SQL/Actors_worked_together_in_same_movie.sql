SELECT 
    mc.title,
    a1.actor_name AS actor1,
    a2.actor_name AS actor2
FROM movie_credits mc
CROSS JOIN LATERAL json_array_elements("cast"::json) AS c1
CROSS JOIN LATERAL json_array_elements("cast"::json) AS c2
CROSS JOIN LATERAL (SELECT c1 ->> 'name') AS a1(actor_name)
CROSS JOIN LATERAL (SELECT c2 ->> 'name') AS a2(actor_name)
WHERE a1.actor_name < a2.actor_name   -- avoid duplicates & self-pairs
ORDER BY mc.title, a1.actor_name, a2.actor_name;