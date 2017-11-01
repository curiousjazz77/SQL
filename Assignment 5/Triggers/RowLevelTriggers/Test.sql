@/Users/.../Salaries2.sql

DELETE FROM EMPLOYEE WHERE EID = '660';

DELETE FROM EMPLOYEE WHERE DNo = 1; -- delete entire department

UPDATE EMPLOYEE SET Salary = Salary * 1.10; --give everyone a 10% raise

UPDATE EMPLOYEE SET Salary = Salary - 15000 WHERE EID = '990'; --take $15K from a few employees

UPDATE EMPLOYEE SET DNo = 2 WHERE DNo = 1; --move everyone with the employee who moved
