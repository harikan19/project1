FOR e IN routes
  COLLECT airport = PARSE_IDENTIFIER(e._to).key WITH COUNT INTO count
  SORT count DESC
  LIMIT 5
  RETURN { airport, inbound_routes: count }