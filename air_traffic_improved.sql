DROP DATABASE IF EXISTS air_traffic;
CREATE DATABASE air_traffic;
\c air_traffic

CREATE TABLE people
(
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL
);

CREATE TABLE airline
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE countries
(
    id SERIAL PRIMARY KEY,
    country TEXT NOT NULL
);

CREATE TABLE location
(
    id SERIAL PRIMARY KEY,
    city TEXT NOT NULL,
    country_id INTEGER NOT NULL REFERENCES countries ON DELETE CASCADE
);

CREATE TABLE tickets
(
    id SERIAL PRIMARY KEY,
    seat TEXT NOT NULL,
    departure TIMESTAMP NOT NULL,
    arrival TIMESTAMP NOT NULL,
    person_id INTEGER NOT NULL REFERENCES people ON DELETE CASCADE,
    airline_id INTEGER NOT NULL REFERENCES airline ON DELETE CASCADE,
    from_location_id INTEGER NOT NULL REFERENCES location ON DELETE CASCADE,
    to_location_id INTEGER NOT NULL REFERENCES location ON DELETE CASCADE
);

INSERT INTO people
    (first_name, last_name)
VALUES
    ('Jennifer', 'Finch'),
    ('Thadeus', 'Gathercoal'),
    ('Sonja', 'Pauley'),
    ('Waneta', 'Skeleton'),
    ('Berkie', 'Wycliff'),
    ('Alvin', 'Leathes'),
    ('Cory', 'Squibbes');

INSERT INTO airline
    (name)
VALUES
    ('United'),
    ('British Airways'),
    ('Delta'),
    ('TUI Fly Belgium'),
    ('Air China'),
    ('American Airline'),
    ('Avianca Brasil');

INSERT INTO countries
    (country)
VALUES
    ('United States'),
    ('Japan'),
    ('United Kingdom'),
    ('Mexico'),
    ('France'),
    ('Morocco'),
    ('UAE'),
    ('China'),
    ('Brazil'),
    ('Chile');

INSERT INTO location
    (city, country_id)
VALUES
    ('Washington DC', 1),
    ('Seattle', 1),
    ('Tokyo', 2),
    ('London', 3),
    ('Los Angles', 1),
    ('Las Vegas', 1),
    ('Mexico City', 4),
    ('Paris', 5),
    ('Casablanca', 6),
    ('Dubai', 7),
    ('Beijing', 8),
    ('New York', 1),
    ('Charlotte', 1),
    ('Cedar Rapids', 1),
    ('Chicago', 1),
    ('New Orleans', 1),
    ('Sao Paolo', 9),
    ('Santiago', 10);

INSERT INTO tickets
    (seat, departure, arrival, person_id, airline_id, from_location_id, to_location_id)
VALUES
    ('33B', '2018-04-08 09:00:00', '2018-04-08 12:00:00', 1, 1, 1, 2),
    ('8A', '2018-12-19 12:45:00', '2018-12-19 16:15:00', 2, 2, 3, 4),
    ('12F', '2018-01-02 07:00:00', '2018-01-02 08:03:00', 3, 3, 5, 6),
    ('20A', '2018-04-15 16:50:00', '2018-04-15 21:00:00', 1, 3, 2, 7),
    ('23D', '2018-08-01 18:30:00', '2018-08-01 21:50:00', 4, 4, 8, 9),
    ('18C', '2018-10-31 01:15:00', '2018-10-31 12:55:00', 2, 5, 10, 11),
    ('9E', '2019-02-06 06:00:00', '2019-02-06 07:47:00', 5, 1, 12, 13),
    ('1A', '2018-12-22 14:42:00', '2018-12-22 15:56:00', 6, 6, 14, 15),
    ('32B', '2019-02-06 16:28:00', '2019-02-06 19:18:00', 5, 6, 13, 16),
    ('10D', '2019-01-20 19:30:00', '2019-01-20 22:45:00', 7, 7, 17, 18);