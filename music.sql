-- -- from the terminal run:
-- -- psql < music.sql

-- DROP DATABASE IF EXISTS music;

-- CREATE DATABASE music;

-- \c music

-- CREATE TABLE songs
-- (
--   id SERIAL PRIMARY KEY,
--   title TEXT NOT NULL,
--   duration_in_seconds INTEGER NOT NULL,
--   release_date DATE NOT NULL,
--   artists TEXT[] NOT NULL,
--   album TEXT NOT NULL,
--   producers TEXT[] NOT NULL
-- );

-- INSERT INTO songs
--   (title, duration_in_seconds, release_date, artists, album, producers)
-- VALUES
--   ('MMMBop', 238, '04-15-1997', '{"Hanson"}', 'Middle of Nowhere', '{"Dust Brothers", "Stephen Lironi"}'),
--   ('Bohemian Rhapsody', 355, '10-31-1975', '{"Queen"}', 'A Night at the Opera', '{"Roy Thomas Baker"}'),
--   ('One Sweet Day', 282, '11-14-1995', '{"Mariah Cary", "Boyz II Men"}', 'Daydream', '{"Walter Afanasieff"}'),
--   ('Shallow', 216, '09-27-2018', '{"Lady Gaga", "Bradley Cooper"}', 'A Star Is Born', '{"Benjamin Rice"}'),
--   ('How You Remind Me', 223, '08-21-2001', '{"Nickelback"}', 'Silver Side Up', '{"Rick Parashar"}'),
--   ('New York State of Mind', 276, '10-20-2009', '{"Jay Z", "Alicia Keys"}', 'The Blueprint 3', '{"Al Shux"}'),
--   ('Dark Horse', 215, '12-17-2013', '{"Katy Perry", "Juicy J"}', 'Prism', '{"Max Martin", "Cirkut"}'),
--   ('Moves Like Jagger', 201, '06-21-2011', '{"Maroon 5", "Christina Aguilera"}', 'Hands All Over', '{"Shellback", "Benny Blanco"}'),
--   ('Complicated', 244, '05-14-2002', '{"Avril Lavigne"}', 'Let Go', '{"The Matrix"}'),
--   ('Say My Name', 240, '11-07-1999', '{"Destiny''s Child"}', 'The Writing''s on the Wall', '{"Darkchild"}');


DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

--ARTISTS
CREATE TABLE artists (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

INSERT INTO artists (
  name
)
VALUES
('Destiny''s Child'),
('Maroon 5'),
('Christina Aguilera'),
('Hanson'),
('Avril Lavigne'),
('Katy Perry'),
('Juicy J'),
('Mariah Carey'),
('Boyz II Men'),
('Lady Gaga'),
('Bradley Cooper'),
('Nickelback'),
('Queen'),
('Jay Z'),
('Alicia Keys');

--ALBUMS
CREATE TABLE albums (
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL
);

INSERT INTO albums (title)
VALUES 
('Silver Side Up'),
('Prism'),
('Hands All Over'),
('A Night at the Opera'),
('Middle of Nowhere'),
('Let Go'),
('The Writing''s On the Wall'),
('A Star Is Born'),
('Daydream'),
('The Blueprint 3');


--PRODUCERS
CREATE TABLE producers (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

INSERT INTO producers (name)
VALUES 
('Walter Afanasieff'),
('Al Shux'),
('Max Martin'),
('Cirkut'),
('Shellback'),
('Benny Blanco'),
('The Matrix'),
('Rick Parashar'),
('Dust Brothers'),
('Stephen Lironi'),
('Darkchild'),
('Roy Thomas Baker'),
('Benjamin Rice');
--SONGS

CREATE TABLE songs (
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  duration_in_seconds TIME,
  release_date DATE,
  artist_ids INT[] NOT NULL,
  album_id INT NOT NULL,
  producer_ids INT[] NOT NULL
)



