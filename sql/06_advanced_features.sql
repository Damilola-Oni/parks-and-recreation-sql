/* ======================================================
   ADVANCED SQL FEATURES
   Stored Procedures, Triggers, Temporary Tables, Events
   ====================================================== */

-- Temporary Table Example
CREATE TEMPORARY TABLE salary_over_50k AS
SELECT * 
FROM employee_salary
WHERE salary >= 50000;

-- Stored Procedure: Large Salaries
DELIMITER $$
CREATE PROCEDURE get_large_salaries()
BEGIN
    SELECT * FROM employee_salary WHERE salary >= 50000;
END $$
DELIMITER ;

-- Parameterized Stored Procedure
DELIMITER $$
CREATE PROCEDURE get_salary_by_id(IN emp_id INT)
BEGIN
    SELECT salary
    FROM employee_salary
    WHERE employee_id = emp_id;
END $$
DELIMITER ;

-- Trigger: Insert into demographics when inserting salary
DELIMITER $$
CREATE TRIGGER trg_employee_insert
AFTER INSERT ON employee_salary
FOR EACH ROW
BEGIN
    INSERT INTO employee_demographics (employee_id, first_name, last_name)
    VALUES (NEW.employee_id, NEW.first_name, NEW.last_name);
END $$
DELIMITER ;

-- Event: Delete retirees every 30 seconds
DELIMITER $$
CREATE EVENT delete_retirees
ON SCHEDULE EVERY 30 SECOND
DO
BEGIN
    DELETE FROM employee_demographics
    WHERE age >= 60;
END $$
DELIMITER ;

SHOW VARIABLES LIKE 'event_scheduler';
