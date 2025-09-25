SELECT destination_airport, COUNT(*) AS inbound_routes
FROM routes1
GROUP BY destination_airport
ORDER BY inbound_routes DESC
LIMIT 5;