FOR m IN Movies
  FILTER m.release_date > "2010-01-01"
  LET genres = JSON_PARSE(m.genres)
  FILTER LENGTH(
    FOR g IN genres
      FILTER g.name == "Action"
      RETURN 1
  ) > 0
  RETURN { title: m.original_title, year: m.release_date }