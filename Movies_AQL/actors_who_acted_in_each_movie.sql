FOR m IN Movies
  LET actorCount = LENGTH(
    FOR a IN INBOUND m ActedIn
      RETURN a
  )
  RETURN { movie: m.original_title, total_actors: actorCount }