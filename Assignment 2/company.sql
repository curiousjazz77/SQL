/*
	company.sql
	Eric J. Schwabe
	CSC 355 Fall 2017

	Script to define and populate the example database
	COMPANY, modified from Chapter 5 of Elmasri and Navathe's
	Fundamentals of Database Systems...
*/

-- drop tables

DROP TABLE EMPLOYEE CASCADE CONSTRAINTS;
DROP TABLE DEPARTMENT CASCADE CONSTRAINTS;
DROP TABLE PROJECT CASCADE CONSTRAINTS;
DROP TABLE WORKSON CASCADE CONSTRAINTS;
DROP TABLE DEPENDENT CASCADE CONSTRAINTS;

-- create and populate tables

CREATE TABLE EMPLOYEE
(
	Fname		VARCHAR(20),
	Lname		VARCHAR(20),
	Ssn		CHAR(9),
	Bdate		DATE,
	Address		VARCHAR(30),
	Gender		CHAR(1),
	Salary		NUMBER(5),
	SuperSsn	CHAR(9),
	Dno		NUMBER(1),

	PRIMARY KEY (Ssn),
		
	FOREIGN KEY (SuperSsn)
		REFERENCES EMPLOYEE (Ssn)
);

INSERT INTO EMPLOYEE VALUES ('Susan', 'Wesley', '121231555', DATE '1960-01-01', '1010 Rockspring, Houston, TX', 'F', 75000, NULL, 1);
INSERT INTO EMPLOYEE VALUES ('John', 'Baines', '888665575', DATE '1947-11-10', '450 Stone, Houston, TX', 'M', 60000, '121231555', 1);
INSERT INTO EMPLOYEE VALUES ('Jennifer', 'Wallace', '987654321', DATE '1941-06-20', '291 Berry, Bellaire, Tx', 'F', 49000, '888665575', 3);
INSERT INTO EMPLOYEE VALUES ('Amelia', 'Zelaya', '999887777', DATE '1968-01-19', '3321 Castle, Spring, TX', 'F', 23000, '987654321', 3);
INSERT INTO EMPLOYEE VALUES ('Ahmed', 'Jabbar', '987987987', DATE '1969-03-29', '980 Dallas, Houston, TX', 'M', 33000, '987654321', 3);
INSERT INTO EMPLOYEE VALUES ('Fred', 'Wong', '333445665', DATE '1955-12-08', '638 Voss, Houston, TX', 'M', 42000, '888665575', 2);
INSERT INTO EMPLOYEE VALUES ('Jack', 'Smith', '123456789', DATE '1965-01-09', '731 Fondren, Houston, TX', 'M', 30000, '333445665', 2);
INSERT INTO EMPLOYEE VALUES ('Rakesh', 'Narayan', '666884444', DATE '1980-09-15', '975 Fire Oak, Humble, TX', 'M', 38000, '333445665', 2);
INSERT INTO EMPLOYEE VALUES ('Joanne', 'English', '453453453', DATE '1972-07-31', '5631 Rice, Houston, TX', 'F', 25000, '333445665', 2);
INSERT INTO EMPLOYEE VALUES ('Melinda', 'Jones', '808080808', DATE '1970-07-10', '1001 Western, Houston, TX', 'F', 27500, '333445665', 2);

CREATE TABLE DEPARTMENT
(
	Dname		VARCHAR(20),
	Dnumber		NUMBER(1),
	MgrSsn		CHAR(9),
	MgrStartDate	DATE,
	
	PRIMARY KEY (Dnumber),

	FOREIGN KEY (MgrSsn)
		REFERENCES EMPLOYEE (Ssn)
);

INSERT INTO DEPARTMENT VALUES ('Management', 1, '888665575', DATE '1981-06-19');
INSERT INTO DEPARTMENT VALUES ('Research', 2, '333445665', DATE '1988-05-22');
INSERT INTO DEPARTMENT VALUES ('Marketing', 3, '987654321', DATE '1995-01-01');


-- this alter is needed to allow PROJECT and DEPARTMENT to reference each other

ALTER TABLE EMPLOYEE ADD FOREIGN KEY (Dno) REFERENCES DEPARTMENT (Dnumber);

CREATE TABLE PROJECT
(
	Pname		VARCHAR(20),
	Pnumber		NUMBER(2),
	Plocation	VARCHAR(20),

	PRIMARY KEY (Pnumber)
);

INSERT INTO PROJECT VALUES ('ProductA', 10, 'Bellaire');
INSERT INTO PROJECT VALUES ('ProductB', 20, 'Sugarland');
INSERT INTO PROJECT VALUES ('ProductC', 30, 'Houston');
INSERT INTO PROJECT VALUES ('Computerization', 40, 'Stafford');
INSERT INTO PROJECT VALUES ('Reorganization', 50, 'Spring');
INSERT INTO PROJECT VALUES ('Newbenefits', 60, 'Houston');

CREATE TABLE WORKSON
(
	Essn		CHAR(9),
	Pno		NUMBER(2),
	Hours		NUMBER(3,1),
	
	PRIMARY KEY (Essn, Pno),

	FOREIGN KEY (Essn)
		REFERENCES EMPLOYEE (Ssn),

	FOREIGN KEY (Pno)
		REFERENCES PROJECT(Pnumber)
);

INSERT INTO WORKSON VALUES ('123456789', 10, 8.0);
INSERT INTO WORKSON VALUES ('123456789', 20, 8.0);
INSERT INTO WORKSON VALUES ('453453453', 10, 20.0);
INSERT INTO WORKSON VALUES ('453453453', 20, 20.0);
INSERT INTO WORKSON VALUES ('333445665', 10, 16.0);
INSERT INTO WORKSON VALUES ('333445665', 20, 10.0);
INSERT INTO WORKSON VALUES ('333445665', 30, 15.0);
INSERT INTO WORKSON VALUES ('333445665', 40, 10.0);
INSERT INTO WORKSON VALUES ('333445665', 50, 20.0);
INSERT INTO WORKSON VALUES ('333445665', 60, 5.0);
INSERT INTO WORKSON VALUES ('999887777', 60, 30.0);
INSERT INTO WORKSON VALUES ('999887777', 40, 10.0);
INSERT INTO WORKSON VALUES ('987987987', 40, 35.0);
INSERT INTO WORKSON VALUES ('987987987', 60, 5.0);
INSERT INTO WORKSON VALUES ('987654321', 60, 20.0);
INSERT INTO WORKSON VALUES ('987654321', 50, 15.0);
INSERT INTO WORKSON VALUES ('888665575', 50, 10.0);
INSERT INTO WORKSON VALUES ('121231555', 50, 12.0);

CREATE TABLE DEPENDENT
(
	Essn		CHAR(9),
	DependentName	VARCHAR(20),
	Sex		CHAR(1),
	Bdate		DATE,
	Relationship 	VARCHAR(10),

	PRIMARY KEY (Essn, DependentName),

	FOREIGN KEY (Essn)
		REFERENCES EMPLOYEE (Ssn)
);

INSERT INTO DEPENDENT VALUES ('333445665', 'Alice', 'F', DATE '1986-04-05', 'Daughter');
INSERT INTO DEPENDENT VALUES ('333445665', 'Theodore', 'M', DATE '1983-10-25', 'Son');
INSERT INTO DEPENDENT VALUES ('333445665', 'Joy', 'F', DATE '1958-05-03', 'Spouse');
INSERT INTO DEPENDENT VALUES ('987654321', 'Abner', 'M', DATE '1988-01-04', 'Son');
INSERT INTO DEPENDENT VALUES ('987654321', 'Jennifer', 'F', DATE '1988-01-04', 'Daughter');
INSERT INTO DEPENDENT VALUES ('123456789', 'Jack', 'M', DATE '1988-02-28', 'Son');
INSERT INTO DEPENDENT VALUES ('123456789', 'Alice', 'F', DATE '1988-12-30', 'Daughter');
INSERT INTO DEPENDENT VALUES ('123456789', 'Elizabeth', 'F', DATE '1967-05-05', 'Spouse');
INSERT INTO DEPENDENT VALUES ('453453453', 'Joyce', 'F', DATE '1990-04-05', 'Daughter');
INSERT INTO DEPENDENT VALUES ('987987987', 'Nabil', 'M', DATE '1999-08-05', 'Son');

-- display contents of tables

SELECT * FROM EMPLOYEE;
SELECT * FROM DEPARTMENT;
SELECT * FROM PROJECT;
SELECT * FROM WORKSON;
SELECT * FROM DEPENDENT;

COMMIT;
