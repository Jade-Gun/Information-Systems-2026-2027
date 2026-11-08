USE employees;

SELECT DISTINCT
    CONCAT(first_name, ' ', last_name) AS full_name
FROM employees
WHERE CONCAT(first_name, ' ', last_name) IN (
    SELECT CONCAT(e.first_name, ' ', e.last_name)
    FROM employees AS e
    JOIN dept_manager AS dm
        ON e.emp_no = dm.emp_no
    JOIN departments AS d
        ON dm.dept_no = d.dept_no
    WHERE d.dept_name = 'Finance'
);

SELECT e.emp_no, e.first_name, e.last_name, e.hire_date
FROM employees AS e
JOIN dept_emp AS de
    ON e.emp_no = de.emp_no
WHERE de.dept_no = (
    SELECT dept_no
    FROM departments
    WHERE dept_name = 'Production'
)
AND e.hire_date > (
    SELECT MAX(dm.from_date)
    FROM dept_manager AS dm
    WHERE dm.dept_no = (
        SELECT dept_no
        FROM departments
        WHERE dept_name = 'Production'
    )
);

SELECT d.dept_name,
       AVG(s.salary) AS average_salary
FROM departments AS d
JOIN dept_emp AS de
    ON d.dept_no = de.dept_no
JOIN salaries AS s
    ON de.emp_no = s.emp_no
GROUP BY d.dept_no, d.dept_name
ORDER BY average_salary DESC;

SELECT t.title,
       AVG(s.salary) AS average_salary
FROM titles AS t
JOIN salaries AS s
    ON t.emp_no = s.emp_no
WHERE t.title LIKE '%Engineer%'
GROUP BY t.title
ORDER BY average_salary DESC;


