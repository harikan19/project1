SELECT DISTINCT r2.destination_airport AS reachable_airport
FROM routes1 r1
JOIN routes1 r2 
    ON r1.destination_airport = r2.source_airport
WHERE r1.source_airport = 'AER';