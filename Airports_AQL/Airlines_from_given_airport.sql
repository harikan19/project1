FOR e IN routes
  FILTER e._from == "airports/JFK"
  RETURN DISTINCT e.Airline