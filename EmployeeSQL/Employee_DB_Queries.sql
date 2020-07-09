-- 1) Query to display Employee Number, Employee Last Name, Employee First Name, Employee Sex and Employee Salary
select e.emp_no, e.last_name, e.first_name, e.sex, s.salary
from employees as e
inner join salaries as s on e.emp_no=s.emp_no;

-- 2) Query to display Employee First Name, Employee Last Name and Hire Date of employees who were hired in 1986.
select e.first_name, e.last_name, e.hire_date
from employees as e
where hire_date like '%/86'
;

-- 3) Query to display the manager of each department with the following information: department number, department name,
--    the manager's employee number, last name, first name.
select dept.dept_no, departments.dept_name, e.emp_no, e.last_name, e.first_name
from dept_manager as dept
inner join departments on dept.dept_no = departments.dept_no
inner join employees as e on dept.emp_no = e.emp_no;

-- 4) Query to display the department of each employee with the following information: employee number, last name, first name,
--    and department name.
select e.emp_no, e.last_name, e.first_name, departments.dept_name
from employees as e
inner join dept_emp on e.emp_no=dept_emp.emp_no
inner join departments on dept_emp.dept_no = departments.dept_no
order by departments.dept_name, e.last_name, e.first_name;

-- 5) Query to display the first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
select e.first_name, e.last_name, e.sex
from employees as e
where first_name = 'Hercules' and last_name like 'B%'
order by e.last_name;

-- 6) Query to display all employees in the Sales department, including their employee number, last name, first name,
-- and department name.
select e.emp_no, e.last_name, e.first_name, departments.dept_name
from employees as e
inner join dept_emp on e.emp_no=dept_emp.emp_no
inner join departments on dept_emp.dept_no = departments.dept_no
where dept_name = 'Sales'
order by departments.dept_name, e.last_name, e.first_name;

-- 7) Query to display all employees in the Sales and Development departments, including their employee number, last name,
-- first name, and department name.
select e.emp_no, e.last_name, e.first_name, departments.dept_name
from employees as e
inner join dept_emp on e.emp_no=dept_emp.emp_no
inner join departments on dept_emp.dept_no = departments.dept_no
where dept_name = 'Sales' or dept_name = 'Development'
order by departments.dept_name, e.last_name, e.first_name;

-- 8) Query to display In descending order, list the frequency count of employee last names, i.e., how many employees
-- share each last name.
select e.last_name, Count(emp_no) as "Last Name Frequency"
from employees as e
group By last_name
order by "Last Name Frequency" desc;
