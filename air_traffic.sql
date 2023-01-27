-- -- from the terminal run:
-- -- psql < air_traffic.sql

-- DROP DATABASE IF EXISTS air_traffic;

-- CREATE DATABASE air_traffic;

-- \c air_traffic

-- CREATE TABLE tickets
-- (
--   id SERIAL PRIMARY KEY,
--   first_name TEXT NOT NULL,       --CUSTOMER
--   last_name TEXT NOT NULL,        --CUSTOMER
--   seat TEXT NOT NULL,             --PLANE
--   departure TIMESTAMP NOT NULL,   --TRIP
--   arrival TIMESTAMP NOT NULL,     --TRIP
--   airline TEXT NOT NULL,          --TRIP  --AIRLINES
--   from_city TEXT NOT NULL,        --TRIP  --LOCATIONS
--   from_country TEXT NOT NULL,     --TRIP  --LOCATIONS
--   to_city TEXT NOT NULL,          --TRIP  --LOCATIONS
--   to_country TEXT NOT NULL        --TRIP  --LOCATIONS
-- );

-- INSERT INTO tickets
--   (first_name, last_name, seat, departure, arrival, airline, from_city, from_country, to_city, to_country)
-- VALUES
--   ('Jennifer', 'Finch', '33B', '2018-04-08 09:00:00', '2018-04-08 12:00:00', 'United', 'Washington DC', 'United States', 'Seattle', 'United States'),
--   ('Thadeus', 'Gathercoal', '8A', '2018-12-19 12:45:00', '2018-12-19 16:15:00', 'British Airways', 'Tokyo', 'Japan', 'London', 'United Kingdom'),
--   ('Sonja', 'Pauley', '12F', '2018-01-02 07:00:00', '2018-01-02 08:03:00', 'Delta', 'Los Angeles', 'United States', 'Las Vegas', 'United States'),
--   ('Jennifer', 'Finch', '20A', '2018-04-15 16:50:00', '2018-04-15 21:00:00', 'Delta', 'Seattle', 'United States', 'Mexico City', 'Mexico'),
--   ('Waneta', 'Skeleton', '23D', '2018-08-01 18:30:00', '2018-08-01 21:50:00', 'TUI Fly Belgium', 'Paris', 'France', 'Casablanca', 'Morocco'),
--   ('Thadeus', 'Gathercoal', '18C', '2018-10-31 01:15:00', '2018-10-31 12:55:00', 'Air China', 'Dubai', 'UAE', 'Beijing', 'China'),
--   ('Berkie', 'Wycliff', '9E', '2019-02-06 06:00:00', '2019-02-06 07:47:00', 'United', 'New York', 'United States', 'Charlotte', 'United States'),
--   ('Alvin', 'Leathes', '1A', '2018-12-22 14:42:00', '2018-12-22 15:56:00', 'American Airlines', 'Cedar Rapids', 'United States', 'Chicago', 'United States'),
--   ('Berkie', 'Wycliff', '32B', '2019-02-06 16:28:00', '2019-02-06 19:18:00', 'American Airlines', 'Charlotte', 'United States', 'New Orleans', 'United States'),
--   ('Cory', 'Squibbes', '10D', '2019-01-20 19:30:00', '2019-01-20 22:45:00', 'Avianca Brasil', 'Sao Paolo', 'Brazil', 'Santiago', 'Chile');

-------------------------------------------------------------------
DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

  --COUNTRIES
  CREATE TABLE countries (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
  );
  INSERT INTO countries (
    name
  )
  VALUES    
    ('United States'),
    ('Japan'),
    ('United Kingdom'),
    ('Mexico'),
    ('Morocco'),
    ('China'),
    ('Chile'),
    ('France'),
    ('UAE'),
    ('Brazil');


  --CITIES
  CREATE TABLE cities (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    country_id INT,
    CONSTRAINT country_id FOREIGN KEY(country_id) REFERENCES countries(id) ON DELETE CASCADE
  );
  INSERT INTO cities (name, country_id)
  VALUES 
  ('Cedar Rapids',1),
  ('Seattle',1),
  ('Los Angeles',1),
  ('Paris',8),
  ('New York',1),
  ('Sao Paolo', 10),
  ('Tokyo', 2),
  ('Dubai', 9),
  ('Charlotte',1),
  ('Washington DC',1),
  ('Las Vegas',1),
  ('Chicago',1),
  ('Casablanca',5),
  ('New Orleans',1),
  ('Santiago', 7),
  ('Mexico City', 4),
  ('London', 3),
  ('Beijing',6);
  
  --AIRLINES
  CREATE TABLE airlines (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
  );

  INSERT INTO airlines (name) 
  VALUES
  ('United'),
  ('Delta'),
  ('Avianca Brasil'),
  ('Air China'),
  ('TUI Fly Belgium'),
  ('American Airlines'),
  ('British Airways');


  --PASSENGERS
  CREATE TABLE passengers (
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL
  );

  INSERT INTO passengers (first_name, last_name)
  VALUES ('Waneta','Skeleton'),
  ('Jennifer','Finch'),
  ('Alvin','Leathes'),
  ('Berkie','Wycliff'),
  ('Thadeus','Gathercoal'),
  ('Cory','Squibbes'),
  ('Sonja','Pauley');
  
  CREATE TABLE tickets (
    id SERIAL PRIMARY KEY,
    passenger_id INT,
    
    seat TEXT NOT NULL,
    departure_time TIMESTAMP NOT NULL,
    arrival_time TIMESTAMP NOT NULL,
    airline_id INT,
    from_city_id INT,
    to_city_id INT,
    CONSTRAINT passenger_id FOREIGN KEY(passenger_id) REFERENCES passengers(id),
    CONSTRAINT airline_id FOREIGN KEY(airline_id) REFERENCES airlines(id),
    CONSTRAINT from_city_id FOREIGN KEY(from_city_id) REFERENCES cities(id),
    CONSTRAINT to_city_id FOREIGN KEY(to_city_id) REFERENCES cities(id)
  );

  INSERT INTO tickets (passenger_id, seat, departure_time, arrival_time, airline_id, from_city_id, to_city_id)
  VALUES
  (2,'33B','2018-04-08 09:00:00', '2018-04-08 12:00:00', 1, 10, 2);