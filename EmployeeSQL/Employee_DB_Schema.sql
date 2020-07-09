-- 0. Delete Tables if rework is needed.
DROP Table IF Exists Departments;
DROP Table IF Exists Titles;
DROP Table IF Exists Employees;
DROP Table IF Exists Salaries;
DROP Table IF Exists Dept_emp;
DROP Table IF Exists Dept_manager;

-- 1. Create a Department table
CREATE TABLE Departments (
    dept_no CHAR(4) NOT NULL,
    dept_name VARCHAR(50) NOT NULL,
    PRIMARY KEY (dept_no)
);

-- 2. Create a Title Look-up Table
CREATE TABLE Titles (
	title_id CHAR(5) NOT Null,
	title VARCHAR(50) NOT NULL,
    PRIMARY KEY (title_id)
);

-- 3. Create a Employee DB as the main table for the employee_DB. Since the date fields are in the wrong foremat when importing, 
-- you will need to convert it a later time or figure out something else.
CREATE TABLE Employees (
    emp_no int NOT Null,
	emp_title_id CHAR(5) NOT Null,
	birth_date VARCHAR(10) NOT Null,
	first_name VARCHAR(50) NOT Null,
	last_name VARCHAR(50) NOT Null,
	sex CHAR(1) NOT Null,
	hire_date VARCHAR(10) NOT Null,
	PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_title_id) REFERENCES Titles (title_id)
);

-- 4. Create a Employee and Salary Cross Reference Table
CREATE TABLE Salaries (
	emp_no int NOT Null,
	salary bigint NOT NULL,
    PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_no) REFERENCES Employees(emp_no)
);

-- 5. Create a Department and Employee Cross Reference Table
CREATE TABLE Dept_emp (
    emp_no int NOT Null,
	dept_no CHAR(4) NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES Departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES Employees(emp_no)
);

-- 6. Create a Department Manager and Employee Cross Reference Table
CREATE TABLE Dept_manager (
    dept_no CHAR(4) NOT NULL,
	emp_no int NOT Null,
	FOREIGN KEY (emp_no) REFERENCES Employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES Departments(dept_no)
);

-- 7. Convert Text Dates to SQL Dates after data is loaded from CSV files. This code must be run after data is loaded.
-- Have not been able to get this to work the way I want. Dates are converted to 21st Century instead of 20th century.

--UPDATE Employees SET birth_date = TO_DATE(birth_date, 'MM/DD/YY');
--UPDATE Employees SET hire_date = TO_DATE(hire_date, 'MM/DD/YY');

-- 8. Make sure data is loaded the way you thought it would be.
Select * from Departments Limit 50;
Select * from Titles Limit 50;
Select * from Employees Limit 50;
Select * from Salaries Limit 50;
Select * from Dept_emp Limit 50;
Select * from Dept_manager Limit 50;

