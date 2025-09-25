FOR m IN Movies
  FILTER m.original_title == "Avatar"
  FOR actor IN 1..1 INBOUND m ActedIn
    RETURN actor.name 