FOR m IN Movies
  FOR g IN JSON_PARSE(m.genres)
    COLLECT genre = g.name INTO group
    LET avgBudget = AVERAGE(group[*].m.budget)
    RETURN { genre, avgBudget }