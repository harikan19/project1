# Project 1: Comparison of Relational and Graph Databases (PostgreSQL & ArangoDB)

##  Overview
This project compares the performance, usability, and suitability of **Relational Databases (PostgreSQL)** and **Graph Databases (ArangoDB)**.  
Two real-world datasets (Movies and Airports) were used, and a set of queries were implemented in both SQL and AQL to evaluate tradeoffs between the two database models.  

The final goal: **Analyze and conclude in which scenarios relational databases or graph databases are more suitable.**

---

##  Datasets Used
1. **Movies Dataset**
   - `tmdb_5000_movies.csv`
   - `tmdb_5000_credits.csv`
   - Contains movie metadata, budget, genres, release dates, popularity, actors, and crew details.

2. **Airports Dataset**
   - `airports.csv`
   - `airlines.csv`
   - `routes.csv`
   - Cleaned versions: `airports_clean.csv`, `routes_clean.csv`, `routes_final.csv`
   - Contains details of airports, airlines, and flight routes.

---

##  Database Setup

### PostgreSQL (Relational DB)
- Imported CSV datasets into PostgreSQL tables (`movies`, `movie_credits`, `airports1`, `routes1`, `airlines`).
- Used `COPY` command to load CSV data.
- JSON fields (like `cast` and `crew`) were extracted using `json_array_elements`.

### ArangoDB (Graph DB)
- Imported datasets into ArangoDB collections.
- Built graph relationships for:
  - **Movies dataset** → actors, movies, genres
  - **Airports dataset** → routes between airports
- Queries written in **AQL** to traverse relationships.

---

##  Queries Implemented

### Movies Dataset
1. **List all actors in a movie (e.g., Avatar).**
2. **Find all movies by a given actor (e.g., Sam Worthington).**
3. **Find actors who worked together in the same movie.**
4. **Action movies released after 2010 (title + release date).**
5. **Number of actors in each movie.**
6. **Top 5 actors with the highest number of movies.**
7. **List all movies acted in by Tom Hanks.**
8. **Average movie budget grouped by genre.**
9. **Top 5 most popular movies (by popularity score).**
10. **Find the top 5 directors who directed the most movie.**
11. **Find the top 5 movies with the highest budget.**

### Airports Dataset
1. **List all airlines that fly from a given airport (e.g., JFK).**
2. **Find all airports reachable within 2 hops from a given airport (e.g., AER).**
3. **Count how many direct routes exist between two airports (e.g., JFK → LAX).**
4. **Find top 5 busiest airports (most outgoing routes).**
5. **List all airlines that operate between two specific countries (e.g., USA → UK).**
6. **Count distinct destinations per airline.**
7. **Pairs of airports that share more than one airline.**
8. **Find the top 5 destination airports that receive the most inbound flights.**
9. **Find the average number of destinations per airline.**
10. **Find the top 3 country pairs with the most routes between them.**


## Results & Observations
- **Relational DB (Postgres):**
  - Better suited for structured queries, aggregations, and tabular operations.
  - Querying JSON fields (like cast & crew) required extra parsing (`::json`).
  - Good for reporting, aggregations, and handling structured CSV imports.

- **Graph DB (ArangoDB):**
  - Better suited for relationship-heavy queries (e.g., co-actors, shortest flight routes).
  - Traversal queries (actors working together, flight path searches) were simpler and faster.
  - More natural representation for networks (actors & movies, airports & routes).


## Project Structure
project1/
│── Airport_data/ # Raw and cleaned datasets for Airports
│ ├── airlines.csv
│ ├── airports.csv
│ ├── airports_clean.csv
│ ├── routes.csv
│ ├── routes_clean.csv
│ └── routes_final.csv
│
│── Movies_data/ # Raw datasets for Movies
│ ├── tmdb_5000_movies.csv
│ └── tmdb_5000_credits.csv
│
│── Airports_SQL/ # PostgreSQL queries for Airports dataset
│ ├── Airlines_between_two_countries.sql
│ ├── Airlines_from_given_airport.sql
│ ├── Airport_pairs_sharing_multiple_airlines.sql
│ ├── Airports_reachable_within_2_hops.sql
│ ├── Average_destinations_per_airline.sql
│ ├── Count_direct_routes_between_airports.sql
│ ├── Count_distinct_destinations_per_airline.sql
│ ├── Top_3_country_pairs_with_most_routes.sql
│ ├── Top_5_busiest_airports.sql
│ └── Top_5_inbound_destination_airports.sql
│
│── Airports_AQL/ # ArangoDB queries for Airports dataset
│ ├── Airlines_between_two_countries.aql
│ ├── Airlines_from_given_airport.aql
│ ├── Airport_pairs_sharing_multiple_airlines.aql
│ ├── Airports_reachable_within_2_hops.aql
│ ├── Average_destinations_per_airline.aql
│ ├── Count_direct_routes_between_airports.aql
│ ├── Count_distinct_destinations_per_airline.aql
│ ├── Top_3_country_pairs_with_most_routes.aql
│ ├── Top_5_busiest_airports.aql
│ └── Top_5_inbound_destination_airports.aql
│
│── Movies_SQL/ # PostgreSQL queries for Movies dataset
│ ├── List_all_actors_in_movie.sql
│ ├── Movies_by_actor.sql
│ ├── Actors_who_worked_together.sql
│ ├── Action_movies_after_2010.sql
│ ├── Number_of_actors_per_movie.sql
│ ├── Top_5_actors_highest_movies.sql
│ ├── Movies_by_Tom_Hanks.sql
│ ├── Average_budget_by_genre.sql
│ ├── Top_5_most_popular_movies.sql
│ └── Top_5_highest_budget_movies.sql
│
│── Movies_AQL/ # ArangoDB queries for Movies dataset
│ ├── List_all_actors_in_movie.aql
│ ├── Movies_by_actor.aql
│ ├── Actors_who_worked_together.aql
│ ├── Action_movies_after_2010.aql
│ ├── Number_of_actors_per_movie.aql
│ ├── Top_5_actors_highest_movies.aql
│ ├── Movies_by_Tom_Hanks.aql
│ ├── Average_budget_by_genre.aql
│ ├── Top_5_most_popular_movies.aql
│ └── Top_5_highest_budget_movies.aql
│
│── ## Query Results (Screenshots)
---

│
│── load_actors.py # Helper Python script for loading data
│── README.md # Project documentation

