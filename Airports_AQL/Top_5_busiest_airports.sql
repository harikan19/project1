FOR e IN routes
  COLLECT airport = PARSE_IDENTIFIER(e._from).key WITH COUNT INTO count
  SORT count DESC
  LIMIT 5
  RETURN { airport, routes_count: count }