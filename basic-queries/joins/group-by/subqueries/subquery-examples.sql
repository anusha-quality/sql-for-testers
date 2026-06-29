-- Employees earning above average salary

SELECT employee_name
FROM employees
WHERE salary >
(
    SELECT AVG(salary)
    FROM employees
);
