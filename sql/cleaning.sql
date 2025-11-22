/* ============================================
   DATA CLEANING SCRIPT
   Standardizes and prepares data for HR analytics
   ============================================ */

-- Inspect Base Tables
SELECT * FROM employee_demographics;
SELECT * FROM employee_salary;
SELECT * FROM parks_departments;

-- Remove Duplicate Employees Using ROW_NUMBER
WITH dem_dupes AS (
    SELECT *,
           ROW_NUMBER() OVER (PARTITION BY employee_id ORDER BY employee_id) AS rn
    FROM employee_demographics
)
DELETE FROM employee_demographics
WHERE employee_id IN (SELECT employee_id FROM dem_dupes WHERE rn > 1);

-- Standardize Gender Field
UPDATE employee_demographics
SET gender = CASE
                WHEN gender LIKE 'M%' THEN 'Male'
                WHEN gender LIKE 'F%' THEN 'Female'
                ELSE gender
            END;

-- Standardize Occupation Capitalization
UPDATE employee_salary
SET occupation = CONCAT(UCASE(LEFT(occupation,1)), SUBSTRING(occupation,2));

-- Fix Invalid Salary Values
UPDATE employee_salary
SET salary = NULL
WHERE salary < 0;

-- Verify Departments
SELECT sal.employee_id, sal.dept_id
FROM employee_salary sal
LEFT JOIN parks_departments pd
       ON sal.dept_id = pd.department_id
WHERE pd.department_id IS NULL AND sal.dept_id IS NOT NULL;
