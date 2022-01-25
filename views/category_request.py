import sqlite3
import json
from datetime import datetime
from models import Category

        
def get_all_categories():
    # Open a connection to the database
    with sqlite3.connect("./db.sqlite3") as conn:

        # Just use these. It's a Black Box.
        conn.row_factory = sqlite3.Row
        db_cursor = conn.cursor()

        # Write the SQL query to get the information you want
        db_cursor.execute("""
        SELECT
            c.id,
            c.label
            FROM categories c    
        """)

        categories = []

       
        dataset = db_cursor.fetchall()

        for row in dataset:
            
            category = Category(row['id'], row['label'], )


            categories.append(category.__dict__)
            
  
    return json.dumps(categories)

def get_single_category(id):
    with sqlite3.connect("./db.sqlite3") as conn:
        conn.row_factory = sqlite3.Row
        db_cursor = conn.cursor()

        # Use a ? parameter to inject a variable's value
        # into the SQL statement.
        db_cursor.execute("""
        SELECT
            c.id,
            c.label
            FROM categories c 
        WHERE c.id = ?
        """, ( id, ))

        # Load the single result into memory
        data = db_cursor.fetchone()

        # Create an animal instance from the current row
        category = Category(data['id'], data['label'],)

        return json.dumps(category.__dict__)