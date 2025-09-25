import pandas as pd
import json
from arango import ArangoClient

# 1. Load Credits CSV
print("Loading credits CSV...")
credits = pd.read_csv("C:/project1/data/tmdb_5000_credits.csv")

# 2. Connect to ArangoDB
print("Connecting to ArangoDB...")
client = ArangoClient()
db = client.db("project1", username="root", password="1234567")  # change password if needed

# Get collections
actors_col = db.collection("actors")
acted_in = db.collection("ActedIn")

# 3. Prepare bulk lists
actor_docs = []
edge_docs = []

print("Preparing documents...")
for i, row in credits.iterrows():
    movie_id = str(row['movie_id'])
    try:
        cast_list = json.loads(row['cast'])  # parse JSON in "cast"
    except:
        continue

    for actor in cast_list:
        actor_id = str(actor['id'])
        actor_name = actor['name']

        # Add actor doc
        actor_docs.append({'_key': actor_id, 'name': actor_name})

        # Add edge doc
        edge_docs.append({
            '_from': f'actors/{actor_id}',
            '_to': f'Movies/{movie_id}'
        })

    if i % 500 == 0:   # show progress every 500 movies
        print(f"Prepared {i} movies...")

# 4. Bulk insert into ArangoDB
print("Inserting actors...")
actors_col.import_bulk(actor_docs, on_duplicate="ignore")

print("Inserting edges ActedIn...")
acted_in.import_bulk(edge_docs, on_duplicate="ignore")

print("✅ Import finished! Actors and ActedIn edges loaded.")
