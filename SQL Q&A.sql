create database company;
use company;
-- 1. Write an SQL statement to create a table named Departments with the following columns:
-- dept_id (Primary Key, INT)
-- department_name (VARCHAR(50))

CREATE TABLE Departments (
    dept_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);

-- 2. Alter the Employees table to add a new column email of type VARCHAR(100).

create table Employe (emp_id int primary key, first_name varchar(50), last_name varchar(50), salary decimal(10,2),
    dept_id int);
    
ALTER TABLE Employe
ADD email VARCHAR(100);
 
-- 3.Insert three employee records into the Employees table with emp_id, first_name, last_name, salary, and department_id.

INSERT INTO Employe (emp_id, first_name, last_name, salary, dept_id)
VALUES
    (1, 'Amit', 'Sharma', 55000, 101),
    (2, 'Priya', 'Verma', 60000, 102),
    (3, 'Rahul', 'Mehta', 75000, 101);

-- 4.Write an SQL statement to update the salary of all employees in department 101 by 15%.

UPDATE Employe
SET salary = salary * 1.15
WHERE dept_id = 101;

-- 5.Delete all employees whose salary is less than 40,000.

DELETE FROM Employe
WHERE salary < 40000;

-- 6. Write a query to display the total salary of all employees using the SUM() function.

SELECT SUM(salary) AS total_salary
FROM Employe;

-- 7.Write a query to display the highest and lowest salary in the Employees table using MAX() and MIN().

SELECT MAX(salary) AS highest_salary,MIN(salary) AS lowest_salary FROM Employe;

-- 8.Write a query to display employee names in uppercase using the UPPER() function.

SELECT UPPER(first_name) AS first_name_upper,UPPER(last_name) AS last_name_upper
FROM Employe;

-- 9. Write a query using an INNER JOIN to display employees along with their department names.

select e.emp_id, e.first_name, e.last_name, e.salary, d.department_name from Employe e inner join Departments d on e.department_id = d.dept_id;

-- 10. Write a query using a LEFT JOIN to display all employees, even if they do not belong to any department.

select e.emp_id, e.first_name, e.last_name, e.salary, d.department_name from Employe e left join Departments d on e.department_id = d.dept_id;

-- 11. Write a query to find the total number of employees in the Employees table using an aggregate function.

select  count(*) as total_employees from Employe;

-- 12. Write a query to display the average salary of employees in each department using AVG().

select department_id, avg(salary) as average_salary from Employe group by department_id;

-- 13. Write a query to display employee names where the last 3 characters of their first name are shown using the SUBSTRING() (or RIGHT()) function.

 select first_name, right(first_name, 3) as last_three_chars from Employe;

-- 14. Write a query to display the current date and time using a date/time function.

SELECT GETDATE() AS current_datetime;

SELECT NOW() AS current_datetime;

-- 15. Write a query to display the length of each employee’s first name using the LENGTH() function.

select first_name, length(first_name) as name_length from Employe;









