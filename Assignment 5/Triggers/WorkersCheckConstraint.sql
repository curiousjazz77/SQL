/*learning aid - triggers*/

DROP TABLE WORKERS CASCADE CONSTRAINTS;


CREATE TABLE WORKERS
(

Name    CHAR(1),
DeptNumber NUMBER(1,0),
Salary  NUMBER(8,2) CHECK (Salary >= 0), /*can't include negative #*/
/*other way to fix is to change the trigger so that it triggers on every change: 
insert, delete or update. this may be overkill. heading it off in the structure of the data
may be a better way to do it*/

CONSTRAINT PK_WORKERS
    PRIMARY KEY (Name)
);

   
INSERT INTO WORKERS VALUES('A', 5, 30000); 
INSERT INTO WORKERS VALUES('B', 2, 45000); 
INSERT INTO WORKERS VALUES('C', 5, 70000); 
INSERT INTO WORKERS VALUES('D', 2, 55000); 
INSERT INTO WORKERS VALUES('E', 1, 25000); 
INSERT INTO WORKERS VALUES('F', 3, 90000); 
INSERT INTO WORKERS VALUES('G', 4, 90000); 
INSERT INTO WORKERS VALUES('H', 2, 39000); 
INSERT INTO WORKERS VALUES('I', 1, 36000); 
INSERT INTO WORKERS VALUES('J', 3, 60000); 
INSERT INTO WORKERS VALUES('K', 5, 76000); 
INSERT INTO WORKERS VALUES('L', 3, 40000); 
INSERT INTO WORKERS VALUES('M', 4, 85000); 
INSERT INTO WORKERS VALUES('N', 1, 39000); 
INSERT INTO WORKERS VALUES('O', 2, 42000);

SELECT * FROM WORKERS;

SELECT SUM(Salary) FROM WORKERS; 

/* if inserting another employee will total more than
one million, tests triggered, error message and insert cancelled*/

CREATE OR REPLACE TRIGGER SalaryCap AFTER INSERT OR UPDATE ON WORKERS

DECLARE
    total INTEGER;
    
BEGIN
    SELECT SUM(WORKERS.Salary)
    INTO total
    FROM WORKERS;
    
    dbms_output.put_line(total);
    if (total >= 1000000) then
        RAISE_APPLICATION_ERROR(-20001, 'Million Dollar Limit Excceeded'); 
    end if; 
end; 
