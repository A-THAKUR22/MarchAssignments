-- Write a MySQL query to find the name (first_name, last_name) and hire date of the employees who was hired after 'Jones'.

SELECT * FROM employees;
 SELECT FIRST_NAME , LAST_NAME , HIRE_DATE FROM employees LIMIT 9 OFFSET 96;
 
 -- Write a MySQL query to get the department name and number of employees in the department.
 SELECT * FROM departments;
 SELECT d.DEPARTMENT_NAME,  COUNT(e.EMPLOYEE_ID) AS Number_of_Employees FROM employees e JOIN departments d ON e.DEPARTMENT_ID = d.DEPARTMENT_ID GROUP BY d.DEPARTMENT_NAME;
 
 
 -- Write a MySQL query to find the employee ID, job title, number of days between ending date and starting date for all jobs in department 90 from job history.
 
 SELECT * FROM job_history;
 SELECT * FROM jobs;
 
  SELECT jh.employee_id, j.job_title, DATEDIFF(jh.end_date, jh.start_date) AS Number_of_days FROM job_history jh JOIN jobs j ON j.job_id=jh.job_id WHERE jh.department_id=90;
  
  
  -- Write a MySQL query to display the department ID and name and first name of manager.
  
   SELECT e.DEPARTMENT_ID , d.MANAGER_ID, e.FIRST_NAME, d.DEPARTMENT_NAME FROM employees e JOIN departments d ON e.DEPARTMENT_ID=d.DEPARTMENT_ID WHERE e.EMPLOYEE_ID=d.MANAGER_ID;
   
   -- Write a MySQL query to display the department name, manager name, and city.
   
   SELECT e.DEPARTMENT_ID, d.MANAGER_ID, e.FIRST_NAME, d.DEPARTMENT_NAME, l.city
FROM employees e
JOIN departments d ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
JOIN locations l ON l.location_id = d.LOCATION_ID
WHERE e.EMPLOYEE_ID = d.MANAGER_ID;

-- Write a MySQL query to display the job title and average salary of employees.

SELECT j.JOB_TITLE, AVG(e.SALARY) FROM jobs j JOIN employees e ON e.JOB_ID = j.JOB_ID GROUP BY JOB_TITLE;