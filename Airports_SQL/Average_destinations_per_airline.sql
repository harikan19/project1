SELECT AVG(dest_count) AS avg_destinations_per_airline
FROM (
    SELECT airline, COUNT(DISTINCT destination_airport) AS dest_count
    FROM routes1
    GROUP BY airline
) sub;