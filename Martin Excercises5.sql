SET sql_mode = 'ONLY_FULL_GROUP_BY'; 

SELECT * FROM jobs 

#1-Write a query to find the name (first_name, last_name) and the salary of the employees who have a higher salary than the employee whose last_name='Bull'. 
SELECT CONCAT(e.FIRST_NAME, ' ', e.LAST_NAME), e.SALARY
FROM employees AS e
WHERE e.SALARY > (SELECT e.SALARY FROM employees AS e WHERE e.LAST_NAME = 'Bull' )

#2-Write a query to find the name (first_name, last_name) of all employees who works in the IT department. 
SELECT CONCAT(e.FIRST_NAME, ' ', e.LAST_NAME) AS Full_name, e.JOB_ID
FROM employees AS e
WHERE e.JOB_ID = 'IT_PROG'

#3-Write a query to find the name (first_name, last_name) of the employees who are managers. 
SELECT CONCAT(e.FIRST_NAME, ' ', e.LAST_NAME) AS Full_name, e.JOB_ID
FROM employees AS e
JOIN jobs AS j ON j.JOB_ID = e.JOB_ID
WHERE j.JOB_TITLE LIKE '%Manager%'

SELECT CONCAT(e.FIRST_NAME, ' ', e.LAST_NAME) AS Full_name FROM employees AS e
WHERE e.EMPLOYEE_ID IN (SELECT em.MANAGER_ID FROM employees AS em)


SELECT CONCAT(ma.FIRST_NAME, ' ', ma.LAST_NAME) AS Full_name, ma.JOB_ID
FROM employees AS em
RIGHT JOIN employees AS ma ON ma.MANAGER_ID = em.EMPLOYEE_ID

#4-Write a query to find the name (first_name, last_name), and salary of the employees whose salary is greater than the average salary. 
SELECT CONCAT(e.FIRST_NAME, ' ', e.LAST_NAME) AS Full_name, e.SALARY
FROM employees AS e
WHERE e.SALARY > (SELECT AVG(e.SALARY) FROM employees AS e)

#5-Write a query to find the name (first_name, last_name), and salary of the employees who earns more than the average salary and works in any of the IT departments. 
SELECT CONCAT(e.FIRST_NAME, ' ', e.LAST_NAME), e.SALARY
FROM employees AS e
WHERE e.SALARY > (SELECT AVG(e.SALARY) FROM employees AS e) AND e.JOB_ID = 'IT_PROG'

#6-Write a query to find the name (first_name, last_name), and salary of the employees who earns more than the earning of Mr. Bell. 
SELECT CONCAT(e.FIRST_NAME, ' ', e.LAST_NAME), e.SALARY
FROM employees AS e
WHERE e.SALARY > (SELECT e.SALARY FROM employees AS e WHERE e.LAST_NAME = 'Bell' )


#7-Write a query to find the name (first_name, last_name), and salary of the employees who earn the same salary as the minimum salary for all departments. 
SELECT CONCAT(e.FIRST_NAME, ' ', e.LAST_NAME) AS Full_name , e.SALARY
FROM employees AS e
WHERE e.SALARY = (SELECT MIN(es.SALARY) FROM employees AS es)

#8-Write a query to find the name (first_name, last_name), and salary of the employees whose salary is greater than the average salary of all departments. 
SELECT CONCAT(e.FIRST_NAME, ' ', e.LAST_NAME) AS Full_name , e.SALARY
FROM employees AS e
WHERE e.SALARY > (SELECT AVG(es.SALARY) FROM employees AS es)

#9-Write a query to find the name (first_name, last_name) and salary of the employees who earn a salary that is higher than the salary of all the Shipping Clerk (JOB_ID = 'SH_CLERK'). Sort the results of the salary of the lowest to highest. 
SELECT CONCAT(e.FIRST_NAME, ' ', e.LAST_NAME) AS Full_name , e.SALARY
FROM employees AS e
WHERE e.SALARY > (SELECT MAX(es.SALARY) FROM employees AS es WHERE es.JOB_ID = 'SH_CLERK')
ORDER BY e.SALARY
SELECT e.FIRST_NAME,EMPLOYEE_ID , e.MANAGER_ID FROM employees AS e

#10-Write a query to find the name (first_name, last_name) of the employees who are not supervisors. 
SELECT CONCAT(e.FIRST_NAME, ' ', e.LAST_NAME) AS Full_name FROM employees AS e
WHERE e.EMPLOYEE_ID NOT IN (SELECT em.MANAGER_ID FROM employees AS em)

#11-WRITE a query to select last 10 records from employee table based on the employee id order. 
SELECT *
FROM employees AS e
ORDER BY e.EMPLOYEE_ID DESC LIMIT 10;

#12-Write a query to list the department ID and name of all the departments where no employee is working. 
SELECT d.DEPARTMENT_ID, d.DEPARTMENT_NAME
FROM departments AS d 
WHERE d.DEPARTMENT_ID NOT IN (SELECT e.DEPARTMENT_ID FROM employees AS e )













