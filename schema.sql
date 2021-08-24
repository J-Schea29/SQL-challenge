---Create table for titles csv
CREATE TABLE titles (
    title_id VARCHAR NOT NULL,
    title VARCHAR NOT NULL,
    PRIMARY KEY(title_id)
);

---Create table for employees csv
CREATE TABLE employees (
    emp_no INT NOT NULL,
    title_id VARCHAR NOT NULL,
    birth_date DATE NOT NULL,
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(20) NOT NULL,
    sex VARCHAR(1) NOT NULL,
    hire_date DATE NOT NULL,
    PRIMARY KEY(emp_no),
    FOREIGN KEY (title_id) REFERENCES titles (title_id)
);

---Create table for departments csv
CREATE TABLE departments (
    dept_no VARCHAR(4) NOT NULL,
    dept_name VARCHAR NOT NULL,
    PRIMARY KEY(dept_no)
);

---Create table for dept_manager csv
CREATE TABLE dept_manager (
    dept_no VARCHAR(4) NOT NULL,
    emp_no INT NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
    PRIMARY KEY(emp_no, dept_no)
);

---Create table for dept_emp csv
CREATE TABLE dept_emp (
    emp_no INT NOT NULL,
    dept_no VARCHAR(4) NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
    PRIMARY KEY(emp_no, dept_no)
);

---Create table for salaries csv
CREATE TABLE salaries (
    emp_no INT NOT NULL,
    salary INT NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
    PRIMARY KEY(emp_no)
);

---Veiw tables to check is code above worked
SELECT * FROM titles;

SELECT * FROM employees;

SELECT * FROM departments;

SELECT * FROM dept_manager;

SELECT * FROM dept_emp;

SELECT * FROM salaries;

---Veiw just employee number, last and first name, sex, and salary
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees e
LEFT JOIN salaries s
ON e.emp_no = s.emp_no

---Veiw just last and first name, and hire date
SELECT e.last_name, e.first_name, e.hire_date
FROM employees e
WHERE EXTRACT(YEAR FROM e.hire_date) = 1986

---Veiw just department number, department name, employee number, last and first name
SELECT dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
FROM dept_manager dm
LEFT JOIN departments d
ON dm.dept_no = d.dept_no
LEFT JOIN employees e
ON e.emp_no = dm.emp_no

---Veiw just department number, last and first name, and department name
SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp de
LEFT JOIN departments d
ON de.dept_no = d.dept_no
LEFT JOIN employees e
ON e.emp_no = de.emp_no

---Veiw only those employees whose first name is hercules and last name starts with B. 
---Then select sex, last and first name
SELECT e.last_name, e.first_name, e.sex
FROM employees e
WHERE e.first_name = 'Hercules'
AND e.last_name LIKE 'B%'

---Use a subquery to veiw only those employees in sales. 
---then select department number, last and first name, and department name
SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp de
LEFT JOIN employees e
ON e.emp_no = de.emp_no
LEFT JOIN departments d
ON de.dept_no = d.dept_no
WHERE de.dept_no IN
(
  SELECT d.dept_no
  FROM departments d
  WHERE d.dept_name = 'Sales'
);

---Use a subquery to veiw only those employees in sales or development. 
---then select department number, last and first name, and department name
SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp de
LEFT JOIN employees e
ON e.emp_no = de.emp_no
LEFT JOIN departments d
ON de.dept_no = d.dept_no
WHERE de.dept_no IN
(
  SELECT d.dept_no
  FROM departments d
  WHERE d.dept_name = 'Sales'
  OR d.dept_name = 'Development'
);

---Grouping by last name, count the number of people who share each last name  
SELECT last_name, COUNT(emp_no) AS "Last Name Frequency"
FROM employees
GROUP BY last_name
ORDER BY "Last Name Frequency" DESC

SELECT first_name, last_name
FROM employees
WHERE emp_no = 499942