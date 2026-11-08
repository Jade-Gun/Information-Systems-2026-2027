USE employees;

-- CREATE VIEW finance_managers AS
-- SELECT
--     e.first_name,
--     e.last_name
-- FROM employees e
-- JOIN dept_manager dm
--     ON e.emp_no = dm.emp_no
-- JOIN departments d
--     ON dm.dept_no = d.dept_no
-- WHERE d.dept_name = 'Finance';

SELECT DISTINCT
    e.emp_no,
    e.first_name,
    e.last_name
FROM employees e
JOIN finance_managers fm
    ON e.first_name = fm.first_name
    AND e.last_name = fm.last_name;


-- CREATE VIEW last_production_manager AS
-- SELECT MAX(dm.from_date) AS promotion_date
-- FROM dept_manager dm
-- JOIN departments d
--     ON dm.dept_no = d.dept_no
-- WHERE d.dept_name = 'Production';

SELECT DISTINCT
    e.emp_no,
    e.first_name,
    e.last_name,
    e.hire_date
FROM employees e
JOIN dept_emp de
    ON e.emp_no = de.emp_no
JOIN departments d
    ON de.dept_no = d.dept_no
CROSS JOIN last_production_manager lpm
WHERE d.dept_name = 'Production'
    AND e.hire_date > lpm.promotion_date;

-- CREATE VIEW department_salaries AS
-- SELECT
--     d.dept_name,
--     s.emp_no,
--     s.salary
-- FROM departments d
-- JOIN dept_emp de
--     ON d.dept_no = de.dept_no
-- JOIN salaries s
--     ON de.emp_no = s.emp_no;

SELECT
    dept_name,
    ROUND(AVG(salary), 2) AS average_salary
FROM department_salaries
GROUP BY dept_name
ORDER BY average_salary DESC;

CREATE VIEW engineer_salaries AS
SELECT
    t.title,
    s.emp_no,
    s.salary
FROM titles t
JOIN salaries s
    ON t.emp_no = s.emp_no
WHERE t.title LIKE '%Engineer%';

SELECT
    title,
    ROUND(AVG(salary), 2) AS average_salary
FROM engineer_salaries
GROUP BY title
ORDER BY average_salary DESC;
