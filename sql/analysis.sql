/* ====================================================
   HR ANALYTICS — BUSINESS QUERIES
   Uses Employee, Salary & Department tables
   ==================================================== */

-- Average Salary by Department
SELECT 
    pd.department_name,
    AVG(salary) AS avg_salary,
    COUNT(*) AS employee_count
FROM employee_salary sal
LEFT JOIN parks_departments pd ON sal.dept_id = pd.department_id
GROUP BY pd.department_name
ORDER BY avg_salary DESC;

-- Salary Distribution by Gender
SELECT 
    dem.gender,
    AVG(salary) AS avg_salary,
    MIN(salary) AS min_salary,
    MAX(salary) AS max_salary
FROM employee_demographics dem
JOIN employee_salary sal ON dem.employee_id = sal.employee_id
GROUP BY dem.gender;

-- Employees Nearing Retirement
SELECT 
    employee_id,
    first_name,
    last_name,
    age,
    CASE
        WHEN age >= 60 THEN 'Retiring Now'
        WHEN age BETWEEN 50 AND 59 THEN 'Nearing Retirement'
        ELSE 'Active'
    END AS retirement_status
FROM employee_demographics
WHERE age >= 50;

-- Top 10 Highest Paid Employees
SELECT 
    sal.employee_id,
    dem.first_name,
    dem.last_name,
    sal.occupation,
    sal.salary
FROM employee_salary sal
JOIN employee_demographics dem ON sal.employee_id = dem.employee_id
ORDER BY salary DESC
LIMIT 10;

-- Department Headcount
SELECT 
    pd.department_name,
    COUNT(*) AS headcount
FROM employee_salary sal
JOIN parks_departments pd ON sal.dept_id = pd.department_id
GROUP BY pd.department_name
ORDER BY headcount DESC;
