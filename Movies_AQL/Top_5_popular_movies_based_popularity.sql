FOR m IN Movies
  SORT m.popularity DESC
  LIMIT 5
  RETURN { title: m.original_title, popularity: m.popularity }