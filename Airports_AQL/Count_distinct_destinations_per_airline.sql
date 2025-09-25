FOR e IN routes
  COLLECT airline = e.Airline INTO g
  LET dests = UNIQUE(g[*].e._to)
  RETURN { airline, dest_count: LENGTH(dests) }