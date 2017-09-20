/* 
Jasmine Omeke
CSC 453 
Section: 710
Assignment 2 
Sep 22, 2017
*/

/*
1. average salary of all male employees.

*/

SELECT AVG(Salary) FROM EMPLOYEE WHERE Gender ='M';

/*
2. List just the first name of all employees who have a daughter 
with the same first name as them.

*/

Select FName FROM 
(EMPLOYEE E INNER JOIN DEPENDENT D ON E.Ssn=D.Essn)
WHERE E.FNAME = D.DependentName;

/*
3. List the names of all employees who are directly supervised by Fred Wong.

*/

Select FName, LName FROM 
(EMPLOYEE E LEFT OUTER JOIN DEPARTMENT I ON E.SuperSsn=I.MgrSsn)
WHERE E.SuperSsn = '333445665';

/*
4. For each project, display the project name and number and 
the total hours per week (by all employees) spent on that project.
(List the projects in ascending order by project number.)
*/

Select Pname, Pno, SUM(Hours) FROM 
(PROJECT P LEFT OUTER JOIN WORKSON W ON P.Pnumber=W.Pno)
GROUP BY Pno, Pname
ORDER BY Pno ASC;

/*
5. List the SSNs of all employees who do not work on any project. 
(In other words, look at the list of projects given in the PROJECT table, 
and display the SSNs of all employees who work on none of them.)
*/

Select Ssn FROM 
(EMPLOYEE E LEFT OUTER JOIN WORKSON W ON E.Ssn=W.Essn)
WHERE W.Pno IS NULL;

/*
6. For each department, display the department number and the average salary
of all employees working in that department.  Order the output from the highest 
average salary to the lowest.
*/

Select Dname, Dno, AVG(Salary) FROM 
(EMPLOYEE E INNER JOIN DEPARTMENT I ON E.Dno=I.Dnumber)
GROUP BY Dname, Dno
ORDER BY AVG(Salary) DESC;

/*
7. List the names of all employees in department 2 who work more than 10 hours 
per week on the ProductA project.
*/

Select FName, LName /*, Dno, Pname, Sum(Hours) */ FROM 
((EMPLOYEE E INNER JOIN WORKSON W ON E.Ssn=W.Essn)
INNER JOIN PROJECT P ON W.Pno=P.Pnumber)
WHERE Dno = 2 AND Pname = 'ProductA'
GROUP BY Fname, LName, Dno, Pname
HAVING SUM(Hours) >10
ORDER BY FName, LName;


/*
8. For each department with at most three employees, display the department name 
and the number of employees in that department.
*/

SELECT Dname, Count(E.Ssn) NumberEmployees FROM
(DEPARTMENT I FULL OUTER JOIN EMPLOYEE E ON I.Dnumber=E.Dno)
GROUP BY Dname
HAVING COUNT(E.Ssn) <= 3;


/*
9. List the last names and salaries of all employees who work in the same department 
as the employee who has the lowest salary overall.

*/

SELECT FName, LName FROM
(DEPARTMENT I FULL OUTER JOIN EMPLOYEE E ON I.Dnumber=E.Dno)
WHERE Dno = 
(SELECT Dno FROM
(DEPARTMENT I FULL OUTER JOIN EMPLOYEE E ON I.Dnumber=E.Dno)
WHERE Salary = (SELECT MIN(SALARY) FROM EMPLOYEE))

AND Salary !=(SELECT MIN(SALARY) FROM EMPLOYEE)

;


/*
10. Retrieve the names of all employees whose supervisor's supervisor has SSN '121231555'.
*/


SELECT FName, LName  FROM
(DEPARTMENT I FULL OUTER JOIN EMPLOYEE E ON I.Dnumber=E.Dno)
WHERE SuperSsn = 

(SELECT Ssn FROM
(DEPARTMENT I FULL OUTER JOIN EMPLOYEE E ON I.Dnumber=E.Dno)
WHERE Ssn = '121231555')
;

