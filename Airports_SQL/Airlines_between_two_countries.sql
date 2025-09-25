SELECT DISTINCT r.airline
FROM routes1 r
JOIN airports1 a1 
    ON r.source_airport = a1.iata
JOIN airports1 a2 
    ON r.destination_airport = a2.iata
WHERE a1.country = 'United States'
  AND a2.country = 'United Kingdom';