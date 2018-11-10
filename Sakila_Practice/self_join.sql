
--self join
--like if in one table, we want to find out which employees are from the same city as Idiris

select a.first_name, a.last_name, b.first_name, b.last_name
from customer as a, customer as b
where a.first_name = b.last_name; --see which people have the same last/first name combo

select a.customer_id, a.first_name, a.last_name, b.customer_id, b.first_name, b.last_name
from customer as a, customer as b
where a.first_name = b.last_name; 

select a.customer_id, a.first_name, a.last_name, b.customer_id, b.first_name, b.last_name
from customer as a
join customer as b
on a.first_name = b.last_name
order by a.customer_id; 

select a.customer_id, a.first_name, a.last_name, b.customer_id, b.first_name, b.last_name
from customer as a
left join customer as b --works like an outer join
on a.first_name = b.last_name
order by a.customer_id; 

select a.customer_id, a.first_name, a.last_name, b.customer_id, b.first_name, b.last_name
from customer as a
right join customer as b --works like an outer join, including null matches
on a.first_name = b.last_name
order by a.customer_id;


/*
self join interview question:
https://blog.sqlauthority.com/2016/03/27/self-join-explain-example-interview-question-week-064/

USE TempDb
GO
-- Create a Table
CREATE TABLE Employee(
EmployeeID INT PRIMARY KEY,
Name NVARCHAR(50),
ManagerID INT
)
GO
-- Insert Sample Data
INSERT INTO Employee
SELECT 1, 'Mike', 3
UNION ALL
SELECT 2, 'David', 3
UNION ALL
SELECT 3, 'Roger', NULL
UNION ALL
SELECT 4, 'Marry',2
UNION ALL
SELECT 5, 'Joseph',2
UNION ALL
SELECT 7, 'Ben',2
GO
-- Check the data
SELECT *
FROM Employee
GO

-- Inner Join
SELECT e1.Name EmployeeName, e2.name AS ManagerName
FROM Employee e1
INNER JOIN Employee e2
ON e1.ManagerID = e2.EmployeeID
GO

https://www.programminginterviews.info/2013/03/sql-self-join-or-sub-query-interview-question-employee-manager-salary.html

Self-join solution:
select e.*, m.Salary as "Manager Salary" 
from Employee e 
join Employee m on e.ManagerId = m.Id
where e.Salary > m.Salary

Here you are "joining" Employee table to itself on the FK relation of ManagerId and then querying on salary.

Sub-query solution:
select * 
from Employee e 
where e.Salary > 
    (select m.Salary from Employee m 
    where e.ManagerId = m.Id)
	
*/
