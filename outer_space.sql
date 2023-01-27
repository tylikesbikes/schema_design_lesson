--original

-- from the terminal run:
-- psql < outer_space.sql

-- DROP DATABASE IF EXISTS outer_space;

-- CREATE DATABASE outer_space;

-- \c outer_space

-- CREATE TABLE planets
-- (
--   id SERIAL PRIMARY KEY,
--   name TEXT NOT NULL,
--   orbital_period_in_years FLOAT NOT NULL,
--   orbits_around TEXT NOT NULL,
--   galaxy TEXT NOT NULL,
--   moons TEXT[]
-- );

-- INSERT INTO planets
--   (name, orbital_period_in_years, orbits_around, galaxy, moons)
-- VALUES
--   ('Earth', 1.00, 'The Sun', 'Milky Way', '{"The Moon"}'),
--   ('Mars', 1.88, 'The Sun', 'Milky Way', '{"Phobos", "Deimos"}'),
--   ('Venus', 0.62, 'The Sun', 'Milky Way', '{}'),
--   ('Neptune', 164.8, 'The Sun', 'Milky Way', '{"Naiad", "Thalassa", "Despina", "Galatea", "Larissa", "S/2004 N 1", "Proteus", "Triton", "Nereid", "Halimede", "Sao", "Laomedeia", "Psamathe", "Neso"}'),
--   ('Proxima Centauri b', 0.03, 'Proxima Centauri', 'Milky Way', '{}'),
--   ('Gliese 876 b', 0.23, 'Gliese 876', 'Milky Way', '{}');


  --------------------------------------------------------------------

  --after redesign
  DROP DATABASE IF EXISTS outer_space;

  CREATE DATABASE outer_space;

  \c outer_space

    CREATE TABLE orbital_centers (
      id SERIAL PRIMARY KEY,
      name TEXT NOT NULL
    );

    INSERT INTO orbital_centers (
      name
    )
    VALUES 
      ('The Sun'),
      ('Proxima Centuari'),
      ('Gliese 876')
    ;

    CREATE TABLE galaxies (
      id SERIAL PRIMARY KEY,
      name TEXT NOT NULL
    );

    INSERT INTO galaxies (
      name
    )
    VALUES 
      ('Milky Way')
    ;

  CREATE TABLE moons (
    id SERIAL PRIMARY KEY NOT NULL,
    name TEXT NOT NULL
  );

  INSERT INTO moons (
    name
  )
  VALUES 
    ('The Moon'),
    ('Phobos'), 
    ('Deimos'),
    ('Naiad'), 
    ('Thalassa'), 
    ('Despina'), 
    ('Galatea'), 
    ('Larissa'), 
    ('S/2004 N 1'),
    ('Proteus'), 
    ('Triton'), 
    ('Nereid'), 
    ('Halimede'), 
    ('Sao'), 
    ('Laomedeia'), 
    ('Psamathe'), 
    ('Neso')
  ;

    CREATE TABLE planets (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    orbital_period_in_years FLOAT NOT NULL,
    orbital_center_id INTEGER REFERENCES orbital_centers,
    galaxy_id INTEGER NOT NULL REFERENCES galaxies,
    moons INTEGER
  );

  INSERT INTO planets
    (name, orbital_period_in_years,galaxy_id)
  VALUES
    ('Earth',1.00,1),
    ('Mars',1.88,1),
    ('Venus',0.62,1),
    ('Neptune', 164.8,1),
    ('Proxima Centauri b', 0.03,1),
    ('Gliese 876 b', 0.23,1);





