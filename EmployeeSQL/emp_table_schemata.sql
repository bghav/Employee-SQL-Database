-- Create a table of titles
CREATE TABLE titles (
  title_id varchar NOT NULL PRIMARY KEY,
  title VARCHAR NOT NULL
);

-- Create a table of employees
CREATE TABLE employees (
  emp_no int NOT NULL PRIMARY KEY,
  title_id varchar NOT NULL,
  birth_date date NOT NULL,
  first_name varchar NOT NULL,
  last_name varchar NOT NULL,
  sex varchar NOT NULL,
  hire_date date NOT NULL,
  foreign key(title_id) references titles(title_id)
);
-- Create a table of departments
CREATE TABLE departments (
  dept_no varchar NOT NULL Primary Key,
  dept_name varchar NOT NULL
);
-- Create a table of Dept_emp
CREATE TABLE Dept_emp (
  emp_no int NOT NULL,
  dept_no varchar NOT NULL,
  foreign key(emp_no) references employees(emp_no),
  foreign key(dept_no) references departments(dept_no)
);

-- Create a table of salaries
CREATE TABLE salaries (
  emp_no int NOT NULL,
  salary int NOT NULL
);

-- Create a table of dept_manager
CREATE TABLE dept_manager (
  dept_no varchar NOT NULL,
  emp_no int NOT NULL,
  foreign key(emp_no) references employees(emp_no),
  foreign key(dept_no) references departments(dept_no)
);

