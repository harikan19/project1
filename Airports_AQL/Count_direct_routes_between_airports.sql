RETURN LENGTH(
  FOR e IN routes
    FILTER e._from == "airports/JFK" AND e._to == "airports/LAX"
    RETURN e
)