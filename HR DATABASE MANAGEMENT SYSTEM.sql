--1)WRITE A QUERY FOR  SELECT STATEMENTS;

--A. To get data from all the rows and columns in the employees table:

Select * From employees;

--B. select data from the employee id, first name, last name, and hire date of all rows in the employees table:

Select employee_id,first_name,last_name,hire_date
From employees;

--C. to get the first name, last name, salary, and new salary:

Select first_name,last_name,salary
From employees;

--D. Increase the salary two times and named as New_SALARY from employees table:

Select employee_id,(Salary*2) As New_salary
From employees;

--2)WRITE A QUERY FOR ORDER BY  STATEMENTS :-

--A. returns the data from the employee id, first name, last name, hire date, and salary column of the employees table:

Select employee_id,first_name,last_name,hire_date,salary
From employees;

--B. to sort employees by first names in alphabetical order:

Select first_name
From employees
Order By first_name Asc;

--C. to sort the employees by the first name in ascending order and the last name in descending order:

Select first_name,last_name
From employees
Order By first_name asc,last_name desc;

--D. to sort employees by salary from high to low:

Select salary
From employees
Order By salary Desc;

--E. to sort the employees by values in the hire_date column from:

Select hire_date
From employees
Order By hire_date Asc;

--F.sort the employees by the hire dates in descending order:

Select hire_date
From employees
Order By hire_date desc;

--3)WRITE A QUERY FOR DISTINCT  STATEMENTS :-

--A. selects the salary data from the salary column of the employees table and sorts them from high to low:

Select salary
From employees
Order By salary Desc;

--B. select unique values from the salary column of the employees table:

Select DISTINCT salary
From employees;

--C. selects the job id and salary from the employees table:

Select job_id, salary
From employees;

--D. to remove the duplicate values in job id and salary:

Select  job_id,salary
From employees
Group by job_id,salary;

--E. returns the distinct phone numbers of employees:

Select DISTINCT phone_number
From employees;

--4) WRITE A QUERY FOR TOP N  STATEMENTS :-

--A. to return the first 5 rows in the result set returned by the SELECT clause:

Select Top 5 *
From employees;

--B. to return five rows starting from the 4th row:

Select *
From employees
Order By employee_id
Offset 3 Rows Fetch Next 5 Rows Only;

--C. gets the top five employees with the highest salaries.

Select Top 5 salary
From employees
Order By salary Desc;

--D. to get employees who have the 2nd highest salary in the company.

Select salary
From employees
Order By salary Desc
Offset 1 Rows Fetch Next 1 Rows Only;

--5). WRITE A QUERY FOR WHERE  CLAUSE and COMPARISON OPERATORS :-

--A. query finds employees 
--who have salaries greater than 14,000 and sorts the results sets based on the salary in descending order.

Select *
From employees
where salary > 14000 
Order By salary desc;

--B. query finds all employees who work in the department id 5.

Select *
From employees
Where department_id = 5;

--C. query finds the employee whose last name is Chen.

Select *
From employees
where last_name = 'Chen';

--D. To get all employees who joined the company after January 1st, 1999.

Select *
From employees
where hire_date > '1999-01-01';

--E. to find the employees who joined the company in 1999,

Select * 
From employees
Where Year(hire_date) = '1999';

--F. statement finds the employee whose last name is Himuro

Select * 
From employees
Where last_name = 'Himuro';

--G. the query searches for the string Himuro in the last_name column of the employees table.

Select *
From employees
where last_name Like '%Himuro%';

--H. to find all employees who do not have phone numbers:

Select *
From employees
where phone_number IS NULL;

--I. returns all employees whose department id is not 8.

Select *
From employees
where department_id != 8;

Select *
From employees
where department_id <> 8;

--J. finds all employees whose department id is not eight and ten.

Select *
From employees
where department_id NOT IN (8,10);

--K. to find the employees whose salary is greater than 10,000.

Select *
From employees
where salary > 10000;

--L. finds employees in department 8 and have the salary greater than 10,000.

Select *
From employees
Where department_id = 8 AND salary > 10000;

--M. the statement below returns all employees whose salaries are less than 10,000:

Select *
From employees
where salary < 10000;

--N. finds employees whose salaries are greater than or equal 9,000.

Select *
From employees
where salary >= 9000;

--O. finds employees whose salaries are less than or equal to 9,000:

Select *
From employees
where salary <= 9000;

--6) WRITE A QUERY FOR:-

CREATE  TABLE  projects (
    project_id  INT  PRIMARY KEY,
    project_name  VARCHAR(255),
    start_date  DATE  NOT NULL,
    end_date  DATE  NOT NULL
);

CREATE  TABLE  project_milestones(
    milestone_id  INT  PRIMARY KEY,
    project_id   INT,
    milestone_name VARCHAR(100)
);

--A. Write a Query to add an SQL FOREIGN KEY constraint to the project_milestones table to enforce the 
--relationship between the projects and project_milestones tables.

ALTER TABLE PROJECT_MILESTONES
ADD CONSTRAINT FK_PROJECT_MILESTONES
FOREIGN KEY (MILESTONE_ID) REFERENCES PROJECTS (PROJECT_ID);

--TASK 2:

--1)WRITE A QUERY FOR  LOGICAL OPERATORS and OTHER ADVANCED OPERATORS:-

--A. finds all employees whose salaries are greater than 5,000 and less than 7,000:

Select *
From employees
Where salary between 5000 AND 7000;

--B. finds employees whose salary is either 7,000 or 8,000:

Select *
from employees
where salary=7000 or salary=8000;

SELECT *
FROM employees
WHERE salary IN (7000, 8000);

--C. finds all employees who do not have a phone number:

Select *
From employees
where phone_number IS NULL;

--D. finds all employees who work in the department id 8 or 9.

Select * 
From employees
where department_id IN (8,9);


Select * 
From employees
where department_id = 8 OR department_id = 9;

--F. finds all employees whose first name starts with the string jo.

Select *
From employees
where first_name LIKE 'JO%';

--G. finds all employees with the first names whose the second character is  h.

Select *
From employees
where first_name LIKE '_h%';

--H. finds all employees whose salaries are greater than all salaries of employees in the department 8:

Select employee_id From employees where salary  > all
(Select salary
From employees Where department_id=8);

--Part 2:- 

--A. finds all employees whose salaries are greater than the average salary of every department:

 Select * 
 From employees 
 where salary > ALL (
                  Select AVG(salary) As Average_salary 
				  From employees
				  Group By department_id) ;

--B. finds all employees who have dependents:

Select * From dependents;
Select * From employees;

Select E.*
From employees E
JOIN Dependents D ON E.employee_id = D.Employee_id
Order By Employee_ID asc;

SELECT *
FROM employees e
WHERE EXISTS (
    SELECT 1
    FROM dependents d
    WHERE e.employee_id = d.employee_id
);

--C. to find all employees whose salaries are between 2,500 and 2,900:

Select *
From employees
where salary Between 2500 AND 2900;

--D. find all employees whose salaries are not in the range of 2,500 and 2,900:

Select * 
From employees
Where salary NOT IN (2500,2900);

--E. to find all employees who joined the company between January 1, 1999, and December 31, 2000:

Select *
From employees 
where hire_date Between '1999-01-01' AND '2000-12-31';

--F. to find employees who have not joined the company from January 1, 1989 to December 31, 1999:

Select *
From employees
Where hire_date NOT BETWEEN '1989-01-01' AND '1999-12-31';

Use hr_database_management_system;

--G. to find employees who joined the company between 1990 and 1993:

Select *
From employees 
Where Hire_date BETWEEN '1990-01-01' AND '1993-12-31';

--Part 3:-

--A. to find all employees whose first names start with Da.

Select *
From employees
where first_name LIKE 'Da%';

--B. to find all employees whose first names end with er.

Select *
From employees 
Where first_name LIKE '%er';

--C. to find employees whose last names contain the word an:
Select *
From employees
Where first_name LIKE '%an%';

--D. retrieves employees whose first names start with Jo and are followed by at most 2 characters:

Select *
From employees
Where first_name LIKE 'JO__';

--E. to find employees whose first names start with any number of characters and are followed by at most one character:

Select *
From employees
Where first_name LIKE '%_';

--F. to find all employees whose first names start with the letter S but not start with Sh:

Select *
From employees
Where first_name LIKE 'S%' 
AND first_name NOT LIKE 'Sh%';

--Part 4:-

--A. retrieves all employees who work in the department id 5.

Select *
From employees 
Where department_id = '5';

--B. To get the employees who work in the department id 5 and with a salary not greater than 5000.

Select *
From employees 
Where department_id='5' 
AND salary < 5000;

--C. statement gets all the employees who are not working in the departments 1, 2, or 3.

Select *
From employees
Where department_id NOT IN (1,2,3);

--D. retrieves all the employees whose first names do not start with the letter D.

Select * 
From employees
Where first_name NOT LIKE 'D%';

--E. to get employees whose salaries are not between 5,000 and 1,000.

Select *
From employees
Where salary NOT BETWEEN 1000 AND 5000;

--Part 5:- 

--A. Write a query to get the employees who do not have any dependents by above image.

Select E.*
From employees E
INNER JOIN dependents D ON E.employee_id=D.employee_id
Where D.dependent_id IS NULL;

--B. To find all employees who do not have the phone numbers.

Select *
From employees
Where phone_number IS NULL
  OR phone_number = '';
  
--C. To find all employees who have phone numbers

Select *
From employees
Where phone_number IS NOT NULL
  OR phone_number = '';

--TASK 3:

--1) Write a Query to :
--A. To get the information of the department id 1,2, and 3:

Select * 
From departments
Where department_id IN (1, 2, 3);

--B. To get the information of employees who work in the department id 1, 2 and 3:

Select E.*
From employees E
INNER JOIN departments D ON E.department_id=D.department_id
Where D.department_id in (1,2,3);

--C. Write a Query to get the first name, last name, job title, 
--and department name of employees who work in department id 1, 2, and 3.

Select E.first_name, E.last_name, J.job_title, D.department_name
From employees E
INNER JOIN departments D ON E.department_id=D.department_id
INNER JOIN Jobs J ON J.job_id=D.department_id
where D.department_id IN (1,2,3);

--D. To query the country names of US, UK, and China.

Select country_name
From countries
Where country_id in ('US','UK','CN');

--E. Query retrieves the locations located in the US, UK and China.

Select *
From locations
Where country_id IN ('US','UK','CN');

--C. To join the countries table with the locations table.

Select C.*,L.*
From countries C
INNER JOIN locations L ON C.country_id=L.country_id;

--D. to find the country that does not have any locations in the locations table.

Select C.Country_name
From countries C 
INNER JOIN	locations L ON C.country_id=L.country_id
Where L.country_id IS NULL;

--E. Write a query to join 3 tables: regions, countries, and locations.

Select R.*,C.*,L.*
From regions R 
INNER JOIN countries C ON R.region_id = C.region_id
INNER JOIN locations L ON L.country_id=C.country_id;

--Questions:-
--The manager_id column specifies the manager of an employee. 
--Write a query  statement to  joins the employees table to itself to query the information of who reports to whom.

Select * From employees;

Select  E1.employee_id , 
      E2.manager_id,
	   Concat(E1.First_name,' ',E1.Last_name) AS Employee_Name
From employees E1 
INNER JOIN employees E2 ON E1.employee_id=E2.manager_id;

--TASK 4:

--Write a  Query 
--A. to group the values in department_id column of the employees table:

Select department_id, COUNT(*) As Employee_Count
From employees 
Group By department_id;

--B. to count the number of employees by department:

Select * From employees;

Select department_id, COUNT(*) As Employee_Count
From employees 
Group By department_id;

--E. to find departments with headcounts are greater than 5.

Select department_id, COUNT(*) As HeadCounts
From employees
Group By department_id
Having COUNT(*) > 5
Order By HeadCounts;

--F. returns the minimum, maximum and average salary of employees in each department.

Select department_Id,
MIN(salary) As Minimum_employees,
MAX(salary) As Maximum_employees,
AVG(salary) As Average_employees 
From employees
Group By department_Id
Order By department_id;

--G. To get the total salary per department.

Select Department_id, Sum(salary) as Total_salary
From employees
Group By department_id;

--H. groups rows with the same values both department_id and job_id columns in the 
--same group then return the rows for each of these groups

Select department_id, job_id, COUNT(*) AS num_employees
From employees
Group By department_id, job_id
Having COUNT(*) > 1
Order By department_id, job_id;

--Questions:-
--Write a Query 
--A. To get the managers and their direct reports, and to group employees by the managers and to count the direct reports.

SELECT m.employee_id AS manager_id,
       CONCAT(M.First_name,' ',m.last_name) AS manager_name,
       COUNT(e.employee_id) AS direct_reports
FROM employees m
LEFT JOIN employees e ON m.employee_id = e.manager_id
GROUP BY m.employee_id,  CONCAT(M.First_name,' ',m.last_name)
ORDER BY m.employee_id;

--B. To find the managers who have at least five direct reports.

Select m.employee_id AS manager_id,
       CONCAT(M.First_name,' ',m.last_name) AS manager_name,
       COUNT(e.employee_id) AS direct_reports
From employees m
LEFT JOIN employees e ON m.employee_id = e.manager_id
Group By m.employee_id,  CONCAT(M.First_name,' ',m.last_name)
Having  COUNT(e.employee_id) >=5
Order By m.employee_id;

--C. calculates the sum of salary that 
--the company pays for each department and selects only the departments with the sum of salary between 20000 and 30000.

Select department_id,SUM(Salary) As Total_salary
From employees
Group By department_id
Having SUM(salary) BETWEEN 20000 AND 30000
Order By Total_salary ;

--D. To find the department that has employees with the lowest salary greater than 10000.

Select department_id,MIN(salary) as Lowest_salary
From employees
Group by department_id
Having MIN(Salary) > 10000
Order By Lowest_salary;

--E. To find the departments that have the average salaries of employees between 5000 and 7000.

Select department_id, AVG(salary) as average_salaries
From employees
Group by department_id
Having AVG(salary) Between 5000 AND 7000
Order by average_salaries;

F. Write a Query to combine the first name and last name of employees and dependents

Select first_name, last_name
From employees
UNION ALL
Select first_name, last_name
From dependents;

Select first_name, last_name
From employees
UNION 
Select first_name, last_name
From dependents;

--Write a Query 
--A. finds all employees who have at least one dependent.

Select e.employee_id 
From employees e
Where EXISTS (
    Select 1
    From dependents d
    Where d.employee_id = e.employee_id);

--B. finds employees who do not have any dependents.

Select e.employee_id 
From employees e
Where NOT EXISTS (
    Select 1
    From dependents d
    Where d.employee_id = e.employee_id);

--B. Write a Query  If the salary is less than 3000, the CASE expression returns “Low”.
--If the salary is between 3000 and 5000, it returns “average”. When the salary is greater than 5000, the CASE expression returns “High

Select employee_id, CONCAT(first_name,' ',last_name) AS EMPLOYEE_NAME,
CASE 
WHEN Salary < 3000 THEN 'Low'
WHEN Salary Between 3000 AND 5000 THEN 'AVERAGE'
WHEN Salary > 5000 THEN 'High'
Else 'Nothing'
END AS Salary_Category
From employees;

--Write a Query to update Sarah’s last name from  Bell to Lopez

Update employees set last_name='Lopez' Where employee_id='192';

Select first_name,last_name
From employees 
Where employee_id = 192;