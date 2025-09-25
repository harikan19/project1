SELECT source_airport, COUNT(*) AS routes_count
FROM routes1
GROUP BY source_airport
ORDER BY routes_count DESC
LIMIT 5;