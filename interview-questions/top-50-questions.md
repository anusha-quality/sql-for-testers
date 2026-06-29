# Top 50 SQL Interview Questions for QA Engineers

## 1. What is the difference between WHERE and HAVING?

**Answer:**

* `WHERE` filters rows before grouping.
* `HAVING` filters groups after `GROUP BY`.

Example:

```sql
SELECT department, COUNT(*)
FROM employees
GROUP BY department
HAVING COUNT(*) > 5;
```

---

## 2. What is an INNER JOIN?

**Answer:**
An INNER JOIN returns only the records that have matching values in both tables.

```sql
SELECT e.name, d.department_name
FROM employees e
INNER JOIN departments d
ON e.department_id = d.department_id;
```

---

## 3. What is a LEFT JOIN?

**Answer:**
A LEFT JOIN returns all records from the left table and matching records from the right table. If no match exists, NULL values are returned.

---

## 4. What is a PRIMARY KEY?

**Answer:**
A PRIMARY KEY uniquely identifies each row in a table and cannot contain NULL values.

Example:

```sql
employee_id INT PRIMARY KEY
```

---

## 5. What is a FOREIGN KEY?

**Answer:**
A FOREIGN KEY creates a relationship between two tables by referencing the PRIMARY KEY of another table.

---

## 6. What is the difference between DELETE, TRUNCATE, and DROP?

**Answer:**

* `DELETE` removes selected rows.
* `TRUNCATE` removes all rows but keeps the table structure.
* `DROP` deletes the entire table, including its structure.

---

## 7. What is normalization?

**Answer:**
Normalization is the process of organizing data to reduce redundancy and improve data integrity.

Common normal forms:

* 1NF
* 2NF
* 3NF
* BCNF

---

## 8. What is denormalization?

**Answer:**
Denormalization combines tables to improve read performance, even though it introduces redundancy.

---

## 9. What is a subquery?

**Answer:**
A subquery is a query inside another query.

Example:

```sql
SELECT name
FROM employees
WHERE salary >
(
    SELECT AVG(salary)
    FROM employees
);
```

---

## 10. What is the difference between UNION and UNION ALL?

**Answer:**

* `UNION` removes duplicate rows.
* `UNION ALL` keeps all rows, including duplicates.

`UNION ALL` is generally faster because it doesn't perform duplicate checks.
## 11. What is an INDEX in SQL?

**Answer:**
An index improves the speed of data retrieval operations on a table.

Example:

```sql
CREATE INDEX idx_employee_name
ON employees(employee_name);
```

Indexes increase query performance but slightly slow down INSERT, UPDATE, and DELETE operations.

---

## 12. What is a VIEW?

**Answer:**
A view is a virtual table created from one or more tables.

Example:

```sql
CREATE VIEW active_customers AS
SELECT *
FROM customers
WHERE status = 'Active';
```

Views simplify complex queries and improve security.

---

## 13. What is a STORED PROCEDURE?

**Answer:**
A stored procedure is a collection of SQL statements stored in the database and executed as a single unit.

Benefits:

* Reusability
* Better performance
* Improved security

---

## 14. What is a TRIGGER?

**Answer:**
A trigger is automatically executed when a database event occurs.

Events include:

* INSERT
* UPDATE
* DELETE

Example use case:
Audit logging whenever customer details are updated.

---

## 15. What are ACID properties?

**Answer:**

**A - Atomicity**
A transaction is completed entirely or not at all.

**C - Consistency**
The database remains in a valid state.

**I - Isolation**
Transactions do not interfere with each other.

**D - Durability**
Committed data remains even after system failures.

---

## 16. What is a TRANSACTION?

**Answer:**
A transaction is a sequence of operations performed as a single unit of work.

Example:

```sql
BEGIN TRANSACTION;

UPDATE accounts
SET balance = balance - 1000
WHERE account_id = 1;

UPDATE accounts
SET balance = balance + 1000
WHERE account_id = 2;

COMMIT;
```

---

## 17. What is COMMIT and ROLLBACK?

**Answer:**

**COMMIT**
Saves all changes permanently.

```sql
COMMIT;
```

**ROLLBACK**
Reverts changes if an error occurs.

```sql
ROLLBACK;
```

---

## 18. What is the difference between CHAR and VARCHAR?

**Answer:**

| CHAR               | VARCHAR                 |
| ------------------ | ----------------------- |
| Fixed length       | Variable length         |
| Faster retrieval   | Saves storage           |
| Pads unused spaces | Stores only actual data |

Example:

```sql
name CHAR(20)
email VARCHAR(100)
```

---

## 19. What is the difference between COUNT(*) and COUNT(column_name)?

**Answer:**

```sql
COUNT(*)
```

Counts all rows.

```sql
COUNT(email)
```

Counts only rows where email is NOT NULL.

---

## 20. How is SQL used in software testing?

**Answer:**

QA engineers use SQL to:

* Validate backend data.
* Verify API responses against the database.
* Check data integrity after UI actions.
* Write test data setup scripts.
* Validate ETL processes.
* Perform database testing.

Example:

```sql
SELECT *
FROM orders
WHERE order_id = 1001;
```

This helps confirm that an order created through the UI is correctly stored in the database.

## 21. What is the difference between a Clustered and a Non-Clustered Index?

**Answer:**

| Clustered Index                       | Non-Clustered Index              |
| ------------------------------------- | -------------------------------- |
| Sorts and stores the actual data rows | Stores pointers to the data rows |
| Only one per table                    | Multiple can exist per table     |
| Faster for range queries              | Better for specific lookups      |

Example:

```sql
CREATE CLUSTERED INDEX idx_emp_id
ON employees(employee_id);
```

---

## 22. What is a SELF JOIN?

**Answer:**

A SELF JOIN joins a table with itself.

Example:

```sql
SELECT e.employee_name,
       m.employee_name AS manager_name
FROM employees e
LEFT JOIN employees m
ON e.manager_id = m.employee_id;
```

This is useful for hierarchical relationships.

---

## 23. What is a FULL OUTER JOIN?

**Answer:**

A FULL OUTER JOIN returns:

* All matching records from both tables.
* Non-matching rows from both tables with NULL values.

Example:

```sql
SELECT *
FROM customers
FULL OUTER JOIN orders
ON customers.customer_id = orders.customer_id;
```

---

## 24. What are SQL Constraints?

**Answer:**

Constraints enforce rules on data.

Common constraints:

* PRIMARY KEY
* FOREIGN KEY
* UNIQUE
* NOT NULL
* CHECK
* DEFAULT

Example:

```sql
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    email VARCHAR(100) UNIQUE,
    age INT CHECK (age >= 18)
);
```

---

## 25. What is the NOT NULL Constraint?

**Answer:**

NOT NULL ensures a column cannot contain NULL values.

Example:

```sql
name VARCHAR(50) NOT NULL
```

This guarantees that every record has a value for that field.

---

## 26. What is the UNIQUE Constraint?

**Answer:**

UNIQUE prevents duplicate values in a column.

Example:

```sql
email VARCHAR(100) UNIQUE
```

No two users can have the same email address.

---

## 27. What is the difference between NULL and an Empty String?

**Answer:**

| NULL                    | Empty String ('')        |
| ----------------------- | ------------------------ |
| Represents missing data | Represents no characters |
| Unknown value           | Known but blank          |
| Cannot use = comparison | Can use = ''             |

Example:

```sql
SELECT *
FROM users
WHERE email IS NULL;
```

---

## 28. What is COALESCE in SQL?

**Answer:**

COALESCE returns the first non-NULL value.

Example:

```sql
SELECT COALESCE(phone_number, 'Not Available')
FROM customers;
```

If `phone_number` is NULL, it returns `Not Available`.

---

## 29. What is the difference between EXISTS and IN?

**Answer:**

**IN**
Checks against a list of values.

```sql
SELECT *
FROM employees
WHERE department_id IN (1,2,3);
```

**EXISTS**
Checks whether a subquery returns any rows.

```sql
SELECT *
FROM customers c
WHERE EXISTS (
    SELECT 1
    FROM orders o
    WHERE o.customer_id = c.customer_id
);
```

EXISTS is generally better for large datasets.

---

## 30. What is a Common Table Expression (CTE)?

**Answer:**

A CTE is a temporary named result set used within a query.

Example:

```sql
WITH HighSalaryEmployees AS (
    SELECT *
    FROM employees
    WHERE salary > 100000
)
SELECT *
FROM HighSalaryEmployees;
```

Benefits:

* Improves readability.
* Simplifies complex queries.
* Supports recursive operations.
## 31. What are Window Functions in SQL?

**Answer:**

Window functions perform calculations across a set of rows related to the current row without grouping the result.

Common window functions:

* ROW_NUMBER()
* RANK()
* DENSE_RANK()
* LEAD()
* LAG()

Example:

```sql
SELECT employee_name,
       salary,
       ROW_NUMBER() OVER (ORDER BY salary DESC) AS row_num
FROM employees;
```

---

## 32. What is ROW_NUMBER()?

**Answer:**

ROW_NUMBER() assigns a unique sequential number to each row.

Example:

```sql
SELECT employee_name,
       ROW_NUMBER() OVER (ORDER BY employee_id) AS row_no
FROM employees;
```

Output:

```text
1  John
2  Sarah
3  Mike
```

---

## 33. What is RANK()?

**Answer:**

RANK() assigns ranks with gaps when there are duplicate values.

Example:

```sql
SELECT employee_name,
       salary,
       RANK() OVER (ORDER BY salary DESC) AS rank_no
FROM employees;
```

Example output:

```text
John  100000  1
Mike  90000   2
Sara  90000   2
Tom   85000   4
```

Notice that rank 3 is skipped.

---

## 34. What is DENSE_RANK()?

**Answer:**

DENSE_RANK() assigns ranks without gaps.

Example:

```sql
SELECT employee_name,
       salary,
       DENSE_RANK() OVER (ORDER BY salary DESC)
FROM employees;
```

Output:

```text
John  1
Mike  2
Sara  2
Tom   3
```

---

## 35. What is the CASE Statement in SQL?

**Answer:**

CASE works like an IF-ELSE condition.

Example:

```sql
SELECT employee_name,
       salary,
       CASE
           WHEN salary > 100000 THEN 'High'
           WHEN salary > 50000 THEN 'Medium'
           ELSE 'Low'
       END AS salary_category
FROM employees;
```

---

## 36. What is a Temporary Table?

**Answer:**

Temporary tables store data temporarily during a session.

Example:

```sql
CREATE TEMP TABLE temp_employees (
    id INT,
    name VARCHAR(50)
);
```

They are automatically deleted after the session ends.

---

## 37. What is the difference between a View and a Materialized View?

**Answer:**

| View                       | Materialized View    |
| -------------------------- | -------------------- |
| Stores only SQL query      | Stores actual data   |
| Always fetches latest data | Needs refresh        |
| Less storage               | Uses more storage    |
| Slower for large reports   | Faster for reporting |

---

## 38. What is the difference between a Stored Procedure and a Function?

**Answer:**

| Stored Procedure           | Function                          |
| -------------------------- | --------------------------------- |
| Can return multiple values | Returns one value                 |
| Can modify data            | Usually used in SELECT statements |
| Executed using EXEC        | Called like a normal function     |

Example:

```sql
EXEC GetEmployeeDetails;
```

Function example:

```sql
SELECT CalculateBonus(50000);
```

---

## 39. What is a Deadlock?

**Answer:**

A deadlock occurs when two transactions wait for each other to release resources.

Example:

* Transaction A locks Table X and waits for Table Y.
* Transaction B locks Table Y and waits for Table X.

Neither transaction can continue.

Databases automatically detect and resolve deadlocks.

---

## 40. What are Locks in SQL?

**Answer:**

Locks prevent multiple users from modifying data simultaneously.

Common lock types:

* Shared Lock (Read)
* Exclusive Lock (Write)
* Update Lock

Locks ensure data consistency and integrity during transactions.
## 41. What are CRUD Operations in SQL?

**Answer:**

CRUD stands for:

* **Create** → INSERT
* **Read** → SELECT
* **Update** → UPDATE
* **Delete** → DELETE

Examples:

```sql
INSERT INTO employees VALUES (1, 'John');

SELECT * FROM employees;

UPDATE employees
SET salary = 80000
WHERE employee_id = 1;

DELETE FROM employees
WHERE employee_id = 1;
```

---

## 42. How do QA Engineers use SQL for Database Testing?

**Answer:**

QA engineers use SQL to:

* Validate data stored through UI actions.
* Verify API responses against the database.
* Check data consistency across systems.
* Validate business rules.
* Perform ETL and migration testing.
* Prepare test data.

Example:

```sql
SELECT *
FROM orders
WHERE order_id = 1001;
```

---

## 43. What is ETL Testing?

**Answer:**

ETL stands for:

* **Extract**
* **Transform**
* **Load**

ETL testing verifies that data is:

* Correctly extracted from source systems.
* Properly transformed according to business rules.
* Successfully loaded into the target database.

QA validations include:

* Row counts
* Duplicate checks
* Data integrity
* Null validations

---

## 44. What is Data Migration Testing?

**Answer:**

Data migration testing ensures data moves accurately from one system to another.

Checks include:

* Total records migrated.
* Missing or duplicate data.
* Field mappings.
* Data type validation.
* Business rule compliance.

Example:

```sql
SELECT COUNT(*)
FROM old_customers;

SELECT COUNT(*)
FROM new_customers;
```

Both counts should match.

---

## 45. How do you validate API data using SQL?

**Answer:**

After receiving an API response, QA engineers compare it with database records.

Example:

API returns:

```json
{
  "orderId": 5001,
  "status": "Delivered"
}
```

SQL validation:

```sql
SELECT status
FROM orders
WHERE order_id = 5001;
```

Both values should match.

---

## 46. How do you identify duplicate records in SQL?

**Answer:**

Use GROUP BY and HAVING.

Example:

```sql
SELECT email,
       COUNT(*)
FROM customers
GROUP BY email
HAVING COUNT(*) > 1;
```

This returns duplicate email addresses.

---

## 47. How do you find NULL values in a table?

**Answer:**

Use IS NULL.

Example:

```sql
SELECT *
FROM users
WHERE phone_number IS NULL;
```

To find non-null values:

```sql
SELECT *
FROM users
WHERE phone_number IS NOT NULL;
```

---

## 48. How do you retrieve the second highest salary?

**Answer:**

Example:

```sql
SELECT MAX(salary)
FROM employees
WHERE salary <
(
    SELECT MAX(salary)
    FROM employees
);
```

Alternative solutions include DENSE_RANK() and LIMIT/OFFSET.

---

## 49. How do you delete duplicate rows?

**Answer:**

Example using ROW_NUMBER():

```sql
WITH DuplicateRows AS (
    SELECT *,
           ROW_NUMBER() OVER (
               PARTITION BY email
               ORDER BY customer_id
           ) AS rn
    FROM customers
)

DELETE
FROM DuplicateRows
WHERE rn > 1;
```

This keeps the first record and removes duplicates.

---

## 50. What are the most important SQL skills for a QA Engineer?

**Answer:**

A QA engineer should know:

✅ SELECT statements

✅ WHERE, ORDER BY, GROUP BY

✅ INNER, LEFT, and SELF JOINS

✅ Subqueries

✅ Aggregate functions

✅ Constraints

✅ Transactions and ACID properties

✅ CRUD operations

✅ Database testing techniques

✅ ETL and migration validation

✅ API-to-database verification

Mastering these topics is typically sufficient for Senior QA and product-based company interviews.
