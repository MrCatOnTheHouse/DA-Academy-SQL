SET sql_mode = 'ONLY_FULL_GROUP_BY';

SELECT * FROM departments;
SELECT * FROM locations;
SELECT * FROM employees;
SELECT * FROM jobs;

#1.	Write a query to find the addresses (location_id, street_address, city, state_province, country_name) 
#of all the departments.Write a query to get the total salaries payable to employees.
SELECT d.DEPARTMENT_NAME,lo.LOCATION_ID, lo.STREET_ADDRESS, lo.CITY, lo.STATE_PROVINCE, c.COUNTRY_NAME, SUM(e.SALARY) AS TOTAL_SALARIES
FROM locations AS lo
JOIN countries AS c ON c.COUNTRY_ID = lo.COUNTRY_ID
JOIN departments AS d ON d.LOCATION_ID = lo.LOCATION_ID
JOIN employees AS e ON e.MANAGER_ID = d.MANAGER_ID
GROUP BY d.DEPARTMENT_NAME, lo.LOCATION_ID, lo.STREET_ADDRESS, lo.CITY, lo.STATE_PROVINCE,c.COUNTRY_NAME
ORDER BY TOTAL_SALARIES

#2.	Write a query to find the name (first_name, last name), department ID and name of all the employees.
SELECT CONCAT(e.FIRST_NAME, ' ' ,e.LAST_NAME) AS EMPLOYEE_NAME, e.DEPARTMENT_ID, d.DEPARTMENT_NAME
FROM employees AS e 
JOIN departments AS d ON d.DEPARTMENT_ID = e.DEPARTMENT_ID

#3.	Write a query to find the name (first_name, last_name), job, department ID and name of the employees who works in London.
SELECT CONCAT(e.FIRST_NAME, ' ' ,e.LAST_NAME) AS EMPLOYEE_NAME, e.DEPARTMENT_ID, j.JOB_TITLE
FROM employees AS e 
JOIN jobs AS j ON j.JOB_ID = e.JOB_ID
JOIN departments AS d ON d.MANAGER_ID = e.MANAGER_ID
JOIN locations AS lo ON lo.LOCATION_ID = d.LOCATION_ID
WHERE lo.CITY = 'London';

SELECT CONCAT(e.FIRST_NAME, ' ' ,e.LAST_NAME) AS EMPLOYEE_NAME, e.DEPARTMENT_ID, j.JOB_TITLE
FROM employees AS e 
JOIN jobs AS j ON j.JOB_ID = e.JOB_ID
JOIN departments AS d ON d.MANAGER_ID = e.MANAGER_ID
WHERE e.MANAGER_ID = 203;

#4.	Write a query to find the employee id, name (last_name) along with their manager_id and name (last_name).
SELECT emp.EMPLOYEE_ID, CONCAT(emp.FIRST_NAME, ' ', emp.LAST_NAME) AS EMPLOYEE_NAME, man.EMPLOYEE_ID, CONCAT(man.FIRST_NAME,' ',man.LAST_NAME) AS MANAGER_NAME
FROM employees AS man , employees AS emp
WHERE man.EMPLOYEE_ID = emp.MANAGER_ID

#5.	Write a query to find the name (first_name, last_name) and hire date of the employees who was hired after 'Jones'.
SELECT CONCAT(e.FIRST_NAME, ' ' ,e.LAST_NAME) AS EMPLOYEE_NAME, e.HIRE_DATE
FROM employees AS e 
WHERE e.HIRE_DATE > (SELECT em.HIRE_DATE FROM employees AS em WHERE em.EMPLOYEE_ID = 195);

#6.	Write a query to get the department name and number of employees in the department.
SELECT d.DEPARTMENT_NAME, COUNT(em.EMPLOYEE_ID), ma.MANAGER_ID
FROM employees AS em, employees AS ma
JOIN departments AS d ON d.MANAGER_ID = ma.MANAGER_ID
WHERE ma.EMPLOYEE_ID = em.MANAGER_ID
GROUP BY d.DEPARTMENT_NAME, ma.MANAGER_ID


#7.	Write a query to find the employee ID, job title, number of days between ending date and starting date for all jobs in department 90.

#8.	Write a query to display the department ID and name and first name of manager.
SELECT d.DEPARTMENT_NAME, e.FIRST_NAME
FROM departments AS d
JOIN employees AS e ON e.EMPLOYEE_ID = d.MANAGER_ID

#9.	Write a query to display the department name, manager name, and city.
SELECT d.DEPARTMENT_NAME,  CONCAT(e.FIRST_NAME, ' ' ,e.LAST_NAME) AS EMPLOYEE_NAME, l.CITY
FROM departments AS d
JOIN employees AS e ON e.EMPLOYEE_ID = d.MANAGER_ID
JOIN locations AS l ON l.LOCATION_ID = d.LOCATION_ID

#10.	Write a query to display the job title and average salary of employees.
SELECT j.JOB_TITLE, ROUND(AVG(e.SALARY),2) AS SALARY_AVG
FROM employees AS e
JOIN jobs AS j ON j.JOB_ID = e.JOB_ID
GROUP BY j.JOB_TITLE
#11.	Write a query to display job title, employee name, and the difference between salary of the employee 
#and minimum salary for the job.
SELECT 
FROM 
#12.	Write a query to display the job history that were done by any employee who is currently drawing 
#more than 10000 of salary.
#13.	Write a query to display department name, name (first_name, last_name), hire date, salary of the
# manager for all managers whose experience is more than 15 years.


