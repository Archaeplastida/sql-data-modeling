DROP DATABASE IF EXISTS craigslist_db;
CREATE DATABASE craigslist_db;
\c craigslist_db;

CREATE TABLE users
(
    id SERIAL PRIMARY KEY,
    username TEXT NOT NULL,
    pref_region TEXT
);

CREATE TABLE posts
(
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL REFERENCES users ON DELETE CASCADE,
    title TEXT NOT NULL,
    the_text TEXT,
    location TEXT NOT NULL
);

CREATE TABLE categories
(
    id SERIAL PRIMARY KEY,
    category TEXT NOT NULL
);

CREATE TABLE post_category
(
    id SERIAL PRIMARY KEY,
    post_id INTEGER NOT NULL REFERENCES posts ON DELETE CASCADE,
    category_id INTEGER REFERENCES categories ON DELETE SET NULL
);