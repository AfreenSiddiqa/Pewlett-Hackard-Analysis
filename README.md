# Pewlett-Hackard-Analysis


##Overview of the analysis: 


Now that Bobby has proven his SQL chops, his manager has given both of you two more assignments: determine the number of retiring employees per title, and identify employees who are eligible to participate in a mentorship program. Then, you’ll write a report that summarizes your analysis and helps prepare Bobby’s manager for the “silver tsunami” as many current employees reach retirement age.

Deliverable 1: The Number of Retiring Employees by Title
Deliverable 2: The Employees Eligible for the Mentorship Program
Deliverable 3: A written report on the employee database analysis (README.md)


##Deliverable 1 Instructions
Using the ERD you created in this module as a reference and your knowledge of SQL queries, create a Retirement Titles table that holds all the titles of employees who were born between January 1, 1952 and December 31, 1955. Because some employees may have multiple titles in the database—for example, due to promotions—you’ll need to use the DISTINCT ON statement to create a table that contains the most recent title of each employee. Then, use the COUNT() function to create a table that has the number of retirement-age employees by most recent job title.


1Retrieve the emp_no, first_name, and last_name columns from the Employees table.
2Retrieve the title, from_date, and to_date columns from the Titles table.
3Create a new table using the INTO clause.
4Join both tables on the primary key.
5Filter the data on the birth_date column to retrieve the employees who were born between 1952 and 1955. Then, order by the employee number.
6Export the Retirement Titles table from the previous step as retirement_titles.csv 



SELECT COUNT(ut.emp_no),
ut.titles
INTO retiring_titles
FROM unique_titles as ut
GROUP BY titles 
ORDER BY COUNT(titles) DESC;
select * from retiring_titles;



Retrieve the employee number, first and last name, and title columns from the Retirement Titles table.
These columns will be in the new table that will hold the most recent title of each employee.
Use the DISTINCT ON statement to retrieve the first occurrence of the employee number for each set of rows defined by the ON () clause.

Create a Unique Titles table using the INTO clause.
Sort the Unique Titles table in ascending order by the employee number and descending order by the last date (i.e., to_date) of the most recent title.
SELECT DISTINCT ON ( emp_no ) emp_no,
first_name,
last_name,
titles

INTO unique_titles
FROM retirement_titles
ORDER BY emp_no, titles DESC;
select * from unique_titles;

Then write another query in the Employee_Database_challenge.sql file to retrieve the number of employees by their most recent job title who are about to retire.
First, retrieve the number of titles from the Unique Titles table.
Then, create a Retiring Titles table to hold the required information.
Group the table by title, then sort the count column in descending order.
Export the Retiring Titles table as retiring_titles.csv

SELECT COUNT(ut.emp_no),
ut.titles
INTO retiring_titles
FROM unique_titles as ut
GROUP BY titles 
ORDER BY COUNT(titles) DESC;
select * from retiring_titles;

##Deliverable 2

Using the ERD you created in this module as a reference and your knowledge of SQL queries, create a mentorship-eligibility table that holds the current employees who were born between January 1, 1965 and December 31, 1965.

Retrieve the emp_no, first_name, last_name, and birth_date columns from the Employees table.
Retrieve the from_date and to_date columns from the Department Employee table.
Retrieve the title column from the Titles table.
Use a DISTINCT ON statement to retrieve the first occurrence of the employee number for each set of rows defined by the ON () clause.
Create a new table using the INTO clause.
Join the Employees and the Department Employee tables on the primary key.
Join the Employees and the Titles tables on the primary key.
Filter the data on the to_date column to all the current employees, then filter the data on the birth_date columns to get all the employees whose birth dates are between January 1, 1965 and December 31, 1965.
Order the table by the employee number.
Export the Mentorship Eligibility table as mentorship_eligibilty.csv 

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
