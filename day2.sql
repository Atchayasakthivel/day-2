-- Creating a sample table
CREATE TABLE Employees (
    emp_id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    email TEXT,
    department TEXT DEFAULT 'General',
    salary REAL
);

-- Inserting full rows
INSERT INTO Employees (emp_id, name, email, department, salary)
VALUES
(1, 'Alice', 'alice@example.com', 'HR', 55000),
(2, 'Bob', 'bob@example.com', 'IT', 62000);

-- Inserting with NULL values
INSERT INTO Employees (emp_id, name, email, salary)
VALUES (3, 'Charlie', NULL, 50000);

-- Inserting using default department value
INSERT INTO Employees (emp_id, name, email, salary)
VALUES (4, 'David', 'david@example.com', 58000);

-- Inserting partial columns
INSERT INTO Employees (emp_id, name)
VALUES (5, 'Eva');

-- Attempting to insert NULL into NOT NULL field (will throw error if uncommented)
-- INSERT INTO Employees (emp_id, name) VALUES (6, NULL);

-- Updating a single row
UPDATE Employees
SET salary = 60000
WHERE emp_id = 3;

-- Updating multiple rows
UPDATE Employees
SET department = 'Operations'
WHERE department = 'General';

-- Deleting a row
DELETE FROM Employees
WHERE emp_id = 2;

-- Rolling back a deletion (use in a transaction-enabled DB)
-- BEGIN;
-- DELETE FROM Employees WHERE emp_id = 1;
-- ROLLBACK;

-- Insert using SELECT (duplicate Eva as new ID)
INSERT INTO Employees (emp_id, name, email, department, salary)
SELECT 6, name, email, department, salary FROM Employees WHERE emp_id = 5;

-- SELECT to check final data
SELECT * FROM Employees;
