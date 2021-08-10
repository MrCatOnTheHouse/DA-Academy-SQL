#1- Write a query to display the names (first_name, last_name) using alias name “First Name", "Last Name". 
SELECT e.FIRST_NAME AS "First Name", e.LAST_NAME AS "Last Name"
FROM employees AS e;

#2- Write a query to get unique department ID from employee table. 
SELECT DISTINCT e.DEPARTMENT_ID
FROM employees AS e;

#3- Write a query to get all employee details from the employee table order by first name, descending. 
SELECT * FROM employees AS e
ORDER BY e.FIRST_NAME;

#4- Write a query to get the names (first_name, last_name), salary, PF of all the employees (PF is calculated as 15% of salary). 
SELECT CONCAT(e.FIRST_NAME,' ',e.LAST_NAME), e.SALARY, ROUND(e.SALARY * .15,2) AS PF
FROM employees AS e;

#5- Write a query to get the employee ID, names (first_name, last_name), salary in ascending order of salary. 
SELECT  e.EMPLOYEE_ID, CONCAT(e.FIRST_NAME,' ',e.LAST_NAME), e.SALARY
FROM employees AS e
ORDER BY e.SALARY;

#6- Write a query to get the total salaries payable to employees. 
SELECT SUM(e.SALARY)
FROM employees AS e;

#7- Write a query to get the maximum and minimum salary from employees table. 
SELECT MAX(e.SALARY) AS MAX_SALARY,MIN(e.SALARY) AS MIN_SALARY
FROM employees AS e;

#8- Write a query to get the average salary and number of employees in the employees table. 
SELECT COUNT(e.EMPLOYEE_ID) AS NUMBER_EMPLOYEES, ROUND(AVG(e.SALARY),2) AS AVERAGE_SALARY
FROM employees AS e;

#9- Write a query to get the number of employees working with the company. 
SELECT COUNT(e.EMPLOYEE_ID) AS NUMBER_EMPLOYEES
FROM employees AS e;

#10- Write a query to get the number of jobs available in the employees table. 
SELECT DISTINCT(e.JOB_ID)
FROM employees AS e

#11- Write a query get all first name from employees table in upper case. 
SELECT e.EMPLOYEE_ID,(e.FIRST_NAME) EMPLOYEE_NAME
FROM employees AS e

#12- Write a query to get the first 3 characters of first name from employees table. 
SELECT SUBSTRING(e.FIRST_NAME,1,3) AS NAME_CHARACTERS
FROM employees AS e;

#13- Write a query to calculate 171*214+625. 
SELECT 171*214+625 AS RESULT

#14- Write a query to get the names (for example Ellen Abel, Sundar Ande etc.) of all the employees from employees table. 
SELECT CONCAT(e.FIRST_NAME,' ',e.LAST_NAME)
FROM employees AS e;

#15- Write a query to get first name from employees table after removing white spaces from both side. 
SELECT LTRIM(RTRIM(e.FIRST_NAME))
FROM employees AS e;

#16- Write a query to get the length of the employee names (first_name, last_name) from employees table. 
SELECT LENGTH(CONCAT(e.FIRST_NAME,' ',e.LAST_NAME)) AS LENGTH_OF_NAMES
FROM employees AS e;

#17- Write a query to check if the first_name fields of the employees table contains numbers. 
SELECT e.FIRST_NAME
FROM employees AS e
WHERE e.FIRST_NAME LIKE '%[0-9]%';

#18- Write a query to select first 10 records from a table. 
SELECT CONCAT(e.FIRST_NAME,' ',e.LAST_NAME) AS EMPLOYEES_NAME
FROM employees AS e LIMIT 10;

#19- Write a query to get monthly salary (round 2 decimal places) of each and every employee.  
#Note : Assume the salary field provides the 'annual salary' information.
SELECT CONCAT(e.FIRST_NAME,' ',e.LAST_NAME) AS EMPLOYEES_NAME, ROUND(e.SALARY/12,2)
FROM employees AS e;
