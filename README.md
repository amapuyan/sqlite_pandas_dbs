# sqlite_pandas_dbs
HHA 507 Assignment 2 (Lite, Split) - Single-Table Patient Roster in SQLite

## Overview
This project demonstrates how to use Python and SQLite to create and manage a simple patient database from a CSV file. It imports patients.csv, builds the schema, and loads the data into an SQLite database for analysis. The resulting database can be explored and queried using external tools such as DB Browser for SQLite for deeper insights.

## Steps 
1. Recreate repository with necessary files and make sure dependencies are installed within requirements.txt
```
health-sqlite-lite/
├─ data/
│  └─ patients.csv
├─ sql/
│  ├─ schema.sql
│  └─ analysis.sql
├─ src/
│  ├─ create_db.py         
│  └─ import_csv.py        
├─ clinic_simple.db        
├─ requirements.txt
└─ README.md
```
Requirements
```
pandas
SQLAlchemy
```
2. Run create_db.py
3. Run import_csv.py
4. Open data base in DB Browser
5. Execute the following queries
```sql
-- A) Row count
SELECT COUNT(*) AS n_patients FROM patients;

-- B) Top primary diagnoses by count
SELECT primary_icd10, COUNT(*) AS n
FROM patients
GROUP BY primary_icd10
ORDER BY n DESC;

-- C) Office-visit CPTs since Jan 1, 2025 (CPT codes starting with 992)
SELECT patient_id, last_cpt, last_visit_dt
FROM patients
WHERE last_cpt LIKE '992%' AND last_visit_dt >= '2025-01-01'
ORDER BY last_visit_dt DESC;

-- D) Age (approx) at last visit for the 5 oldest patients
SELECT
  patient_id,
  birth_date,
  last_visit_dt,
  CAST((julianday(date('now')) - julianday(birth_date)) / 365.25 AS INT) AS age_years
FROM patients
ORDER BY age_years DESC
LIMIT 5;

-- E) Quick data quality check: any blank codes?
SELECT *
FROM patients
WHERE primary_icd10 = '' OR last_cpt = '';
```

## Query Results
### Query A
  Shows the amount of patients (500)
 
 
