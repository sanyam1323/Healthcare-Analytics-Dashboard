-- 1. Total Patients
SELECT COUNT(name) AS total_patient
FROM healthcare_dataset;

-- 2. Total Male Patients
SELECT COUNT(gender) AS total_male
FROM healthcare_dataset
WHERE gender = 'Male';

-- 3. Total Female Patients
SELECT COUNT(gender) AS total_female
FROM healthcare_dataset
WHERE gender = 'Female';

-- 4. Average Age of Patients
SELECT AVG(age) AS average_age
FROM healthcare_dataset;

-- 5. Most Common Medical Conditions
SELECT medical_condition,
       COUNT(medical_condition) AS total_count
FROM healthcare_dataset
GROUP BY medical_condition
ORDER BY total_count DESC;

-- 6. Medical Conditions Among Male Patients
SELECT medical_condition,
       COUNT(medical_condition) AS male_medical_condition
FROM healthcare_dataset
WHERE gender = 'Male'
GROUP BY medical_condition;

-- 7. Medical Conditions Among Female Patients
SELECT medical_condition,
       COUNT(medical_condition) AS female_medical_condition
FROM healthcare_dataset
WHERE gender = 'Female'
GROUP BY medical_condition;

-- 8. Top 10 Hospitals by Patient Count
SELECT hospital,
       COUNT(name) AS total_patients
FROM healthcare_dataset
GROUP BY hospital
ORDER BY total_patients DESC
LIMIT 10;

-- 9. Top 10 Doctors by Patient Count
SELECT doctor,
       COUNT(name) AS total_patients
FROM healthcare_dataset
GROUP BY doctor
ORDER BY total_patients DESC
LIMIT 10;

-- 10. Length of Stay for Patients
SELECT patient_name,
       date_of_admission,
       discharge_date,
       DATEDIFF(discharge_date, date_of_admission) AS length_of_stay_days
FROM healthcare_dataset;

-- 11. Average Length of Stay
SELECT AVG(DATEDIFF(discharge_date, date_of_admission))
       AS average_length_of_stay_days
FROM healthcare_dataset;

-- 12. Average Billing Amount
SELECT ROUND(AVG(billing_amount),2) AS average_billing_amount
FROM healthcare_dataset;

-- 13. Revenue by Medical Condition
SELECT medical_condition,
       ROUND(SUM(billing_amount),2) AS total_billing_amount
FROM healthcare_dataset
GROUP BY medical_condition
ORDER BY total_billing_amount DESC;

-- 14. Revenue by Insurance Provider
SELECT insurance_provider,
       ROUND(SUM(billing_amount),2) AS revenue_of_insurance_provider
FROM healthcare_dataset
GROUP BY insurance_provider
ORDER BY revenue_of_insurance_provider DESC;

-- 15. Top Insurance Providers by Patients
SELECT insurance_provider,
       COUNT(insurance_provider) AS total_patients
FROM healthcare_dataset
GROUP BY insurance_provider
ORDER BY total_patients DESC;