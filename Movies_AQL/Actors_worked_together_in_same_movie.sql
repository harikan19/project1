FOR m IN Movies
  LET actorsList = (
    FOR a IN 1..1 INBOUND m ActedIn
      RETURN a.name
  )
  RETURN { movie: m.original_title, actors: actorsList }