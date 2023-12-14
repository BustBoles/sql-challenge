
-- creating table for departmnets csv table
CREATE TABLE departments(
	dept_no VARCHAR(10) NOT NULL,
	dept_name VARCHAR(30) NOT NULL,
	CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_no")
);

-- creating table for demp_emp csv table
CREATE TABLE dept_emp(
    emp_no INTEGER   NOT NULL,
    dept_no VARCHAR(10)   NOT NULL
);

-- creating table for dept_managers
CREATE TABLE dept_managers(
    dept_no VARCHAR(10)   NOT NULL,
    emp_no INTEGER   NOT NULL
);

-- create table for employees csv table 
CREATE TABLE employees(    
	emp_no INTEGER   NOT NULL,
    emp_title_id VARCHAR(10) NOT NULL,
    birth_date DATE NOT NULL,
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(20) NOT NULL,
    sex VARCHAR(1)   NOT NULL,
    hire_date DATE NOT NULL,
    CONSTRAINT pk_employees PRIMARY KEY (
        emp_no
     )
);

-- create table for salaries csv table 
CREATE TABLE salaries (
    emp_no INTEGER   NOT NULL,
    salary INTEGER   NOT NULL
);

-- create table for titles csv
CREATE TABLE titles (
    title_id VARCHAR(10)   NOT NULL,
    title VARCHAR(30)   NOT NULL,
    CONSTRAINT pk_titles PRIMARY KEY (
        title_id
     )
);

-- alter tables to include forgein keys 
ALTER TABLE employees 
	ADD CONSTRAINT fk_employees_emp_title_id 
		FOREIGN KEY(emp_title_id)
			REFERENCES titles (title_id)
;

ALTER TABLE dept_managers 
	ADD CONSTRAINT fk_dept_manager_dept_no 
		FOREIGN KEY(dept_no)
			REFERENCES departments (dept_no)
;

ALTER TABLE dept_managers 
	ADD CONSTRAINT fk_dept_manager_emp_no 
		FOREIGN KEY(emp_no)
			REFERENCES employees (emp_no)
;

ALTER TABLE salaries 
	ADD CONSTRAINT fk_salaries_emp_no 
		FOREIGN KEY(emp_no)
			REFERENCES employees (emp_no)
;

ALTER TABLE dept_emp 
	ADD CONSTRAINT fk_dept_emp_emp_no 
		FOREIGN KEY(emp_no)
			REFERENCES employees (emp_no)
;

ALTER TABLE dept_emp 
	ADD CONSTRAINT fk_dept_emp_dept_no 
		FOREIGN KEY(dept_no)
			REFERENCES departments (dept_no)
;


-- Data analyisis question #1
SELECT  employees.emp_no, 
		employees.last_name, 
		employees.first_name, 
		employees.sex, 
		salaries.salary
			FROM employees
				JOIN salaries
					ON employees.emp_no = salaries.emp_no
;

-- #2
SELECT  first_name, 
		last_name, 
		hire_date 
			FROM employees
				WHERE hire_date BETWEEN '1/1/1986' AND '12/31/1986'
;

--#3
SELECT departments.dept_no, 
       departments.dept_name, 
	   dept_managers.emp_no, 
	   employees.last_name, 
	   employees.first_name
			FROM departments
				JOIN dept_managers
					ON departments.dept_no = dept_managers.dept_no
						JOIN employees
							ON dept_managers.emp_no = employees.emp_no
;

--#4
SELECT  dept_emp.emp_no, 
		employees.last_name, 
		employees.first_name, 
		departments.dept_name
			FROM dept_emp
				JOIN employees
					ON dept_emp.emp_no = employees.emp_no
						JOIN departments
							ON dept_emp.dept_no = departments.dept_no
;

--#5
SELECT  employees.first_name, 
		employees.last_name, 
		employees.sex
			FROM employees
				WHERE first_name = 'Hercules'
					AND last_name Like 'B%'
;

--#6
SELECT  departments.dept_name,
		employees.last_name, 
		employees.first_name
			FROM dept_emp
				JOIN employees
					ON dept_emp.emp_no = employees.emp_no
						JOIN departments
							ON dept_emp.dept_no = departments.dept_no
								WHERE departments.dept_name = 'Sales'
;

--#7

--#8

