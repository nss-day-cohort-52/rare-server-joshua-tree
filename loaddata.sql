CREATE TABLE "Users" (
  "id" INTEGER PRIMARY KEY AUTOINCREMENT,
  "first_name" varchar,
  "last_name" varchar,
  "email" varchar,
  "bio" varchar,
  "username" varchar,
  "password" varchar,
  "profile_image_url" varchar,
  "created_on" date,
  "active" bit
);

CREATE TABLE "DemotionQueue" (
  "action" varchar,
  "admin_id" INTEGER,
  "approver_one_id" INTEGER,
  FOREIGN KEY(`admin_id`) REFERENCES `Users`(`id`),
  FOREIGN KEY(`approver_one_id`) REFERENCES `Users`(`id`),
  PRIMARY KEY (action, admin_id, approver_one_id)
);

CREATE TABLE "Subscriptions" (
  "id" INTEGER PRIMARY KEY AUTOINCREMENT,
  "follower_id" INTEGER,
  "author_id" INTEGER,
  "created_on" date,
  FOREIGN KEY(`follower_id`) REFERENCES `Users`(`id`),
  FOREIGN KEY(`author_id`) REFERENCES `Users`(`id`)
);

CREATE TABLE "Posts" (
  "id" INTEGER PRIMARY KEY AUTOINCREMENT,
  "user_id" INTEGER,
  "category_id" INTEGER,
  "title" varchar,
  "publication_date" date,
  "image_url" varchar,
  "content" varchar,
  "approved" bit
);

CREATE TABLE "Comments" (
  "id" INTEGER PRIMARY KEY AUTOINCREMENT,
  "post_id" INTEGER,
  "author_id" INTEGER,
  "content" varchar,
  FOREIGN KEY(`post_id`) REFERENCES `Posts`(`id`),
  FOREIGN KEY(`author_id`) REFERENCES `Users`(`id`)
);

CREATE TABLE "Reactions" (
  "id" INTEGER PRIMARY KEY AUTOINCREMENT,
  "label" varchar,
  "image_url" varchar
);

CREATE TABLE "PostReactions" (
  "id" INTEGER PRIMARY KEY AUTOINCREMENT,
  "user_id" INTEGER,
  "reaction_id" INTEGER,
  "post_id" INTEGER,
  FOREIGN KEY(`user_id`) REFERENCES `Users`(`id`),
  FOREIGN KEY(`reaction_id`) REFERENCES `Reactions`(`id`),
  FOREIGN KEY(`post_id`) REFERENCES `Posts`(`id`)
);

CREATE TABLE "Tags" (
  "id" INTEGER PRIMARY KEY AUTOINCREMENT,
  "label" varchar
);

CREATE TABLE "PostTags" (
  "id" INTEGER PRIMARY KEY AUTOINCREMENT,
  "post_id" INTEGER,
  "tag_id" INTEGER,
  FOREIGN KEY(`post_id`) REFERENCES `Posts`(`id`),
  FOREIGN KEY(`tag_id`) REFERENCES `Tags`(`id`)
);

CREATE TABLE "Categories" (
  "id" INTEGER PRIMARY KEY AUTOINCREMENT,
  "label" varchar
);

INSERT INTO Categories ('label') VALUES ('News');
INSERT INTO Categories ('label') VALUES ('Fiction');
INSERT INTO Categories ('label') VALUES ('Biography');
INSERT INTO Categories ('label') VALUES ('Self Improvement');
INSERT INTO Categories ('label') VALUES ('Sports');
INSERT INTO Categories ('label') VALUES ('Horror');
INSERT INTO Categories ('label') VALUES ('Comedy');
INSERT INTO Categories ('label') VALUES ('Religious');
INSERT INTO Categories ('label') VALUES ('Juvenile Fiction');
INSERT INTO Categories ('label') VALUES ('Delete me first');
INSERT INTO Categories ('label') VALUES ('Delete me second');
INSERT INTO Categories ('label') VALUES ('Delete me third');
INSERT INTO Categories ('label') VALUES ('Delete me fourth');
INSERT INTO Categories ('label') VALUES ('Delete me fifth');
INSERT INTO Categories ('label') VALUES ('Delete me sixth');

INSERT INTO Tags ('label') VALUES ('JavaScript');
INSERT INTO Reactions ('label', 'image_url') VALUES ('happy', 'https://pngtree.com/so/happy');
INSERT INTO Posts ('user_id', 'category_id', 'title', 'publication_date', 'image_url', 'content', 'approved') VALUES ( 1 , 1, 'Guest', '10/12/2019', 'https://pngtree.com/so/happy', 'Random', 0);
INSERT INTO Posts ('user_id', 'category_id', 'title', 'publication_date', 'image_url', 'content', 'approved') VALUES ( 1 , 2, 'Soccer', '10/14/2019', 'https://pngtree.com/so/happy', 'About Sports', 1);
INSERT INTO Posts ('user_id', 'category_id', 'title', 'publication_date', 'image_url', 'content', 'approved') VALUES ( 1 , 2, 'Drama!', '10/15/2019', 'https://pngtree.com/so/happy', 'About Drama', 1);
INSERT INTO Comments ('author_id', 'post_id', 'content')





INSERT INTO Users (first_name, last_name, email, bio, username, password, created_on, active)
VALUES ('Shelby', "Rossi", 'rossi@shelby.com', 'random', 'shelbyrossi', 'password', CURRENT_TIMESTAMP, 1);

INSERT INTO Users (first_name, last_name, email, bio, username, password, created_on, active)
VALUES ('Misty', "Bus", 'misty@bus.com', 'chronically tardy student', 'mistybus', 'password', CURRENT_TIMESTAMP, 6);

INSERT INTO Users (first_name, last_name, email, bio, username, password, created_on, active)
VALUES ('Frank N.', "Stein", 'frankn@stein.com', 'A monster of an author', 'franknstein', 'password', CURRENT_TIMESTAMP, 1);

INSERT INTO Users (first_name, last_name, email, bio, username, password, created_on, active)
VALUES ('Ima', 'Cannibal', 'ima@cannibal.com', 'A voracious reader and author. Always hungry for more!', 'cannibal', 'password', CURRENT_TIMESTAMP, 1);

INSERT INTO Users (first_name, last_name, email, bio, username, password, created_on, active)
VALUES ('Sandy', 'Cheeks', 'sandy@cheeks.com', 'Retired and living the dream life on the beach!', 'sandy', 'password', CURRENT_TIMESTAMP, 1);

INSERT INTO Categories (label)
VALUES ('Fiction');

INSERT INTO Categories (label)
VALUES ('Biography');

INSERT INTO Categories (label)
VALUES ('Self Improvement');

UPDATE Posts
SET user_id = 2,
category = 2,
title = "Long Walk Home",
publication_date = "2022-09-10",
image_url = "https://bestlifeonline.com/wp-content/uploads/sites/3/2019/12/happy-woman-in-nature-at-sunset.jpg",
content = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
WHERE id IS 1;

INSERT INTO Posts (user_id, category_id, title, publication_date, image_url, content)
VALUES (3, 3, 'My Life With Igor', CURRENT_TIMESTAMP, 'https://www.intofilm.org/intofilm-production/scaledcropped/970x546https%3A/s3-eu-west-1.amazonaws.com/images.cdn.filmclub.org/film__4502-igor--hi_res-c5cc097d.jpg/film__4502-igor--hi_res-c5cc097d.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.');

INSERT INTO Posts (user_id, category_id, title, publication_date, image_url, content)
VALUES (4, 4, 'How To Serve Your Fellow Man', CURRENT_TIMESTAMP, 'https://mediaproxy.salon.com/width/1200/https://media.salon.com/2012/06/cannibal_rect.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.');

INSERT INTO Posts (user_id, category_id, title, publication_date, image_url, content)
VALUES (5, 2, 'Sitting on the Beach', CURRENT_TIMESTAMP, 'https://www.abc.net.au/news/image/10391728-16x9-940x529.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.');


INSERT INTO Posts (user_id, category_id, title, publication_date, image_url, content)
VALUES (1, 3, 'Aim High: My Life in the Air Force', CURRENT_TIMESTAMP, 'https://media.defense.gov/2009/Apr/15/2000596769/1200/1200/0/090412-F-0500P-120.JPG', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.');

INSERT INTO Posts (user_id, category_id, title, publication_date, image_url, content)
VALUES (1, 3, 'It Happened One Starry Night: How I Became Rich Selling Art Supplies', CURRENT_TIMESTAMP, 'https://www.vangoghexhibit.ca/wp-content/uploads/2020/10/84366-1.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.');


INSERT INTO Posts (user_id, category_id, title, publication_date, image_url, content, approved)
VALUES (1, 5, 'lovely night', CURRENT_TIMESTAMP, ' https://i.pinimg.com/236x/1f/42/fa/1f42faffb3042d44955133e730320eea--night-sky-stars-night-skies.jpg', 'Walking away', 1)


INSERT INTO Posts (user_id, category_id, title, publication_date, image_url, content)
VALUES (1, 4, 'Watch What You Eat: A Diet You Can Live By', CURRENT_TIMESTAMP, 'https://www.ezcater.com/wp-content/uploads/2018/07/Restrictions-infographic.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.');

INSERT INTO Posts (user_id, category_id, title, publication_date, image_url, content)
VALUES (1, 3, 'Time in the Sandbox: A soldier''s Life', CURRENT_TIMESTAMP, 'https://images03.military.com/sites/default/files/2020-10/Army%20Europe%20Deployment%20Training%201800.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.');

UPDATE Posts
SET title = 'It Happened One Stary Night: How I Became Rich Selling Art Supplies'
WHERE id = 6;
