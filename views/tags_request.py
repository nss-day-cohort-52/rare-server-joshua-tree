import sqlite3
import json
from models import Tags


def get_all_tags():
    # Open a connection to the database
    with sqlite3.connect("./db.sqlite3") as conn:

        # Just use these. It's a Black Box.
        conn.row_factory = sqlite3.Row
        db_cursor = conn.cursor()

        # Write the SQL query to get the information you want
        db_cursor.execute("""
            SELECT
                t.id,
                t.label
            FROM tags t 
            ORDER BY t.label ASC
            
        """)

        # Initialize an empty list to hold all subscription representations
        tags = []

        # Convert rows of data into a Python list
        dataset = db_cursor.fetchall()

        # Iterate list of data returned from database
        for row in dataset:

            # Create an subscription instance from the current row.
            # Note that the database fields are specified in
            # exact order of the parameters defined in the
            # Subscription class above.
            tag = Tags(row['id'], row['label'])
            # subscription.follower_id = Follower_id(
            #     row['user_id'], row['follower_id_name'], row['email']).__dict__
            # subscription.author_id = Author_id(
            #     row['user_id'], row['author_name']).__dict__
            tags.append(tag.__dict__)

    # Use `json` package to properly serialize list as JSON
    return json.dumps(tags)

def get_single_tag(id):
    with sqlite3.connect("./db.sqlite3") as conn:
        conn.row_factory = sqlite3.Row
        db_cursor = conn.cursor()

        # Use a ? parameter to inject a variable's value
        # into the SQL statement.
        db_cursor.execute("""
        SELECT
            t.id,
            t.label
        FROM tags t      
        WHERE t.id = ?
        """, ( id, ))

        # Load the single result into memory
        data = db_cursor.fetchone()

        # Create a user instance from the current row    
        tag = Tags(data['id'], data['label'])

        return json.dumps(tag.__dict__)
    
def create_tag(new_tag):
    with sqlite3.connect('./db.sqlite3') as conn:
        conn.row_factory = sqlite3.Row
        db_cursor = conn.cursor()

        db_cursor.execute("""
        INSERT INTO Tags 
        (label )
        VALUES
        (?);
        """,(new_tag['label'],))
       

        id = db_cursor.lastrowid
        new_tag['id'] = id


        return json.dumps(new_tag)
        
def delete_tag(id):
    with sqlite3.connect("./db.sqlite3") as conn:
        db_cursor = conn.cursor()

        db_cursor.execute("""
        DELETE FROM tags
        WHERE id = ?
        """, (id, ))
