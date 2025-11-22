/* ===========================================
   SQL SKILLS SHOWCASE
   Demonstrates essential SQL capabilities
   =========================================== */

-- CASE Expression: Age Bracket
SELECT 
    first_name,
    last_name,
    age,
    CASE 
        WHEN age < 30 THEN 'Young'
        WHEN age BETWEEN 30 AND 50 THEN 'Mid-Career'
        ELSE 'Senior'
    END AS age_bracket
FROM employee_demographics;

-- Inner Join
SELECT 
    dem.employee_id,
    dem.first_name,
    dem.last_name,
    sal.occupation,
    sal.salary
FROM employee_demographics dem
JOIN employee_salary sal ON dem.employee_id = sal.employee_id;

-- Subquery Example (Salary > 60k)
SELECT *
FROM employee_demographics
WHERE employee_id IN (
    SELECT employee_id
    FROM employee_salary
    WHERE salary > 60000
);

-- String & Length Functions
SELECT 
    first_name,
    LENGTH(first_name) AS name_length,
    UPPER(first_name) AS uppercase_name
FROM employee_demographics;

-- Extract Birth Month
SELECT 
    birth_date,
    SUBSTRING(birth_date, 6, 2) AS birth_month
FROM employee_demographics;

-- UNION ALL Example
SELECT first_name, last_name FROM employee_demographics
UNION ALL
SELECT first_name, last_name FROM employee_salary;
