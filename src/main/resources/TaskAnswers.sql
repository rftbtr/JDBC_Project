##	1. List all employees in department D001.
SELECT *
FROM employees
INNER JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
WHERE dept_no = 'D001';

##	2. List all employees in 'Human Resources' department.
SELECT employees.*
FROM employees
INNER JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
INNER JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Human Resources';

##	3. Calculate the average salary of all employees
SELECT AVG(salary) AS average_salary
FROM salaries;

##	4. Calculate the average salary of all employees with gender "M"
SELECT AVG(s.salary) AS average_salary
FROM employees e
INNER JOIN salaries s ON e.emp_no = s.emp_no
WHERE e.gender = 'F';

##	5. Calculate the average salary of all employees with gender "F"
SELECT AVG(s.salary) AS average_salary
FROM employees e
INNER JOIN salaries s ON e.emp_no = s.emp_no
WHERE e.gender = 'M';

##	6: List all employees in the "Sales" department with a salary greater than 70,000.
SELECT e.*, s.salary
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no
JOIN departments d ON de.dept_no = d.dept_no
JOIN salaries s ON e.emp_no = s.emp_no
WHERE d.dept_name = 'Sales' AND s.salary > 70000;

##	7. This query retrieves employees who have salaries between 50000 and 100000.
SELECT e.*
FROM employees e
INNER JOIN salaries s ON e.emp_no = s.emp_no
WHERE s.salary BETWEEN 50000 AND 100000;

##	8. Calculate the average salary for each department (by department number or department name)
-- by department no
SELECT de.dept_no, AVG(s.salary) AS average_salary
FROM dept_emp de
JOIN salaries s ON de.emp_no = s.emp_no
GROUP BY de.dept_no;
-- by department name
SELECT dept_name, AVG(salary) AS avg_salary
FROM departments
JOIN dept_emp ON departments.dept_no = dept_emp.dept_no
JOIN salaries ON dept_emp.emp_no = salaries.emp_no
GROUP BY departments.dept_no;

##	9. Calculate the average salary for each department, including department names
SELECT d.dept_no, d.dept_name, AVG(s.salary) AS average_salary
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no
JOIN salaries s ON e.emp_no = s.emp_no
JOIN departments d ON de.dept_no = d.dept_no
GROUP BY d.dept_no, d.dept_name;

##	10. Find all salary changes for employee with emp. no '10102':
SELECT emp_no, salary, from_date, to_date
FROM salaries
WHERE emp_no = '10102'
ORDER BY from_date;

##	11. Find the salary increases for employee with employee number '10102' (using the to_date column in salaries):
SELECT emp_no, salary, to_date
FROM salaries
WHERE emp_no = '10102'
ORDER BY to_date;

##	12. Find the employee with the highest salary:
SELECT * FROM employees
JOIN salaries ON employees.emp_no = salaries.emp_no
ORDER BY salary DESC
LIMIT 1;

##	13. Find the latest salaries for each employee:
SELECT emp_no, salary, to_date
FROM salaries
WHERE (emp_no, to_date) IN (SELECT emp_no, MAX(to_date) FROM salaries GROUP BY emp_no);

##	14. List the first name, last name, and highest salary of employees in the "Sales" department. 
##	Order the list by highest salary descending and only show the employee with the highest salary.
SELECT e.first_name, e.last_name, MAX(s.salary) AS highest_salary
FROM employees e
INNER JOIN dept_emp de ON e.emp_no = de.emp_no
INNER JOIN departments d ON de.dept_no = d.dept_no
INNER JOIN salaries s ON e.emp_no = s.emp_no
WHERE d.dept_name = 'Sales'
GROUP BY e.first_name, e.last_name
ORDER BY highest_salary DESC
LIMIT 1;

##	15. Find the Employee with the Highest Salary Average in the Research Department
SELECT e.first_name, e.last_name, MAX(s.salary) AS max_salary
FROM employees e
INNER JOIN dept_emp de ON e.emp_no = de.emp_no
INNER JOIN departments d ON de.dept_no = d.dept_no
INNER JOIN salaries s ON e.emp_no = s.emp_no
WHERE d.dept_name = 'Research'
GROUP BY e.first_name, e.last_name
ORDER BY max_salary DESC
LIMIT 1;

##	16. For each department, identify the employee with the highest single salary ever recorded. 
##	List the department name, employee's first name, last name, and the peak salary amount. 
##	Order the results by the peak salary in descending order.
SELECT d.dept_name AS department, e.first_name, e.last_name, MAX(s.salary) AS max_salary
FROM employees e
INNER JOIN dept_emp de ON e.emp_no = de.emp_no
INNER JOIN departments d ON de.dept_no = d.dept_no
INNER JOIN salaries s ON e.emp_no = s.emp_no
GROUP BY d.dept_name
ORDER BY max_salary DESC;

##	17. Identify the employees in each department who have the highest average salary.
##	List the department name, employee's first name, last name, and the average salary. 
##	Order the results by average salary in descending order, showing only those with the highest average salary within their department.
SELECT d.dept_name AS department, e.first_name, e.last_name, AVG(s.salary) AS avg_salary
FROM employees e
INNER JOIN dept_emp de ON e.emp_no = de.emp_no
INNER JOIN departments d ON de.dept_no = d.dept_no
INNER JOIN salaries s ON e.emp_no = s.emp_no
GROUP BY department
ORDER BY avg_salary DESC;

##	18. List the names, last names, and hire dates in alphabetical order of all employees hired before January 01, 1990.
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date < '1990-01-01'
ORDER BY first_name ASC, last_name ASC;

##	19. List the names, last names, hire dates of all employees hired 
##	between January 01, 1985 and December 31, 1989, sorted by hire date.
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1985-01-01' AND '1989-12-31'
ORDER BY hire_date ASC;

##	20. List the names, last names, hire dates, and salaries of all employees
##	in the Sales department who were hired between January 01, 1985 and December 31, 1989, sorted by salary in descending order.
SELECT first_name, last_name, hire_date, salary
FROM employees
WHERE hire_date BETWEEN '1985-01-01' AND '1989-12-31'
AND department = 'Sales'
AND emp_no IN (SELECT emp_no FROM salaries)
ORDER BY salary DESC;

##	21. 
-- a: Find the count of male employees (179973)
SELECT COUNT(gender) AS Male_Count FROM employees WHERE gender = 'M';
-- b: Determine the count of female employees (120050)
SELECT COUNT(gender) AS Female_Count FROM employees WHERE gender = 'F';
-- c: Find the number of male and female employees by grouping:
SELECT gender, COUNT(*) AS count FROM employees GROUP BY gender;
-- d: Calculate the total number of employees in the company (300023)
SELECT COUNT(emp_no) AS Total_Employees FROM employees;

##	22. 
-- a: Find out how many employees have unique first names (1275)
SELECT COUNT(DISTINCT first_name) AS Unique_Names FROM employees;
-- b: Identify the number of distinct department names (9)
SELECT COUNT(DISTINCT dept_name) AS Unique_Departments FROM departments;

##	23. List the number of employees in each department
SELECT de.dept_no, COUNT(*) AS employee_count
FROM dept_emp de
GROUP BY de.dept_no;

##	24. List all employees hired within the last 5 years from February 20, 1990
SELECT *
FROM employees
WHERE hire_date <= DATE_SUB('1990-02-20', INTERVAL 5 YEAR);

##	25. List the information (employee number, date of birth, first name, last name, gender, hire date)
##	of the employee named "Annemarie Redmiles".
SELECT *
FROM employees
WHERE first_name = 'Annemarie' AND last_name = 'Redmiles';

##	26.	List all information (employee number, date of birth, first name, last name, gender, hire date, salary, department, and title)
##	for the employee named "Annemarie Redmiles".
SELECT *
FROM employees e
INNER JOIN salaries s ON e.emp_no = s.emp_no
INNER JOIN titles t ON e.emp_no = t.emp_no
WHERE e.first_name = 'Annemarie' AND e.last_name = 'Redmiles';

##  27. List all employees and managers in the D005 department
SELECT e.emp_no, e.first_name, e.last_name, e.birth_date, e.gender, e.hire_date, d.dept_name AS department_name, t.title, s.salary
FROM employees e
JOIN dept_manager dm ON e.emp_no = dm.emp_no
JOIN departments d ON dm.dept_no = d.dept_no
JOIN titles t ON e.emp_no = t.emp_no
JOIN salaries s ON e.emp_no = s.emp_no
WHERE d.dept_no = 'D005';

##	28. List all employees hired after '1994-02-24' and earning more than 50,000
SELECT e.emp_no, e.first_name, e.last_name, e.birth_date, e.gender, e.hire_date, t.title, s.salary
FROM employees e
JOIN titles t ON e.emp_no = t.emp_no
JOIN salaries s ON e.emp_no = s.emp_no
WHERE e.hire_date > '1994-02-24' AND s.salary > 50000;

##	29. List all employees working in the "Sales" department with the title "Manager"
SELECT e.emp_no, e.first_name, e.last_name, e.birth_date, e.gender, e.hire_date
FROM employees e
JOIN dept_manager dm ON e.emp_no = dm.emp_no
JOIN departments d ON dm.dept_no = d.dept_no
JOIN titles t ON e.emp_no = t.emp_no
WHERE d.dept_name = 'Sales' AND t.title = 'Manager';

##	30. Find the department where employee with '10102' has worked the longest
SELECT employees.emp_no, departments.dept_name, DATEDIFF(MAX(dept_emp.to_date), MIN(dept_emp.from_date)) AS work_duration
FROM employees
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
GROUP BY employees.emp_no
ORDER BY work_duration DESC
LIMIT 1;

##	31. Find the highest paid employee in department D004:
SELECT employees.first_name, employees.last_name, MAX(salaries.salary) AS max_salary
FROM employees
JOIN salaries ON employees.emp_no = salaries.emp_no
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
WHERE dept_emp.dept_no = 'D004';

##	32. Find the entire position history for employee with emp. no '10102':
SELECT emp_no, title, from_date, to_date
FROM titles
WHERE emp_no = '10102'
ORDER BY from_date;

##	33. Finding the average "employee age":
SELECT AVG(DATEDIFF(CURRENT_DATE, birth_date) / 365) AS avg_age FROM employees;

##	34. Finding the number of employees per department:
SELECT dept_no, COUNT(*) AS employee_count
FROM dept_emp
GROUP BY dept_no;

##	35. Finding the managerial history of employee with ID (emp. no) 110022:
SELECT employees.first_name, employees.last_name, dept_manager.from_date, dept_manager.to_date
FROM employees
JOIN dept_manager ON employees.emp_no = dept_manager.emp_no
WHERE employees.emp_no = '110022';

##	36. Find the duration of employment for each employee:
SELECT emp_no, DATEDIFF(MAX(to_date), MIN(from_date)) AS work_duration
FROM titles
GROUP BY emp_no;

##	37. Find the latest title information for each employee:
SELECT employees.emp_no, employees.first_name, employees.last_name, titles.title
FROM employees
JOIN titles ON employees.emp_no = titles.emp_no
WHERE titles.to_date = (SELECT MAX(to_date) FROM titles WHERE titles.emp_no = employees.emp_no);

##	38. Find the first and last names of managers in department 'D005':
SELECT employees.first_name, employees.last_name
FROM employees
JOIN dept_manager ON employees.emp_no = dept_manager.emp_no
WHERE dept_manager.dept_no = 'D005';

##	39. Sort employees by their birth dates:
SELECT *  FROM employees ORDER BY birth_date;

##	40. List employees hired in April 1992:
SELECT * FROM employees
WHERE hire_date BETWEEN '1992-04-01' AND '1992-04-30';

##	41. Find all departments that employee '10102' has worked in:
SELECT DISTINCT dept_no
FROM dept_emp
WHERE emp_no = '10102';


