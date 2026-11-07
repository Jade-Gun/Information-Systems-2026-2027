USE employees;

SELECT * FROM employees;
SELECT * FROM departments;
SELECT first_name , last_name FROM employees;
SELECT dept_name FROM departments;

SELECT 
    e.first_name,
    e.last_name
FROM employees AS e
JOIN dept_emp AS de
    ON e.emp_no = de.emp_no
JOIN departments AS d
    ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';

SELECT
    e.first_name,
    e.last_name
FROM employees AS e 
JOIN dept_emp AS de
    ON e.emp_no = de.emp_no
JOIN departments AS d
    ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Finance' and e.gender = 'M';

SELECT e.emp_no, e.first_name, e.last_name, s.salary FROM salaries AS s
JOIN employees AS e
    ON s.emp_no = e.emp_no
JOIN dept_emp AS de
    ON e.emp_no = de.emp_no
JOIN departments AS d
    ON de.dept_no = d.dept_no
WHERE e.gender = 'F' AND d.dept_name = 'Marketing';

SELECT DISTINCT
    e.first_name,
    e.last_name
FROM employees AS e
JOIN dept_emp AS de
    ON e.emp_no = de.emp_no
JOIN dept_manager AS dm
    ON de.dept_no = dm.dept_no
JOIN employees AS m
    ON dm.emp_no = m.emp_no
WHERE e.last_name = m.last_name
    AND e.emp_no <> m.emp_no;

SELECT DISTINCT
    CONCAT(e.first_name, ' ', e.last_name) AS full_name
FROM employees AS e
JOIN dept_manager AS dm
    ON e.emp_no = dm.emp_no
WHERE DATE_ADD(dm.from_date, INTERVAL 2 YEAR) <= dm.to_date;

SELECT DISTINCT
    CONCAT(e.first_name, ' ', e.last_name) AS full_name
FROM employees AS e
JOIN salaries AS s
    ON e.emp_no = s.emp_no
WHERE s.salary > 100000;

SELECT DISTINCT
    d.dept_name
FROM departments AS d
JOIN dept_emp AS de
    ON d.dept_no = de.dept_no
JOIN employees AS e
    ON de.emp_no = e.emp_no
JOIN salaries AS s
    ON e.emp_no = s.emp_no
WHERE s.salary > 100000;

-- For last slide labwork 3
INSERT INTO departments (dept_no, dept_name)
VALUES
    ('d010', 'Research and Development'),
    ('d011', 'Marketing and Sales');

UPDATE dept_emp
SET dept_no = 'd010'
WHERE dept_no IN ('d005', 'd008');

UPDATE dept_emp
SET dept_no = 'd011'
WHERE dept_no IN ('d001', 'd007');

UPDATE dept_manager
SET dept_no = 'd010'
WHERE dept_no IN ('d005', 'd008');

UPDATE dept_manager
SET dept_no = 'd011'
WHERE dept_no IN ('d001', 'd007');

DELETE FROM departments
WHERE dept_no IN ('d001', 'd005', 'd007', 'd008');





















