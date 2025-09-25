FOR e IN routes
  COLLECT from = e._from, to = e._to INTO g
  LET airlines = UNIQUE(g[*].e.Airline)
  FILTER LENGTH(airlines) > 1
  RETURN { from, to, airline_count: LENGTH(airlines), airlines }