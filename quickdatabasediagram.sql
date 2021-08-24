titles 
-
title_id VARCHAR PK
title VARCHAR 

empLoyees
-
emp_no INT PK
title_id VARCHAR FK >- titles.title_id
birth_date DATE 
first_name VARCHAR(20) 
last_name VARCHAR(20) 
sex VARCHAR(1) 
hire_date DATE 

departments 
-
dept_no VARCHAR(4) PK
dept_name VARCHAR 

dept_manager 
-
dept_no VARCHAR(4) PK FK >- departments.dept_no
emp_no INT FK >- empLoyees.emp_no

dept_emp
-
emp_no PK FK >- empLoyees.emp_no
dept_no PK FK >- departments.dept_no

salaries 
-
emp_no INT PK FK >- empLoyees.emp_no
salary INT 
