/* ====================================================
   WINDOW FUNCTIONS — EMPLOYEE SALARY RANKING
   Demonstrates ROW_NUMBER, RANK, DENSE_RANK
   ==================================================== */

SELECT 
    dem.employee_id,
    dem.first_name,
    dem.last_name,
    dem.gender,
    sal.salary,

    ROW_NUMBER() OVER (PARTITION BY dem.gender ORDER BY sal.salary DESC) AS row_num,
    RANK()       OVER (PARTITION BY dem.gender ORDER BY sal.salary DESC) AS rank_num,
    DENSE_RANK() OVER (PARTITION BY dem.gender ORDER BY sal.salary DESC) AS dense_rank_num

FROM employee_demographics dem
JOIN employee_salary sal ON dem.employee_id = sal.employee_id
ORDER BY dem.gender, sal.salary DESC;
