SELECT source_airport, destination_airport, COUNT(DISTINCT airline) AS airline_count
FROM routes1
GROUP BY source_airport, destination_airport
HAVING COUNT(DISTINCT airline) > 1
ORDER BY airline_count DESC;