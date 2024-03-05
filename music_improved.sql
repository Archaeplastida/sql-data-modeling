DROP DATABASE IF EXISTS music;
CREATE DATABASE music;
\c music;

CREATE TABLE artists
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE producers
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE albums
(
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL
);

CREATE TABLE songs
(
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    album_id INTEGER REFERENCES albums,
    release_date DATE NOT NULL,
    duration_in_seconds INTEGER NOT NULL
);

CREATE TABLE song_artists
(
    id SERIAL PRIMARY KEY,
    song_id INTEGER NOT NULL REFERENCES songs ON DELETE CASCADE,
    artist_id INTEGER NOT NULL REFERENCES artists ON DELETE CASCADE
);

CREATE TABLE song_producers
(
    id SERIAL PRIMARY KEY,
    song_id INTEGER NOT NULL REFERENCES songs ON DELETE CASCADE,
    producer_id INTEGER NOT NULL REFERENCES producers ON DELETE CASCADE
);

INSERT INTO artists
    (name)
VALUES
    ('Hanson'), --1
    ('Queen'), --2
    ('Mariah Cary'), --3
    ('Boyz II Men'), --4
    ('Lady Gaga'), --5
    ('Bradley Cooper'), --6
    ('Nickelback'), --7
    ('Jay Z'), --8
    ('Alicia Keys'), --9
    ('Katy Perry'), --10
    ('Juicy J'), --11
    ('Maroon 5'), --12
    ('Christina Aguilera'), --13
    ('Avril Lavigne'), --14
    ('Destiny''s Child'); --15

INSERT INTO producers
    (name)
VALUES
    ('Dust Brothers'), --1
    ('Stephen Lironi'), --2
    ('Roy Thomas Baker'), --3
    ('Walter Afanasieff'), --4
    ('Benjamin Rice'), --5
    ('Rick Parashar'), --6
    ('Al Shux'), --7
    ('Max Martin'), --8
    ('Cirkut'), --9
    ('Shellback'), --10
    ('Benny Blanco'), --11
    ('The Matrix'), --12
    ('Darkchild'); --13

INSERT INTO albums
    (title)
VALUES
    ('Middle of Nowhere'), --1
    ('A Night at the Opera'), --2
    ('Daydream'), --3
    ('A Star Is Born'), --4
    ('Silver Side Up'), --5
    ('The Blueprint 3'), --6
    ('Prism'), --7
    ('Hands All Over'), --8
    ('Let Go'), --9
    ('The Writing''s on the Wall'); --10


INSERT INTO songs
    (title, album_id, release_date, duration_in_seconds)
VALUES
    ('MMMBop', 1, '04-15-1997', 238), --1
    ('Bohemian Rhapsody', 2, '10-31-1975', 355), --2
    ('One Sweet Day', 3, '11-14-1995', 282), --3
    ('Shallow', 4, '09-27-2018', 216), --4
    ('How You Remind Me', 5, '08-21-2001', 223), --5
    ('New York State of Mind', 6,  '10-20-2009', 276), --6
    ('Dark Horse', 7, '12-17-2013', 215), --7
    ('Moves Like Jagger', 8, '06-21-2011', 201), --8
    ('Complicated', 9, '05-14-2002', 244), --9
    ('Say My Name', 10, '11-07-1999', 240); --10

INSERT INTO song_artists
    (song_id, artist_id)
VALUES
    (1, 1),
    (2, 2),
    (3, 3), 
    (3, 4),
    (4, 5),
    (4, 6),
    (5, 7),
    (6, 8),
    (6, 9),
    (7, 10),
    (7, 11),
    (8, 12),
    (8, 13),
    (9, 14),
    (10, 15);

INSERT INTO song_producers
    (song_id, producer_id)
VALUES
    (1, 1),
    (1, 2),
    (2, 3),
    (3, 4),
    (4, 5),
    (5, 6),
    (6, 7),
    (7, 8),
    (7, 9),
    (8, 10),
    (8, 11),
    (9, 12),
    (10, 13);


-- If you want the all the song, artist and producer names:

    -- SELECT s.title AS song_name, a.name AS artist_name, p.name AS producer_name
    -- FROM songs s
    -- JOIN song_artists sa ON s.id = sa.song_id
    -- JOIN artists a ON sa.artist_id = a.id
    -- JOIN song_producers sp ON s.id = sp.song_id
    -- JOIN producers p ON sp.producer_id = p.id;