-- Drop table if exists
DROP TABLE titles;
DROP TABLE employees;
DROP TABLE salaries;
DROP TABLE departments;
DROP TABLE dept_manager;
DROP TABLE dept_emp;

--List the following details of each employee: employee number, last name, 
--first name, sex, and salary.

SELECT employees.emp_no,employees.last_name,employees.first_name,
employees.sex,salaries.salary
FROM employees
INNER JOIN salaries ON employees.emp_no = salaries.emp_no;

--List first name, last name, and hire date for employees 
--who were hired in 1986

SELECT employees.first_name,employees.last_name,employees.hire_date
FROM employees
Where hire_date BETWEEN '01/01/1986' AND '12/31/1986'

--List the manager of each department with the following information: 
--department number, department name, the manager's employee number, 
--last name, first name

SELECT  dm.dept_no,
        d.dept_name,
        dm.emp_no,
        e.last_name,
        e.first_name
FROM dept_manager AS dm
    INNER JOIN departments AS d
        ON (dm.dept_no = d.dept_no)
    INNER JOIN employees AS e
        ON (dm.emp_no = e.emp_no);

--List the department of each employee with the following 
--information: employee number, last name, first name, and department name
SELECT  e.emp_no,e.last_name,e.first_name,d.dept_name
FROM employees AS e
	INNER JOIN  dept_emp AS de
	   ON e.emp_no =de.emp_no
	INNER JOIN departments AS d
        ON (de.dept_no = d.dept_no);
		
--List first name, last name, and sex for employees whose first name
--is "Hercules" and last names begin with "B."

SELECT first_name, last_name,sex
FROM employees
WHERE first_name ='Hercules' AND last_name LIKE 'B%';

--List all employees in the Sales department, including their 
--employee number, last name, first name, and department name.

SELECT  e.emp_no,e.last_name,e.first_name,d.dept_name
FROM employees AS e
	INNER JOIN  dept_emp AS de
	   ON e.emp_no =de.emp_no
	INNER JOIN departments AS d
        ON (de.dept_no = d.dept_no)
		AND d.dept_name ='Sales';

--List all employees in the Sales and Development departments, 
--including their employee number, last name, first name, 
--and department name.

SELECT  e.emp_no,e.last_name,e.first_name,d.dept_name
FROM employees AS e
	INNER JOIN  dept_emp AS de
	   ON e.emp_no =de.emp_no
	INNER JOIN departments AS d
        ON (de.dept_no = d.dept_no)
		AND d.dept_name ='Sales' OR d.dept_name ='Development';
		
--In descending order, list the frequency count of employee last names,
--i.e., how many employees share each last name.

SELECT last_name, COUNT(last_name)
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;
