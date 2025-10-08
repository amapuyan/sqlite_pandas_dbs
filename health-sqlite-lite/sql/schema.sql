DROP TABLE IF EXISTS patients;

CREATE TABLE patients (
    patient_id TEXT PRIMARY KEY, 
    birth_date DATE NOT NULL,
    primary_icd10 TEXT NOT NULL,
    last_cpt TEXT NOT NULL,
    last_visit_dt DATE NOT NULL
);