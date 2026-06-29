-- Group By Example

SELECT department,
       COUNT(*)
FROM employees
GROUP BY department;
