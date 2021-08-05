-- Deliverable 1
-- Join employees and titels into retirement_titles. Filter by birth_date.
SELECT  emp.emp_no, 
		emp.first_name, 
		emp.last_name,
		t.title,
		t.from_date,
		t.to_date
INTO retirement_titles
FROM employees AS emp
	INNER JOIN titles AS t
		ON emp.emp_no = t.emp_no
WHERE (emp.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no ASC;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO unique_titles
FROM retirement_titles AS rt
WHERE rt.to_date = '9999-01-01'
ORDER BY emp_no ASC, to_date DESC;

-- Create a table to hold the count of retiring employees from each department.
SELECT COUNT (title) AS "title counts", title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY "title counts" DESC;

-- Deliverable 2
-- Retrieve data from employees, dept_emp and titles tables. Distinct emp_no.
SELECT DISTINCT ON (emp.emp_no) emp.emp_no, 
		emp.first_name, 
		emp.last_name, 
		emp.birth_date,
		de.from_date,
		de.to_date,
		t.title
INTO mentor_eligi
FROM employees AS emp
    INNER JOIN dept_emp AS de
		ON emp.emp_no = de.emp_no
	INNER JOIN titles AS t
		ON emp.emp_no = t.emp_no
WHERE de.to_date = ('9999-01-01')
AND emp.birth_date BETWEEN '1965-01-01' AND '1965-12-31'
ORDER BY emp_no ASC;

-- Additional: Eligible title counts.
SELECT COUNT (med.title) AS "title_counts", title
FROM mentor_eligi_dept AS med
GROUP BY title
ORDER BY "title_counts" DESC;
		
-- Deliverable 3
-- Add dept_no to unique title
SELECT  ut.emp_no,
		ut.first_name,
		ut.last_name,
		ut.title,
		de.dept_no,
		de.to_date,
		d.dept_name
INTO unique_titles_dept
FROM unique_titles AS ut
	INNER JOIN dept_emp AS de
		ON ut.emp_no = de.emp_no
	INNER JOIN departments AS d
		ON de.dept_no = d.dept_no;

-- Remove duplicated rows caused by duplicated dept.
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title,
dept_name
INTO unique_dept
FROM unique_titles_dept AS utd
WHERE utd.to_date = '9999-01-01'
ORDER BY emp_no ASC;	

-- Additional Table 1. Create a table to hold the count of retiring employees from each department.
SELECT COUNT (ud.dept_name) AS "dept_counts", dept_name
INTO retiring_dept
FROM unique_dept AS ud
GROUP BY dept_name
ORDER BY "dept_counts" DESC;

-- Eligible employees with department name.
SELECT DISTINCT ON (emp.emp_no) emp.emp_no, 
		emp.first_name, 
		emp.last_name, 
		emp.birth_date,
		de.from_date,
		de.to_date,
		t.title,
		d.dept_name
INTO mentor_eligi_dept
FROM employees AS emp
    INNER JOIN dept_emp AS de
		ON emp.emp_no = de.emp_no
	INNER JOIN titles AS t
		ON emp.emp_no = t.emp_no
	INNER JOIN departments AS d
		ON de.dept_no = d.dept_no
WHERE de.to_date = ('9999-01-01')
AND emp.birth_date BETWEEN '1965-01-01' AND '1965-12-31'
ORDER BY emp_no ASC;

-- Additional Table 2. Eligible department counts.
SELECT COUNT (med.dept_name) AS "dept_counts", dept_name
INTO eligible_dept_counts
FROM mentor_eligi_dept AS med
GROUP BY dept_name
ORDER BY "dept_counts" DESC;

SELECT * FROM retiring_dept
SELECT * FROM eligible_dept_counts

