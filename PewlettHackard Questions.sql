--Data Verification----------------------------------------
SELECT * FROM departments;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM titles;

--Data Analysis---------------------------------------------
--1
SELECT employees.emp_no     AS "Employee Number", 
	   employees.last_name  AS "Last Name",
	   employees.first_name AS "First Name",
	   employees.gender     AS "Gender",
	   salaries.salary      AS "Salary"
FROM employees 
LEFT JOIN salaries ON employees.emp_no = salaries.emp_no;
--ORDER BY salaries.salary desc


--2
SELECT emp_no     AS "Employee Number",
	   first_name AS "First Name",
	   last_name  AS "Last Name",
	   hire_date  AS "Hire Date"
FROM employees
WHERE CAST(hire_date AS varchar(4))LIKE '1986%' ORDER BY hire_date;


--3
SELECT departments.dept_no    AS "Department Number",
	   departments.dept_name  AS "Department Name",
	   dept_manager.emp_no    AS "Employee Number",
	   employees.last_name    AS "Last Name",
	   employees.first_name   AS "First Name",
	   dept_manager.from_date AS "From Date",
	   dept_manager.to_date   AS "To Date"
FROM departments
JOIN dept_manager ON departments.dept_no = dept_manager.dept_no
JOIN employees ON dept_manager.emp_no = employees.emp_no;


--4
SELECT employees.emp_no       AS "Employee Number", 
	   employees.last_name    AS "Last Name",
	   employees.first_name   AS "First Name",
	   departments.dept_name  AS "Department Name"
FROM dept_manager
JOIN employees ON dept_manager.emp_no = employees.emp_no
JOIN departments ON dept_manager.dept_no = departments.dept_no;
 
 
--5
SELECT emp_no     AS "Employee Number",
 	   first_name AS "First Name",
	   last_name  AS "Last Name"
FROM employees
WHERE first_name = 'Hercules' 
AND   last_name like 'B%'
ORDER BY last_name;

--6
SELECT employees.emp_no       AS "Employee Number", 
	   employees.last_name    AS "Last Name",
	   employees.first_name   AS "First Name",
	   departments.dept_name  AS "Department Name"
FROM dept_manager
JOIN employees ON dept_manager.emp_no = employees.emp_no
JOIN departments ON dept_manager.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales';
 

--7
SELECT employees.emp_no       AS "Employee Number", 
	   employees.last_name    AS "Last Name",
	   employees.first_name   AS "First Name",
	   departments.dept_name  AS "Department Name"
FROM dept_manager
JOIN employees ON dept_manager.emp_no = employees.emp_no
JOIN departments ON dept_manager.dept_no = departments.dept_no
WHERE departments.dept_name in ('Sales','Development');

--8
SELECT COUNT(last_name) AS "Frequency",
             last_name  AS "Last Name"
FROM employees
GROUP BY "Last Name"
ORDER BY "Frequency" DESC;



--Bonus--
SELECT 
	   Avg(salaries.salary) AS "Salary",
	   titles.title         AS "Title"
FROM employees 
JOIN salaries ON employees.emp_no = salaries.emp_no
JOIN titles on employees.emp_no = titles.emp_no
group by "Title"

--Boss Comment--
SELECT emp_no     AS "Employee Number",
 	   first_name AS "First Name",
	   last_name  AS "Last Name"
FROM employees
WHERE emp_no = 499942
 

 