-- Create titles table
CREATE TABLE titles (
  title_id VARCHAR(5) PRIMARY KEY NOT NULL,
  title VARCHAR(30)

);

-- Query all fields from the table
SELECT *
FROM titles;

-- Create employees table
CREATE TABLE employees (
  emp_no SERIAL PRIMARY KEY NOT NULL,
  emp_title_id VARCHAR(50),
  birth_date date,
  first_name VARCHAR(50),
  last_name VARCHAR(30),
  sex CHAR,
  hire_date date,
  FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

-- Query all fields from the table
SELECT *
FROM employees;

-- Create departments table
CREATE TABLE departments (
  dept_no VARCHAR(4) PRIMARY KEY NOT NULL,
  dept_name VARCHAR(25)
);

-- Query all fields from the table
SELECT *
FROM departments;

-- Create dept_emp table
CREATE TABLE dept_emp (
  emp_no SERIAL,
  dept_no VARCHAR(4),
  FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no)

);

-- Query all fields from the table
SELECT *
FROM dept_emp;

-- Create dept_manager table
CREATE TABLE dept_manager (
  dept_no VARCHAR(4),
  emp_no SERIAL,
  FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no)

);

-- Query all fields from the table
SELECT *
FROM dept_manager;



-- Create salaries table
CREATE TABLE salaries (
  emp_no SERIAL PRIMARY KEY NOT NULL,
  salary INT,
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no)

);

-- Query all fields from the table
SELECT *
FROM salaries;


-- Perform an INNER JOIN on the employee and salaries
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
LEFT JOIN salaries ON
employees.emp_no=salaries.emp_no;
