-- #1

SELECT e.emp_no, e.last_name, e.first_name, e.gender, s.salary
FROM employees e
JOIN salaries s ON s.emp_no = e.emp_no
ORDER BY e.emp_no;

-- #2

SELECT emp_no, last_name, first_name
FROM employees
WHERE hire_date LIKE '1986%'
ORDER BY emp_no;

-- #3

SELECT 
	d.dept_no, d.dept_name,
	e.emp_no,
	e.last_name, e.first_name,
	de.from_date, de.to_date
FROM dept_manager dm,
	Departments d,
	employees e,
	dept_emp de
WHERE d.dept_no = dm.dept_no AND
	e.emp_no = dm.emp_no AND
	dm.emp_no = de.emp_no; -- this is all terrible but should work
	
-- #4

SELECT e.emp_no, e.first_name, e.last_name,
	d.dept_name
FROM employees e
JOIN dept_emp de ON de.emp_no = e.emp_no
JOIN departments d ON d.dept_no = de.dept_no
ORDER BY e.emp_no; 

-- #5

SELECT first_name, last_name
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- #6

SELECT *
FROM (SELECT e.emp_no, e.first_name, e.last_name,
	d.dept_name
FROM employees e
JOIN dept_emp de ON de.emp_no = e.emp_no
JOIN departments d ON d.dept_no = de.dept_no) AS merged
WHERE merged.dept_name = 'Sales';
	
-- #7

SELECT *
FROM (SELECT e.emp_no, e.first_name, e.last_name,
	d.dept_name
FROM employees e
JOIN dept_emp de ON de.emp_no = e.emp_no
JOIN departments d ON d.dept_no = de.dept_no) AS merged
WHERE merged.dept_name = 'Sales' OR merged.dept_name = 'Development';

-- #8

SELECT last_name, count(*)
FROM employees
GROUP BY last_name
ORDER BY count DESC;
