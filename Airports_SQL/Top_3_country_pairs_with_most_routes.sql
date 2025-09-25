SELECT a1.country AS source_country,
       a2.country AS destination_country,
       COUNT(*) AS route_count
FROM routes1 r
JOIN airports1 a1 ON r.source_airport = a1.iata
JOIN airports1 a2 ON r.destination_airport = a2.iata
GROUP BY a1.country, a2.country
ORDER BY route_count DESC
LIMIT 3;