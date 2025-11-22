/* ======================================================
   PARKS & RECREATION SQL PROJECT
   SCHEMA CREATION SCRIPT
   Author: Damilola Oni
   Purpose: Create clean, standardized database schema
   ====================================================== */

-- Create Employee Demographics Table
CREATE TABLE IF NOT EXISTS employee_demographics (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    age INT,
    gender VARCHAR(10),
    birth_date DATE
);

-- Create Employee Salary Table
CREATE TABLE IF NOT EXISTS employee_salary (
    employee_id INT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    occupation VARCHAR(50),
    salary INT,
    dept_id INT,
    FOREIGN KEY (employee_id) REFERENCES employee_demographics(employee_id)
);

-- Create Parks Department Table
CREATE TABLE IF NOT EXISTS parks_departments (
    department_id INT PRIMARY KEY AUTO_INCREMENT,
    department_name VARCHAR(50) NOT NULL
);
