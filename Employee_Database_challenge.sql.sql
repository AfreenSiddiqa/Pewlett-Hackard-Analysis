--Deliverable 1
-- Use Dictinct with Orderby to remove duplicate rows
SELECT e.emp_no,
       e.first_name,
       e.last_name,
       t.titles,
       t.from_date,
       t.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
order by e.emp_no;

select * from retirement_titles;
select * from titles;

SELECT DISTINCT ON ( emp_no ) emp_no,
first_name,
last_name,
titles

INTO unique_titles
FROM retirement_titles
ORDER BY emp_no, titles DESC;
select * from unique_titles;

--retrieve the number of employees by their most recent job title who are about to retire.
SELECT COUNT(ut.emp_no),
ut.titles
INTO retiring_titles
FROM unique_titles as ut
GROUP BY titles 
ORDER BY COUNT(titles) DESC;
select * from retiring_titles;

--Deliverable 2 
-- create a Mentorship Eligibility table that holds the employees who are eligible to participate in a mentorship program.

SELECT DISTINCT ON(e.emp_no) e.emp_no, 
    e.first_name, 
    e.last_name, 
    e.birth_date,
    de.from_date,
    de.to_date,
    t.titles
INTO mentorship_eligibilty
FROM employees as e
Left outer Join dept_emp as de
ON (e.emp_no = de.emp_no)
Left outer Join titles as t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no;
select * from mentorship_eligibilty;



