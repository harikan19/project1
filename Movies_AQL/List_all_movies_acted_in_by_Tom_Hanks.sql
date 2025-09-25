FOR a IN actors
  FILTER a.name == "Tom Hanks"
  FOR m IN OUTBOUND a ActedIn
    RETURN { actor: a.name, movie: m.original_title }