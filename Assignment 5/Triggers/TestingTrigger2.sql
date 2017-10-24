@/Users/.../Workers.sql

INSERT INTO WORKERS VALUES('X', 4, 90000); 
INSERT INTO WORKERS VALUES('Y', 1, 45000); 
/*giving poeple a raise to everyone to check if still under 1 mil mimumimum*/ 
UPDATE WORKERS SET Salary = Salary + 1000; 
DELETE FROM WORKERS WHERE DeptNumber = 5;

/*output:

17 rows updated.
3 rows deleted.*/
