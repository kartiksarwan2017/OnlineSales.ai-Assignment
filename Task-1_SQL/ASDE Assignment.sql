/* PROBLEM STATEMENT: Fetch top 3 departments along with their name and average monthly salary. */

/* Initially creating a database company which is consists of tables Departments, Employees, Salaries */
CREATE DATABASE Company;

/* To see the list of all databases */
SHOW DATABASES;  

/* use the database company */
USE Company;

/* Creating table schema for the Departments */
CREATE TABLE Departments (
   Dept_ID int, 
   Dept_Name varchar(40),
   PRIMARY KEY (Dept_ID)
);

/* Creating table schema for the Employees */
CREATE TABLE Employees (
   Emp_ID int, 
   Emp_Name varchar(40),
   Dept_ID int,
   PRIMARY KEY (Emp_ID),
   FOREIGN KEY (Dept_ID) REFERENCES Departments(Dept_ID)
);

/* Creating table schema for the Salaries */
CREATE TABLE Salaries (
     Emp_ID int,
     Month int,
     Amount int
); 


/* Displaying the table records */
SELECT * FROM Departments;
SELECT * FROM Employees;
SELECT * FROM Salaries;


/* Importing the Departments's records from the CSV file into the Departments Table */
SET GLOBAL local_infile=true;
LOAD DATA LOCAL INFILE  "D:/ASDE_Assessment/Task-1_SQL/Departments.csv"
INTO TABLE Departments
FIELDS TERMINATED BY ","
LINES TERMINATED BY "\n"
IGNORE 1 rows;

SELECT * FROM Departments;

/* Importing the Employee's records from the CSV file into the Employees Table */
LOAD DATA LOCAL INFILE  "D:/ASDE_Assessment/Task-1_SQL/Employees.csv"
INTO TABLE Employees
FIELDS TERMINATED BY ","
LINES TERMINATED BY "\n"
IGNORE 1 rows;

SELECT * FROM Employees;

/* Importing the Salary's records from the CSV file into the Salaries Table */
LOAD DATA LOCAL INFILE  "D:/ASDE_Assessment/Task-1_SQL/Salaries.csv"
INTO TABLE Salaries
FIELDS TERMINATED BY ","
LINES TERMINATED BY "\n"
IGNORE 1 rows;

SELECT * FROM Salaries;


/* The query joins the "Departments," "Employees," and "Salaries" tables based on their respective IDs, calculates the average salary
 per department using the AVG() function on the "Amount" column, groups the results by department name, 
 orders them in descending order by average salary, and limits the output to the top 3 departments. */
 
SELECT d.Dept_Name AS "DEPT_NAME", AVG(s.Amount) AS "AVG_MONTHLY_SALARY(USD)" FROM departments d
JOIN Employees e ON d.Dept_ID = e.Dept_ID JOIN salaries s ON e.Emp_ID = s.Emp_ID
GROUP BY d.Dept_Name ORDER BY AVG(s.Amount) DESC
LIMIT 3;


















