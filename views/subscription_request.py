import sqlite3
import json
from models import Subscription


def get_all_subscriptions():
    # Open a connection to the database
    with sqlite3.connect("./db.sqlite3") as conn:

        # Just use these. It's a Black Box.
        conn.row_factory = sqlite3.Row
        db_cursor = conn.cursor()

        # Write the SQL query to get the information you want
        db_cursor.execute("""
            SELECT
                s.id,
                s.follower_id,
                s.author_id,
                s.created_on,
            FROM subscription a
            
        """)

        # Initialize an empty list to hold all subscription representations
        subscriptions = []

        # Convert rows of data into a Python list
        dataset = db_cursor.fetchall()

        # Iterate list of data returned from database
        for row in dataset:

            # Create an subscription instance from the current row.
            # Note that the database fields are specified in
            # exact order of the parameters defined in the
            # Subscription class above.
            subscription = Subscription(row['id'], row['follower_id'], row['author_id'],
                                        row['created_on'])
            # subscription.follower_id = Follower_id(
            #     row['user_id'], row['follower_id_name'], row['email']).__dict__
            # subscription.author_id = Author_id(
            #     row['user_id'], row['author_name']).__dict__
            subscriptions.append(subscription.__dict__)

    # Use `json` package to properly serialize list as JSON
    return json.dumps(subscriptions)
