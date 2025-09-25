FOR m IN Movies
  SORT m.budget DESC
  LIMIT 5
  RETURN { title: m.original_title, budget: m.budget }