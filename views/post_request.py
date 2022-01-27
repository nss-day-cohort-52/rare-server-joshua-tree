import sqlite3
import json
from models import Post, Category, User
        
def get_all_posts():
    # Open a connection to the database
    with sqlite3.connect("./db.sqlite3") as conn:

        # Just use these. It's a Black Box.
        conn.row_factory = sqlite3.Row
        db_cursor = conn.cursor()

        # Write the SQL query to get the information you want
        db_cursor.execute("""
        SELECT
            p.id,
            p.user_id,
            p.category_id,
            p.title,
            p.publication_date,
            p.image_url,
            p.content,
            p.approved,
            c.label category_label,
            u.first_name user_first_name,
            u.last_name user_last_name,
            u.email user_email,
            u.bio user_bio,
            u.username user_username,
            u.password user_password,
            u.profile_image_url user_user_profile_image_url,
            u.created_on user_created_on,
            u.active user_active
            FROM Posts p
            JOIN Categories c
                ON c.id = p.category_id
            JOIN Users u
                ON u.id = p.user_id
            ORDER BY p.publication_date DESC
        """)


        posts = []

        dataset = db_cursor.fetchall()

        for row in dataset:
            
            post = Post(row['id'], row['user_id'], row['category_id'],
                            row['title'], row['publication_date'], row['image_url'], row['content'], row['approved'] )

            
            user = User(row['id'], row['user_first_name'], row['user_last_name'], row['user_email'], row['user_bio'], row['user_username'], row['user_password'], row['user_user_profile_image_url'], row['user_created_on'], row['user_active'])
            
            post.user = user.__dict__

            category = Category(row['id'], row['category_label'])
            
            post.category = category.__dict__
            
            posts.append(post.__dict__)
            
    return json.dumps(posts)

def get_single_post(id):
    with sqlite3.connect("./db.sqlite3") as conn:
        conn.row_factory = sqlite3.Row
        db_cursor = conn.cursor()

        # Use a ? parameter to inject a variable's value
        # into the SQL statement.
        db_cursor.execute("""
        SELECT
            p.id,
            p.user_id,
            p.category_id,
            p.title,
            p.publication_date,
            p.image_url,
            p.content,
            p.approved,
            c.label category_label,
            user.first_name user_first_name,
            user.last_name user_last_name,
            user.email user_email,
            user.bio user_bio,
            user.username user_username,
            user.password user_password,
            user.profile_image_url user_profile_image_url,
            user.created_on user_created_on,
            user.active user_active
        FROM Posts p
        JOIN Categories c
            ON c.id = p.category_id
        JOIN Users user
            ON user.id = p.user_id
        WHERE p.id = ?
        """, ( id, ))

        # Load the single result into memory
        data = db_cursor.fetchone()

        # Create an animal instance from the current row
        post = Post(data['id'], data['user_id'], data['category_id'],
                            data['title'], data['publication_date'], data['image_url'], data['content'], data['approved'] )
            
        user = User(data['id'], data['user_first_name'], data['user_last_name'], data['user_email'], data['user_bio'], data['user_username'], data['user_password'], data['user_profile_image_url'], data['user_created_on'], data['user_active'])
            
        post.user = user.__dict__
        
        category = Category(data['id'], data['category_label'])
            
        post.category = category.__dict__    

        return json.dumps(post.__dict__)
    
    
def delete_post(id):
    with sqlite3.connect("./db.sqlite3") as conn:
        db_cursor = conn.cursor()

        db_cursor.execute("""
        DELETE FROM posts
        WHERE id = ?
        """, (id, ))
        
def get_posts_by_current_user(user_id):
    # Open a connection to the database
    with sqlite3.connect("./db.sqlite3") as conn:
        conn.row_factory = sqlite3.Row
        db_cursor = conn.cursor()

        # Write the SQL query to get the information you want
        db_cursor.execute("""
        SELECT
            p.id,
            p.user_id,
            p.category_id,
            p.title,
            p.publication_date,
            p.image_url,
            p.content,
            p.approved,
            c.label category_label,
            u.first_name user_first_name,
            u.last_name user_last_name,
            u.email user_email,
            u.bio user_bio,
            u.username user_username,
            u.password user_password,
            u.profile_image_url user_user_profile_image_url,
            u.created_on user_created_on,
            u.active user_active
        FROM Posts p
        JOIN Categories c
            ON c.id = p.category_id
        JOIN Users u
            ON u.id = p.user_id
        WHERE p.user_id = ?
        """, ( user_id, ))

        posts = []
        dataset = db_cursor.fetchall()

        for row in dataset:            
            post = Post(row['id'], row['user_id'], row['category_id'],
                            row['title'], row['publication_date'], row['image_url'], row['content'], row['approved'] )
            posts.append(post.__dict__)

            user = User(row['id'], row['user_first_name'], row['user_last_name'], row['user_email'], row['user_bio'], row['user_username'], row['user_password'], row['user_user_profile_image_url'], row['user_created_on'], row['user_active'])
            post.user = user.__dict__

            category = Category(row['id'], row['category_label'])
            post.category = category.__dict__ 
            
    return json.dumps(posts)


def get_post_category(category_id):
    with sqlite3.connect("./db.sqlite3") as conn:
        conn.row_factory = sqlite3.Row
        db_cursor = conn.cursor()

        # Use a ? parameter to inject a variable's value
        # into the SQL statement.
        db_cursor.execute("""
        SELECT
            p.id,
            p.user_id,
            p.category_id,
            p.title,
            p.publication_date,
            p.image_url,
            p.content,
            p.approved,
            c.label category_label
        FROM Posts p
        JOIN Categories c
            ON c.id = p.category_id
        WHERE p.category_id = ?
        """, ( category_id, ))
        
        posts = []

        dataset = db_cursor.fetchall()

        for row in dataset:
                
            post = Post(row['id'], row['user_id'], row['category_id'],
            row['title'], row['publication_date'], row['image_url'], row['content'], row['approved'], )
            
            category = Category(row['id'], row['category_label'])
            
            post.category = category.__dict__ 
        
            posts.append(post.__dict__)
        
        return json.dumps(posts)