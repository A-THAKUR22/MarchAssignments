-- 1.Write a MySQL query to find the addresses (location_id, street_address, city, state_province, country_name) of all the departments.

SELECT * FROM countries;
SELECT * FROM locations;

 SELECT l.location_id, l.street_address, l.city, l.state_province , c.country_name FROM locations l JOIN countries c ON l.country_id=c.country_id;
 
 
 -- 2.Write a MySQL query to find the name (first_name, last name), department ID and name of all the employees.
 
 SELECT * FROM employees;
 SELECT * FROM departments;
 
 SELECT e.FIRST_NAME, e.LAST_NAME, d.DEPARTMENT_ID, d.DEPARTMENT_NAME FROM employees e JOIN departments d ON e.DEPARTMENT_ID=d.DEPARTMENT_ID;

-- 3.Write a MySQL query to find the name (first_name, last_name), job, department ID and name of the employees who works in London.

 SELECT e.FIRST_NAME, e.LAST_NAME, d.DEPARTMENT_ID, d.DEPARTMENT_NAME FROM employees e JOIN departments d ON e.DEPARTMENT_ID=d.DEPARTMENT_ID WHERE LOCATION_ID=2400;
 
 -- 4.Write a MySQL query to find the employee id, name (last_name) along with their manager_id and name (last_name).
 
 SELECT e1.EMPLOYEE_ID , e1.LAST_NAME AS Employee , e1.MANAGER_ID AS Mgr_Id, e2.LAST_NAME AS Manager FROM employees e1 JOIN employees e2 ON e1.MANAGER_ID = e2.EMPLOYEE_ID;