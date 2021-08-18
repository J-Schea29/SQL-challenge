CREATE TABLE departments (
    dept_no VARCHAR(4) NOT NULL
    dept_name VARCHAR NOT NULL
):

CREATE TABLE dept_manager (
    dept_no VARCHAR(4) NOT NULL
    emp_no INT NOT NULL
):

CREATE TABLE empLoyees (
    emp_no INT NOT NULL
    emp_title_id VARCHAR NOT NULL
    birth_date DATE NOT NULL
    first_name VARCHAR(20) NOT NULL
    last_name VARCHAR(20) NOT NULL
    sex VARCHAR(1) NOT NULL
    hire_date DATE NOT NULL
):

CREATE TABLE salaries (
    emp_no INT NOT NULL
    salary INT NOT NULL
):

CREATE TABLE titles (
    title_id VARCHAR NOT NULL
    title VARCHAR NOT NULL
):