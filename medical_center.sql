DROP DATABASE IF EXISTS medical_center_db;
CREATE DATABASE medical_center_db;
\c medical_center_db;


CREATE TABLE doctors
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE patients
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE diagnosis
(
    id SERIAL PRIMARY KEY,
    patient_id INTEGER NOT NULL REFERENCES patients ON DELETE CASCADE,
    disease TEXT
);

CREATE TABLE doctor_patient
(
    id SERIAL PRIMARY KEY,
    doctor_id INTEGER NOT NULL REFERENCES doctors ON DELETE CASCADE,
    patient_id INTEGER NOT NULL REFERENCES patients ON DELETE CASCADE
);