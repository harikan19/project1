FOR e IN routes
  LET from = DOCUMENT(e._from)
  LET to = DOCUMENT(e._to)
  FILTER from.Country == "United States" AND to.Country == "United Kingdom"
  RETURN DISTINCT e.Airline