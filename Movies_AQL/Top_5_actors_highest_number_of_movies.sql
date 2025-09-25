FOR a IN actors
  LET movieCount = LENGTH(
    FOR m IN OUTBOUND a ActedIn
      RETURN m
  )
  SORT movieCount DESC
  LIMIT 5
  RETURN { actor: a.name, movies: movieCount }