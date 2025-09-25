FOR v IN 1..2 OUTBOUND "airports/AER" GRAPH "flightGraph"
  RETURN DISTINCT v._key