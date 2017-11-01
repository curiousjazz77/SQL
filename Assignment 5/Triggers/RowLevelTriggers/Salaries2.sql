/*learning aid*/

/*
Salaries.sql
Eric J. Schwabe
CSC 355 Fall 2017

edits made on 10/31/17
*/
-- Trigger example modified from Elmasri&Navathe, Sec 26.1
-- First, build the EMPLOYEE and DEPARTMENT tables

DROP TABLE EMPLOYEE CASCADE CONSTRAINTS; 
DROP TABLE DEPARTMENT CASCADE CONSTRAINTS;


CREATE TABLE DEPARTMENT
(
      DNo         NUMBER(1, 0),
      DName       VARCHAR2(20),
      TotalSalary NUMBER(9, 2),
      PRIMARY KEY (Dno)
);
CREATE TABLE EMPLOYEE
(
      EID         CHAR(3),
      Name        VARCHAR2(20),
      DNo         NUMBER(1, 0) NOT NULL,
      Salary      NUMBER(9,2),
      PRIMARY KEY (EID),
      FOREIGN KEY (DNo)
            REFERENCES DEPARTMENT(DNo)
);
-- Triggers here ... may be commented out ...

-- This trigger updates the total salary for a department -- when an employee is added to that department
CREATE OR REPLACE TRIGGER AddingEmployee
      AFTER INSERT ON EMPLOYEE
      --after insert only changes one row at a time. need row level trigger here
      FOR EACH ROW
      --Wont work unless have "for each row" above. 
      
BEGIN
DBMS_OUTPUT.PUT_LINE('Adding new employee ' || :new.EID ); UPDATE DEPARTMENT
SET TotalSalary = TotalSalary + :new.Salary WHERE Dno = :new.Dno;
END; 
/


/* This trigger updates the total salary for a department
when an employee in that department has their salary changed*/


CREATE OR REPLACE TRIGGER ChangingSalary
    AFTER UPDATE OF Salary ON EMPLOYEE
FOR EACH ROW

BEGIN
    DBMS_OUTPUT.PUT_LINE('Changing salary for an employee ' || :new.EID); 
    UPDATE DEPARTMENT
    SET TotalSalary = TotalSalary + :new.Salary - :old.Salary 
    WHERE Dno = :new.Dno;
END; 
/


-- This trigger updates the total salary for two departments 
-- when a employee is moved from one department to another
CREATE OR REPLACE TRIGGER ChangingDepartment 
    AFTER UPDATE OF Dno ON EMPLOYEE
FOR EACH ROW

BEGIN
    DBMS_OUTPUT.PUT_LINE('Changing department for an employee ');
    UPDATE DEPARTMENT
    SET TotalSalary = TotalSalary + :new.Salary 
    WHERE Dno = :new.Dno;
    
    UPDATE DEPARTMENT
    SET TotalSalary = TotalSalary - :old.Salary 
    WHERE Dno = :old.Dno;
END; 
/


-- This trigger updates the total salary for a department -- when a employee is deleted
CREATE OR REPLACE TRIGGER RemovingEmployee 
    AFTER DELETE ON EMPLOYEE
FOR EACH ROW

BEGIN
    DBMS_OUTPUT.PUT_LINE('Removing employee ' || :old.EID); 
    UPDATE DEPARTMENT
    SET TotalSalary = TotalSalary - :old.Salary 
    WHERE Dno = :old.Dno;
END; 
/

-- Populate the tables
INSERT INTO DEPARTMENT VALUES ('1', 'Admin', 0);
INSERT INTO DEPARTMENT VALUES ('2', 'CDM', 0);
INSERT INTO DEPARTMENT VALUES ('3', 'SoC', 0);
INSERT INTO EMPLOYEE VALUES
      ('990', 'Holtschneider', '1', 400000);
INSERT INTO EMPLOYEE VALUES
      ('454', 'DenBoer', '1', 300000);
INSERT INTO EMPLOYEE VALUES
      ('197', 'Miller', '2', 250000);
INSERT INTO EMPLOYEE VALUES
      ('660', 'Epp', '2', 200000);
INSERT INTO EMPLOYEE VALUES
      ('823', 'Furst', '3', 125000);
INSERT INTO EMPLOYEE VALUES
      ('123', 'Schwabe', '3', 100000);
SELECT * FROM EMPLOYEE;
SELECT * FROM DEPARTMENT;
