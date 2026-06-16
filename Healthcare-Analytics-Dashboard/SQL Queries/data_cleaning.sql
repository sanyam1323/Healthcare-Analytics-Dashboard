-- Create Database
CREATE DATABASE healthcare;

-- View Dataset
SELECT *
FROM healthcare_dataset
LIMIT 10;

-- Check Table Structure
DESCRIBE healthcare_dataset;

-- Check Missing Values in Age
SELECT Age
FROM healthcare_dataset
WHERE Age IS NULL;

-- Check Missing Values in Billing Amount
SELECT billing_amount
FROM healthcare_dataset
WHERE billing_amount IS NULL;

-- Check Duplicate Records
SELECT patient_name,
COUNT(*)
FROM healthcare_dataset
GROUP BY patient_name
HAVING COUNT(*) > 1;

-- Rename Column
ALTER TABLE healthcare_dataset
RENAME COLUMN `Room Number` TO room_no;

-- Check Invalid Ages
SELECT age
FROM healthcare_dataset
WHERE age < 0 OR age > 120;

-- Check Invalid Billing Amounts
SELECT billing_amount
FROM healthcare_dataset
WHERE billing_amount < 0;
