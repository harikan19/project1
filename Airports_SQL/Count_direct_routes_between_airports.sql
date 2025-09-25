SELECT COUNT(*) AS direct_routes
FROM routes1
WHERE source_airport = 'JFK' 
  AND destination_airport = 'LAX';