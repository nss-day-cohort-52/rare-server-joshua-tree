import sqlite3
import json
from xml.etree.ElementTree import Comment
from models import Comments


def get_all_comments():
    # Open a connection to the database
    with sqlite3.connect("./db.sqlite3") as conn:

        # Just use these. It's a Black Box.
        conn.row_factory = sqlite3.Row
        db_cursor = conn.cursor()

        # Write the SQL query to get the information you want
        db_cursor.execute("""
            SELECT
                c.id,
                c.author_id,
                c.post_id,
                c.content
            FROM comments c 
            
            
        """)

        # Initialize an empty list to hold all subscription representations
        comments = []

        # Convert rows of data into a Python list
        dataset = db_cursor.fetchall()

        # Iterate list of data returned from database
        for row in dataset:

            # Create an subscription instance from the current row.
            # Note that the database fields are specified in
            # exact order of the parameters defined in the
            # Subscription class above.
            comment = Comments(row['id'], row['author_id'],row['post_id'], row['content'])
            # subscription.follower_id = Follower_id(
            #     row['user_id'], row['follower_id_name'], row['email']).__dict__
            # subscription.author_id = Author_id(
            #     row['user_id'], row['author_name']).__dict__
            comments.append(comment.__dict__)

    # Use `json` package to properly serialize list as JSON
    return json.dumps(comments)

def get_single_comment(id):
    with sqlite3.connect("./db.sqlite3") as conn:
        conn.row_factory = sqlite3.Row
        db_cursor = conn.cursor()

        # Use a ? parameter to inject a variable's value
        # into the SQL statement.
        db_cursor.execute("""
        SELECT
             c.id,
                c.author_id,
                c.post_id,
                c.content
        FROM comments c    
        WHERE c.id = ?
        """, ( id, ))

        # Load the single result into memory
        data = db_cursor.fetchone()

        # Create a user instance from the current row    
        comment = Comments(data['id'], data['author_id'], data['post_id'], data['content'])

        return json.dumps(comment.__dict__)
    
def create_comment(new_comment):
    with sqlite3.connect('./db.sqlite3') as conn:
        conn.row_factory = sqlite3.Row
        db_cursor = conn.cursor()

        db_cursor.execute("""
        INSERT INTO Tags 
        (label )
        VALUES
        (?,?,?);
        """,(new_comment['author_id'],['post_id'], ['content']))
       

        id = db_cursor.lastrowid
        new_comment['id'] = id


        return json.dumps(new_comment)
        
def delete_comment(id):
    with sqlite3.connect("./db.sqlite3") as conn:
        db_cursor = conn.cursor()

        db_cursor.execute("""
        DELETE FROM comment
        WHERE id = ?
        """, (id, ))