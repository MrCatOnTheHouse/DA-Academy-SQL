#1-Write a query to display the name (first_name, last_name) and salary for all employees whose salary is not in the range $10,000 through $15,000. 
SELECT CONCAT(e.FIRST_NAME,' ',e.LAST_NAME) AS Employee_Name, e.SALARY
FROM employees AS e
WHERE e.SALARY NOT IN (10000,15000)
ORDER BY e.SALARY;

#2-Write a query to display the name (first_name, last_name) and department ID of all employees in departments 30 or 100 in ascending order. 
SELECT CONCAT(e.FIRST_NAME,' ',e.LAST_NAME) AS Employee_Name, e.DEPARTMENT_ID
FROM employees AS e
WHERE e.DEPARTMENT_ID = 30 OR e.DEPARTMENT_ID = 100;

#3-Write a query to display the name (first_name, last_name) and salary for all employees whose salary is not in the range $10,000 through $15,000 and are in department 30 or 100. 
SELECT CONCAT(e.FIRST_NAME,' ',e.LAST_NAME) AS Employee_Name, e.SALARY, e.DEPARTMENT_ID
FROM employees AS e
WHERE e.SALARY NOT IN (10000,15000) AND e.DEPARTMENT_ID = 30 OR e.DEPARTMENT_ID = 100
ORDER BY e.SALARY;

#4-Write a query to display the name (first_name, last_name) and hire date for all employees who were hired in 1987. 
SELECT CONCAT(e.FIRST_NAME,' ',e.LAST_NAME) AS Employee_Name, e.HIRE_DATE
FROM employees AS e
WHERE YEAR(e.HIRE_DATE) = '1987'
 
#5-Write a query to display the first_name of all employees who have both "b" and "c" in their first name. 
SELECT CONCAT(e.FIRST_NAME,' ',e.LAST_NAME) AS Employee_Name, e.SALARY, e.DEPARTMENT_ID
FROM employees AS e
WHERE e.FIRST_NAME LIKE '%b%' OR e.FIRST_NAME LIKE '%c%'

#6-Write a query to display the last name, job, and salary for all employees whose job is that of a Programmer or a Shipping Clerk, and whose salary is not equal to $4,500, $10,000, or $15,000. 
SELECT e.LAST_NAME, j.JOB_TITLE,e.SALARY
FROM employees AS e
JOIN jobs AS j ON j.JOB_ID = e.JOB_ID
WHERE j.JOB_TITLE = 'Programmer' OR j.JOB_TITLE = 'Shipping Clerk'
AND e.SALARY NOT IN (4500,10000,15000)
#7-Write a query to display the last name of employees whose names have exactly 6 characters. 
SELECT e.LAST_NAME
FROM employees AS e
WHERE CHARACTER_LENGTH(e.LAST_NAME) = 6

#8-Write a query to display the last name of employees having 'e' as the third character. 
SELECT e.LAST_NAME
FROM employees AS e
WHERE e.LAST_NAME LIKE '__e%'

#9-Write a query to display the jobs/designations available in the employees table. 
SELECT DISTINCT e.JOB_ID
FROM employees AS e

#10-Write a query to display the name (first_name, last_name), salary and PF (calculate as 15% of salary) of all employees. 
SELECT CONCAT(e.FIRST_NAME,' ',e.LAST_NAME) AS Employee_Name, e.SALARY, ROUND(e.SALARY *.15,2) AS PF
FROM employees AS e
ORDER BY e.SALARY;

#11-Write a query to select all record from employees where last name in 'BLAKE', 'SCOTT', 'KING' and 'FORD'.
SELECT e.FIRST_NAME ,e.LAST_NAME
FROM employees AS e
WHERE e.LAST_NAME IN ('BLAKE','SCOTT','KING','FORD')