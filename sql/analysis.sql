SELECT COUNT(*) AS n_patients FROM patients;


SELECT primary_icd10, COUNT(*) AS n
FROM patients
GROUP BY primary_icd10
ORDER BY n DESC;


SELECT patient_id, last_cpt, last_visit_dt
FROM patients
WHERE last_cpt LIKE '992%' AND last_visit_dt >= '2025-01-01'
ORDER BY last_visit_dt DESC;


SELECT
  patient_id,
  birth_date,
  last_visit_dt,
  CAST((julianday(date('now')) - julianday(birth_date)) / 365.25 AS INT) AS age_years
FROM patients
ORDER BY age_years DESC
LIMIT 5;


SELECT *
FROM patients
WHERE primary_icd10 = '' OR last_cpt = '';