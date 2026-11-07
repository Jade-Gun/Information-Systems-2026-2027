USE employees;

SELECT e.first_name, e.last_name, d.dept_name, AVG(s.salary) AS avg_salary
FROM salaries AS s
JOIN employees AS e
    ON s.emp_no = e.emp_no
JOIN dept_emp AS de
    ON e.emp_no = de.emp_no
JOIN departments AS d
    ON de.dept_no = d.dept_no
GROUP BY e.first_name, e.last_name, d.dept_name
LIMIT 10;

SELECT CONCAT(e.first_name, ' ', e.last_name) AS full_name, d.dept_name, COUNT(s.salary) AS total
FROM salaries AS s
JOIN employees AS e
    ON s.emp_no = e.emp_no
JOIN dept_emp AS de
    ON e.emp_no = de.emp_no
JOIN departments AS d
    ON de.dept_no = d.dept_no
GROUP BY e.first_name, e.last_name, d.dept_name
LIMIT 10;

SELECT d.dept_name, MAX(s.salary) AS max, MIN(s.salary) AS min, SUM(s.salary) AS total_salary
FROM salaries AS s 
JOIN employees AS e
    ON s.emp_no = e.emp_no
JOIN dept_emp AS de
    ON e.emp_no = de.emp_no
JOIN departments AS d
    ON de.dept_no = d.dept_no
GROUP BY d.dept_name;


SELECT d.dept_name, SUM(s.salary) AS total
FROM salaries AS s 
JOIN employees AS e
    ON s.emp_no = e.emp_no
JOIN dept_emp AS de
    ON e.emp_no = de.emp_no
JOIN departments AS d
    ON de.dept_no = d.dept_no
GROUP BY d.dept_name
HAVING total > 20000000000;


SELECT d.dept_name, SUM(s.salary) AS total
FROM salaries AS s 
JOIN employees AS e
    ON s.emp_no = e.emp_no
JOIN dept_emp AS de
    ON e.emp_no = de.emp_no
JOIN departments AS d
    ON de.dept_no = d.dept_no
WHERE e.gender = 'M'
GROUP BY d.dept_name;

SELECT
    d.dept_name,
    SUM(s.salary) AS total_salary
FROM departments AS d
JOIN dept_manager AS de
    ON d.dept_no = de.dept_no
JOIN salaries AS s
    ON de.emp_no = s.emp_no
GROUP BY d.dept_name
ORDER BY total_salary DESC;


