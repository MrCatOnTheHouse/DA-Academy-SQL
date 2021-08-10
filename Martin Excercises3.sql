SET sql_mode = 'ONLY_FULL_GROUP_BY';

#---------------Excercises 3

#1-Write a query to list the number of jobs available in the employees table. 
SELECT DISTINCT e.JOB_ID
FROM employees AS e;

#2-Write a query to get the total salaries payable to employees.
SELECT SUM(e.SALARY)
FROM employees AS e

#3-Write a query to get the minimum salary from employees table.
SELECT MIN(e.SALARY)
FROM employees AS e;

#4-Write a query to get the maximum salary of an employee working as a Programmer. 
SELECT e.JOB_ID, MAX(e.SALARY)
FROM employees AS e 
WHERE e.JOB_ID = 'IT_PROG'
GROUP BY e.JOB_ID

#5-Write a query to get the average salary and number of employees working the department 90.
SELECT COUNT(e.EMPLOYEE_ID), ROUND(AVG(e.SALARY),2)
FROM employees AS e
WHERE e.DEPARTMENT_ID = 90
GROUP BY e.DEPARTMENT_ID;

#6-Write a query to get the highest, lowest, sum, and average salary of all employees. 
SELECT MAX(e.SALARY) AS MAX_SALARY, MIN(e.SALARY) AS MIN_SALARY, SUM(e.SALARY) AS SUM_SALARY,
ROUND(AVG(e.SALARY),2) AS AVG_SALARY
FROM employees AS e;

#7-Write a query to get the number of employees with the same job. 
SELECT COUNT(e.JOB_ID), e.JOB_ID
FROM employees AS e 
GROUP BY e.JOB_ID

#8-Write a query to get the difference between the highest and lowest salaries. 

#9-Write a query to find the manager ID and the salary of the lowest-paid employee for that manager. 
SELECT MANAGER_ID,MIN(SALARY)'Lowest Salary'
FROM employees
GROUP BY MANAGER_ID
HAVING MIN(SALARY)=2100
ORDER BY 'Lowest Salary'
LIMIT 1

#10-Write a query to get the department ID and the total salary payable in each department.
SELECT e.DEPARTMENT_ID, SUM(e.SALARY)
FROM employees AS e
GROUP BY e.DEPARTMENT_ID

#11-Write a query to get the average salary for each job ID excluding programmer.
SELECT e.JOB_ID , ROUND(AVG(e.SALARY),2) AS AVG_SALARY
FROM employees AS e 
WHERE e.JOB_ID <> 'IT_PROG'
GROUP BY e.JOB_ID

#12-Write a query to get the total salary, maximum, minimum, average salary of employees (job ID wise), for department ID 90 only. 
SELECT e.JOB_ID, SUM(e.SALARY) AS SUM_SALARY, MAX(e.SALARY) AS MAX_SALARY, MIN(e.SALARY) AS MIN_SALARY,
ROUND(AVG(e.SALARY),2) AS AVG_SALARY
FROM employees AS e
WHERE e.DEPARTMENT_ID = 90
GROUP BY e.JOB_ID
#13-Write a query to get the job ID and maximum salary of the employees where maximum salary is greater than or equal to $4000. 
SELECT e.JOB_ID , MAX(e.SALARY) AS MAX_SALARY
FROM employees AS e
GROUP BY e.JOB_ID
HAVING MAX_SALARY >= 4000

#14-Write a query to get the average salary for all departments employing more than 10 employees.
SELECT e.DEPARTMENT_ID, COUNT(e.EMPLOYEE_ID) AS EMPLOYEES_ON_DEPARTMENT, ROUND(AVG(e.SALARY),2) AS AVG_SALARY
FROM employees AS e 
GROUP BY e.DEPARTMENT_ID
HAVING EMPLOYEES_ON_DEPARTMENT > 10