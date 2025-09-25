FOR a IN actors
  FILTER a.name == "Sam Worthington"
  FOR m IN 1..1 OUTBOUND a ActedIn
    RETURN m.original_title