FOR e IN routes
  LET from = DOCUMENT(e._from)
  LET to   = DOCUMENT(e._to)
  COLLECT pair = CONCAT(from.Country, " → ", to.Country) WITH COUNT INTO count
  SORT count DESC
  LIMIT 3
  RETURN { country_pair: pair, route_count: count }