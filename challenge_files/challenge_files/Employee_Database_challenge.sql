--Retirement titles table
SELECT
 emp_no,
 first_name,
 last_name,
 title,
 from_date,
 to_date
INTO retirement_titles
FROM employees
INNER JOIN titles USING (emp_no)
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY emp_no;

--test the table
SELECT * FROM retirement_titles;

--Unique Title table
SELECT DISTINCT ON (emp_no)
	emp_no,
	first_name,
	last_name,
	title
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no, to_date DESC;

--test the table
SELECT * FROM unique_titles;

--Mentorship eligibility table
SELECT DISTINCT ON (emp_no)
	emp_no,
	first_name,
	last_name,
	birth_date,
	de.from_date,
	de.to_date,
	title
INTO mentorship_eligibility
FROM employees e
INNER JOIN dept_emp de USING (emp_no)
INNER JOIN titles t USING (emp_no)
WHERE birth_date BETWEEN '1965-01-01' AND '1965-12-31'
AND de.to_date = '9999-01-01'
ORDER BY emp_no ASC;


-- test table
SELECT * FROM mentorship_eligibility;