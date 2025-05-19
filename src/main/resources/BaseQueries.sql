# Sample SQL Queries For Employees Schema

##	This file contains various SQL queries targeting a sample `employees` table.
##	These queries can be adapted based on your database schema and requirements.

use employees;
SELECT * FROM `employees`.`departments`;
SELECT * FROM `employees`.`dept_emp`;
SELECT * FROM `employees`.`dept_manager`; 
SELECT * FROM `employees`.`employees`;
SELECT * FROM `employees`.`salaries`;
SELECT * FROM `employees`.`titles`;

-- This query retrieves unique title values from the titles table and lists each title only once. 
-- The DISTINCT keyword ensures that the result eliminates duplicate values, so each title appears only once. 
-- This way, you obtain a result set containing only title information.
SELECT DISTINCT title FROM titles; 
-- SELECT STATEMENTS;
-- THESE ARE THE SQL NOTES ALL THE QUERIES ARE EXPLAINED IN THE COMMENTS IN THE SCRIPT ONLY
SELECT first_name,last_name FROM employees;
-- star means all
SELECT * FROM employees; -- THE STAR WILL GIVE US ALL THE DATA FROM ALL THE COLUMNS

-- WHERE CLAUSE : IT ALLOWS US TO SET A CONDITIONS WE WANT TO RETRIEVE.
SELECT * FROM employees WHERE first_name='georgi';
SELECT * FROM employees WHERE first_name="elvis";

-- OPERATORS : AND, IN , OR, LIKE, BETWEEN, NOT IN, NOT IN ;
-- AND : ALLOWS YOU TO LOGICALLY COMBINE TWO STATEMENTS IN THE CONDITION CODE BLOCK;
-- EG:
SELECT * FROM employees WHERE first_name='denis' AND gender='m';
SELECT * FROM employees WHERE first_name='kellie' AND gender='f';

-- IN AND ALL THE CONDITIONS SHOULD BE TRUE BUT IN OR EVEN IF ONE CONDITION IS TRUE IT GETS EXECUTED;
-- EG:
SELECT * FROM employees WHERE first_name='denis' OR first_name ='elvis';
SELECT * FROM employees WHERE first_name='kellie' OR first_name='aruna';

-- OPERATOR PRECEDENCE : IF WE ARE USING AND OR IN THE SAME BLOCK AND IS APPLIED FIRST AND OR IS APPLIED SECOND.
SELECT * FROM employees WHERE first_name='denis' AND gender='m' OR gender='f';
-- THE ABOVE QUERY DOES NOT GIVE THE RIGHT ANSWER DUE TO OPERATOR PRECEDENCE. IN ORDER TO GET CORRECT OUTPUT
-- WE USE PARANTHESIS.
SELECT * FROM employees WHERE first_name='denis' AND (gender='m' OR gender='f');
SELECT * FROM employees WHERE gender='f' AND (first_name='kellie' OR first_name='aruna');

-- IN:WE USE IN WHEN WE HAVE TO SATISY MORE THAN 2 CONDITIONS.
-- NORMAL QUERY
SELECT * FROM employees WHERE first_name='denis' OR first_name='aruna' OR first_name='kellie';
-- WITH IN OPREATOR
SELECT * FROM employees WHERE first_name IN('denis','kellie','aruna');
-- IN OPERATOR IS FASTER THAN OR IN MULTI CONDITIONAL QUERIES.
-- IF WE WANT TO USE MULTI CONDITIONAL QUERY TO OMIT SOMETHING WE USE NOT IN.
-- EG : A QUERY WHERE FIRST NAME IS NOT DENIS OR KELLIE OR ARUNA
SELECT * FROM employees WHERE first_name NOT IN('denis','kellie','aruna');
SELECT * FROM employees WHERE first_name IN('denis','elvis');
SELECT * FROM employees WHERE first_name NOT IN('john','mark','jacob');

##	LIKE and NOT LIKE Operators: We use the LIKE operator to search for a specific pattern.
##	For example: Finding all the data of the employees whose first name starts with "MAR" or whose last name ends with "OVIC".
SELECT * FROM employees WHERE first_name LIKE 'MAR%';
SELECT * FROM employees WHERE last_name LIKE '%OVIC';
-- IT IS IMPORTANT TO NOTE THAT % SIGN IS USED TO DENOTE THE SUBSEQUENCE OF CHARACTERS.
-- LIKE AND NOT LIKE ARE BASICALLY USED TO PATTERN MATCHING.
 
 -- BETWEEN : HELPS TO DESIGNATE THE INTERVAL TO WHICH THE VALUE BELONGS. THAT IS WHY IT IS ALWAYS USED WITH AND 
 -- OPERATOR.
 -- EG:
 SELECT * FROM employees WHERE hire_date BETWEEN '1990-01-01' AND '2000-01-01';
 SELECT * FROM salaries WHERE salary BETWEEN 66000 AND 77000;
 SELECT * FROM employees WHERE emp_no NOT BETWEEN 10004 AND 10012;
 SELECT * FROM departments WHERE dept_no BETWEEN 'd003' AND 'd006';
 
 -- NOT NULL CLAUSE IS USED IF WE WANT TO RETRIEVE NON NULL VALUES FROM A COLUMN.
 SELECT first_name FROM employees WHERE first_name IS NOT NULL;
 SELECT dept_name FROM departments WHERE dept_name IS NOT NULL;
 
 -- DISTINCT : IF WE WANT DISTINCT VALUES
 SELECT DISTINCT gender FROM employees;
 SELECT DISTINCT hire_date FROM employees;
 
 -- COUNT : COUNTS THE NON NULL VALUES IN A COLUMN IE GIVES NON NULL ROWS.
 SELECT COUNT(emp_no) FROM employees;
 SELECT COUNT(DISTINCT first_name) FROM employees;
 -- WHILE USING COUNT THE DISTINCT KEYWORD IS NOT WRITTEN AFTER SELECT. IT IS WRITTEN IN COUNT
 -- BRACKETS.
 SELECT COUNT(salary) FROM salaries WHERE salary>=100000;
 SELECT COUNT(*) FROM employees;
 
 -- ORDER BY : THIS CLAUSE BASICALLY ORDERS THE GIVEN QUERY WITH THE GIVEN PARAMETER.
 SELECT * FROM employees ORDER BY first_name;
 SELECT * FROM employees ORDER BY hire_date;
 
 -- GROUP BY:  WHEN WORKING IN SQL, RESULTS CAN BE GROUPED ACCORDING TO A SPECIFIC
 -- FIELD OR FIELDS. THIS IS DONE BY GROUP BY. GROUP BY MUST BE PLACED IMMEDIATELY AFTER WHERE AND
 -- JUST BEFORE ORDER BY. SUPPOSE WE WANT TO KNOW HOW MANY TIMES FIRST NAME HAS BEEN COME. MEANING
 -- HOW MANY TIMES A PARTICULAR NAME IS THERE WE CAN SUE GROUP BY THERE. 
 -- A STRICT RULE IS THAT WHATEVER WE USE IN COUNT IN GROUPY BY JUST USE IT BEFORE SELECT.
 -- EG:
SELECT COUNT(first_name) FROM employees GROUP BY first_name;
-- THIS MEANS WE ARE GETTING COUNT OF FIRST NAMES AND IN TURN WE ARE ALSO GROUPING THOSE COUNTS 
-- ACCORDING TO GROUP BY.
SELECT first_name, COUNT(first_name) FROM employees GROUP BY first_name ORDER BY first_name DESC;

-- AS : AS IS USED TO CHANGE THE COLUMN NAME.
SELECT first_name AS names_people, COUNT(first_name) AS names_count FROM employees GROUP BY first_name ORDER BY first_name;
SELECT salary, COUNT(emp_no) AS emp_with_same_salary FROM salaries WHERE salary>80000 GROUP BY salary ORDER BY salary;

-- HAVING: HAVING IS LIKE WHERE BUT IT IS USED BETWEEN GROUP BY AND ORDER BY CALUSE.
-- EG: FIND ALL FIRST NAMES WHERE FIRST NAMES ARE MORE THAN 250 TIMES. 
SELECT first_name,COUNT(first_name) AS names_count FROM employees GROUP BY first_name
HAVING COUNT(first_name)>250 ORDER BY first_name;
-- IN WHERE CLAUSE YOU CANNOT USE AGGREGATE FUNCTIONS WITH IT WHEREAS YOU CAN USE IT WITH HAVING.
SELECT first_name , COUNT(first_name) FROM employees WHERE hire_date>'1999-01-01' GROUP BY first_name
HAVING COUNT(first_name)<200 ORDER BY first_name;
-- THE ABOVE QUERY MEANS SELECTING ALL EMPLOYEES WHO HAVE BEEN HIRED AFTER 1 JAN 1999 HAVING NAMES LESS THAN 200.

-- IF USING AGGREGATE FUNCTIONS USE HAVING, IF GENERAL QUERIES USE WHERE.
-- EG:
-- HAVING Usage: Since we're using the COUNT() function, we should use HAVING.
SELECT first_name, COUNT(first_name) FROM employees GROUP BY first_name
HAVING COUNT(first_name) > 100;
-- WHERE Usage: For a general query like this, WHERE should be used.
SELECT * FROM employees WHERE hire_date > '2023-01-01';

-- LIMITS :  IF WE WANT A CERTAIN NUMBER OF ROWS OR WE WANT TO LIMIT OUR OUTPUT TO CERTAIN VALUES WE USE LIMIT.
-- EG:
SELECT * FROM employees LIMIT 100;


-- INSERTION IN THE TABLE
INSERT INTO employees VALUES(
13,
'2000-02-13',
'ojas',
'gupta',
'm',
'2023-01-16');
SELECT * FROM employees WHERE emp_no=13;

-- UPDATE : 

UPDATE employees 
SET 
first_name='ritu',
last_name='gupta',
birth_date='1972-09-08',
gender='f'
WHERE emp_no=13;

UPDATE employees SET
birth_date='1972-09-08',
first_name='ritu',
last_name='gupta',
gender='f',
hire_date='2023-01-16'
WHERE emp_no=96825;

-- -------------------------------------------- JOINS----------------------------------------

-- INNER JOINS : INNER JOINS ARE BASICALLY THE INTERSECTION OF TWO TABLES WITH SAME COLUMN(S) TO RELATE 
-- WITH EACH OTEHR.
USE employees;
SELECT e.emp_no, e.first_name, e.last_name, d.dept_no,e.hire_date FROM employees e
INNER JOIN dept_manager d ON e.emp_no=d.emp_no ORDER BY e.emp_no;

-- LEFT JOINS : LEFT JOINS CAN DELIVER A LIST WITH VALUES FROM LEFT TABLE THAT DO NOT MATCH ANY ROWS FROM THE 
-- RIGHT TABLE. IN SIMPLE WORDS IF WE HAVE TWO TABLES AND HAVE SOME ID'S IN THE FIRST TABLE WHOSE 
-- CORRESPONSING DATA IS NOT AVAILABLE IN THE SECOND TABLE THEN IF WE PERFORM INNER JOIN 
-- WE WILL NOT GET THOSE ID'S AS INNER JOIN MEANS DATA WHICH IS COMMON TO BOTH THE VALUES.
-- BUT IN LEFT JOIN WE WILL GET THOSE VALUES IF WE LEFT JOIN ON LEFT TABLE.

SELECT e.emp_no,e.first_name, e.last_name, d.dept_no, d.from_date FROM employees e
LEFT JOIN dept_manager d ON e.emp_no=d.emp_no WHERE e.last_name="markovitch" ORDER BY
d.dept_no DESC,emp_no ASC; 

-- RIGHT JOIN : SAME AS LEFT JOIN BUT ARE IMPLEMENTED ON THE RIGHT TABLE.
SELECT e.emp_no, d.dept_no, e.first_name,e.last_name, e.hire_date FROM employees e
INNER JOIN dept_manager d ON e.emp_no=d.emp_no ORDER BY e.emp_no DESC;
--	
SELECT e.emp_no, e.first_name, e.last_name, e.hire_date, t.title FROM employees e
INNER JOIN titles t ON e.emp_no=t.emp_no WHERE e.first_name= "margareta" AND last_name="markovitch";

-- CROSS JOIN : A CROSS JOIN WILL TAKE TEH VALUES FROM A CERTAIN TABLE AND JOIN IT WITH ALL THE
-- VALUES FROM THE TABLE WE WANT TO JOIN IT WITH.
-- IF WE WANT TO JOIN TWO TABLES WITH EMP_NO AND DEPT_NO BUT THE VALUES ARE NOT MATCHABLE WHICH MEANS
-- THAT THE DEPARTMENTS ARE 10 BUT THE EMP_NO ARE 500. THEN WE USE CROSS JOIN. CROSS JOIN BASICALLY IS A 
-- CARTESIAN PRODUCT OF TWO TABLES WHICH SIMPLY JOINS TWO TABLES WITHOUT MATCHING ANY VALUE;
 SELECT m.dept_no, m.emp_no,m.from_date,m.to_date, d.dept_no FROM dept_manager m 
 CROSS JOIN departments d WHERE d.dept_no='d009';
 
 -- JOINING MORE THAN TWO TABLES : JUST JOIN ONE TABLE WITH THE SECOND ONE AND THE SECOND ONE WITH THE THIRD ONE.
 SELECT e.emp_no,e.first_name, e.last_name, e.hire_date, t.title, d.from_date, dm.dept_name
 FROM employees e INNER JOIN titles t ON e.emp_no=t.emp_no
 JOIN dept_manager d ON t.emp_no=d.emp_no INNER JOIN departments dm ON
 d.dept_no=dm.dept_no ORDER BY e.emp_no;
 
 -- COMLPEX QUERY USING JOINS ON FOUR TABLES.
SELECT e.gender, COUNT(dm.emp_no) FROM employees e
INNER JOIN dept_manager dm ON e.emp_no=dm.emp_no GROUP BY e.gender;

-- SUBQUERIES : QUERIES EMBEDDED INSIDE A QUERY.
-- THEY ARE A PART OF ANOTHER QUERY CALLED THE OUTER QUERY.
-- THE SQL ENGINE PROCESS : THE INNER QUERY IS EXECUTED FIRST. AFTER THE EXECUTION OF THE INNER QUERY
-- THE RESULT IS USED FOR THE EXECUTION OF THE OUTER QUERY.
SELECT
*FROM
dept_manager
WHERE
emp_no IN (SELECT
emp_no
FROM
employees
WHERE
hire_date BETWEEN '1990-01-01' AND '1995-01-01'); 

-- EXISTS , NON EXISTS : CHECKS WHETHER CERTAIN ROW VALUES ARE FOUND WIHTIN A SUBQUERY.
-- THIS CHECK IS CONDUCTED ROW BY ROW.
-- IT RETURNS A BOOLEAN VALUE;
SELECT * FROM employees WHERE emp_no IN(SELECT emp_no FROM titles WHERE title="assistant engineer") 
ORDER BY emp_no;
SELECT * FROM employees WHERE NOT EXISTS (SELECT emp_no FROM titles WHERE title = 'assistant engineer');
-- This query retrieves employees where no employee number is found in the subquery result where the title is 'assistant engineer'.







