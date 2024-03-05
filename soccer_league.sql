DROP DATABASE IF EXISTS soccer_league_db;
CREATE DATABASE soccer_league_db;
\c soccer_league_db;

CREATE TABLE teams
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    standing INTEGER NOT NULL
);

CREATE TABLE players
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    team_id INTEGER NOT NULL REFERENCES teams
);

CREATE TABLE matches
(
    id SERIAL PRIMARY KEY,
    team_1_id INTEGER NOT NULL REFERENCES teams,
    team_2_id INTEGER NOT NULL REFERENCES teams
);

CREATE TABLE goals
(
    id SERIAL PRIMARY KEY,
    match_id INTEGER NOT NULL REFERENCES matches,
    player INTEGER NOT NULL REFERENCES players
);

CREATE TABLE start_end_dates
(
    id SERIAL PRIMARY KEY,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    season TEXT NOT NULL
);

CREATE TABLE referees
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE referees_in_match
(
    id SERIAL PRIMARY KEY,
    referee_id INTEGER NOT NULL REFERENCES referees,
    match_id INTEGER NOT NULL REFERENCES matches
);