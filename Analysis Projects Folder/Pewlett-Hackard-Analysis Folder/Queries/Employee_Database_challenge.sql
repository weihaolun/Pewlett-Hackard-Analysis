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
WHERE emp.birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY emp_no ASC;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO unique_titles
FROM retirement_titles
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
	
	
	
	
	
	
	
	
	
	
