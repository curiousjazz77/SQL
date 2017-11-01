/*
      OtherGrades.sql
      Eric J. Schwabe
      CSC 453 Fall 2017
*/
DROP TABLE GRADE CASCADE CONSTRAINTS;
DROP TABLE WEIGHT CASCADE CONSTRAINTS;
DROP TABLE TOTAL CASCADE CONSTRAINTS;
-- Table of grades and associated numbers of points
CREATE TABLE WEIGHT
(
      Grade VARCHAR(2),
      Points      NUMBER(2,1),
      PRIMARY KEY (Grade)
);
INSERT INTO WEIGHT VALUES ( 'A', 4.0 );
INSERT INTO WEIGHT VALUES ( 'A-', 3.7 );
INSERT INTO WEIGHT VALUES ( 'B+', 3.3 );
INSERT INTO WEIGHT VALUES ( 'B', 3.0 );
INSERT INTO WEIGHT VALUES ( 'B-', 2.7 );
INSERT INTO WEIGHT VALUES ( 'C+', 2.3 );
INSERT INTO WEIGHT VALUES ( 'C', 2.0 );
INSERT INTO WEIGHT VALUES ( 'C-', 1.7 );
INSERT INTO WEIGHT VALUES ( 'D+', 1.3 );
INSERT INTO WEIGHT VALUES ( 'D', 1.0 );
INSERT INTO WEIGHT VALUES ( 'F', 0.0 );
SELECT * FROM WEIGHT;
-- Table of individual grades for students
CREATE TABLE GRADE
(
      Name  VARCHAR2(20),
      Section     CHAR(5),
      Grade VARCHAR2(2),
      PRIMARY KEY (Name, Section),
      CONSTRAINT FK_GRADE_WEIGHT
            FOREIGN KEY (Grade)
            REFERENCES WEIGHT(Grade)
);
-- Table of total points, number of grades, and GPA for each student in GRADE -- (data is maintained by triggers below...)
CREATE TABLE TOTAL
(
      Name        VARCHAR2(20),
      TotalPts    NUMBER(5,1),
      GradeCount  NUMBER(3),
      GPA         NUMBER(3,2),
      PRIMARY KEY (Name)
);
-- *** Begin Triggers ***
-- When a row is added to the GRADE table, see if there are any grades for that
-- student, or none.  If none, add the first record for that student to TOTAL.  If some
-- exist, update the total points, grade count, and GPA...
CREATE OR REPLACE TRIGGER AddGrade
      AFTER INSERT OR UPDATE ON GRADE
FOR EACH ROW
DECLARE
      NameCount INTEGER;
      oldTotal NUMBER(5,1);
      oldCount INTEGER;
      NewPoints NUMBER(2,1);

BEGIN
        dbms_output.put('Adding a grade for ' || :new.Name || ' ... ');
        SELECT COUNT(*) INTO NameCount FROM TOTAL WHERE Name = :new.Name;
        SELECT Points INTO NewPoints FROM WEIGHT WHERE WEIGHT.Grade = :new.Grade; 
        -- dbms_output.put_line(NameCount);
        -- dbms_output.put_line(NewPoints);
if NameCount = 0 then
        dbms_output.put_line('adding first grade.');
        INSERT INTO TOTAL VALUES( :new.Name , NewPoints , 1, NewPoints ); 
        dbms_output.put_line(NewPoints || ' ' || 1);
else
        dbms_output.put_line('grades exist, updating totals.');
        SELECT TotalPts INTO oldTotal FROM TOTAL WHERE Name = :new.Name; 
        SELECT GradeCount INTO oldCount FROM TOTAL WHERE Name = :new.Name; 
        UPDATE TOTAL SET GradeCount=GradeCount+1 WHERE Name = :new.Name; 
        UPDATE TOTAL SET TotalPts=TotalPts+NewPoints WHERE Name = :new.Name; 
        UPDATE TOTAL SET GPA=TotalPts/GradeCount WHERE Name = :new.Name; 
        dbms_output.put_line((oldTotal+NewPoints) || ' ' || (oldCount+1));
end if; 

END;
/
-- When a row of the GRADE table is deleted, see if there are multiple grades for that
-- student, or just one.  If only one, remove their entire record from TOTAL.  If more
-- than one, update the total points, grade count, and GPA...
CREATE OR REPLACE TRIGGER RemoveGrade
      AFTER DELETE OR UPDATE ON GRADE
FOR EACH ROW
DECLARE
      oldTotal NUMBER(5,1);
      oldCount INTEGER;
      oldPoints NUMBER(2,1);
BEGIN
    dbms_output.put('Removing a grade for ' || :old.Name || ' ... ');
    SELECT GradeCount INTO oldCount FROM TOTAL WHERE Name = :old.Name; 
    SELECT Points INTO oldPoints FROM WEIGHT WHERE WEIGHT.Grade = :old.Grade; 
-- dbms_output.put_line(oldCount);
-- dbms_output.put_line(oldPoints);
if (oldCount) = 1 then
    dbms_output.put_line('removing last grade.'); 
    DELETE FROM TOTAL WHERE Name = :old.Name;
else
    dbms_output.put_line('multiple grades exist, updating totals.'); 
    SELECT TotalPts INTO oldTotal FROM TOTAL WHERE Name = :old.Name; 
    SELECT GradeCount INTO oldCount FROM TOTAL WHERE Name = :old.Name; 
    UPDATE TOTAL SET GradeCount=GradeCount-1 WHERE Name = :old.Name; 
    UPDATE TOTAL SET TotalPts=TotalPts-oldPoints WHERE Name = :old.Name; 
    UPDATE TOTAL SET GPA=TotalPts/GradeCount WHERE Name = :old.Name; 
    dbms_output.put_line((oldTotal-oldPoints) || ' ' || (oldCount-1));
end if; 
END;
/
-- When a row of the grade table is updated, the old state of each row will be deleted,
-- and the new state of the each row will be inserted, by having both of the previous
-- two triggers fire...
-- *** End Triggers ***
INSERT INTO GRADE VALUES ( 'Bob', '11111', 'C' ); 
INSERT INTO GRADE VALUES ( 'Bob', '22222', 'B-' ); 
INSERT INTO GRADE VALUES ( 'Alice', '22222', 'B' ); 
INSERT INTO GRADE VALUES ( 'Alice', '33333', 'A' ); 
INSERT INTO GRADE VALUES ( 'Charlie', '22222', 'A-' ); 
INSERT INTO GRADE VALUES ( 'Alice', '11111', 'A' ); 
INSERT INTO GRADE VALUES ( 'Charlie', '33333', 'B+' );

SELECT * FROM GRADE;
SELECT * FROM TOTAL;
