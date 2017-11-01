/*
      Grades.sql
      Eric J. Schwabe
      CSC 453 Fall 2017
      
      edited 10/31
*/
DROP TABLE GRADE CASCADE CONSTRAINTS;
DROP TABLE WEIGHT CASCADE CONSTRAINTS;
DROP TABLE TOTAL CASCADE CONSTRAINTS;
CREATE TABLE WEIGHT
(
      Grade VARCHAR(2),
      Points NUMBER(2,1),
      PRIMARY KEY (Grade)
);
CREATE TABLE TOTAL
(
      Name  VARCHAR2(20),
      GPA   NUMBER(3,2),
      PRIMARY KEY (Name)
);
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

-- trigger to re-compute the GPA table TOTAL any time the grade table is changed...

CREATE OR REPLACE TRIGGER UpdateTotals
      AFTER INSERT OR UPDATE OR DELETE ON GRADE
DECLARE
      CURSOR GPAPtr IS
            SELECT Name, round(AVG(Points),2)
                  FROM GRADE INNER JOIN WEIGHT
            ON GRADE.Grade = WEIGHT.Grade
            GROUP BY Name
            ORDER BY Name;
      CurrName VARCHAR2(20);
      CurrGPA NUMBER(3,2);
BEGIN
    dbms_output.put_line('Trigger UpdateTotals firing...'); 
    DELETE FROM TOTAL; --extreme, deleting each time
    open GPAPtr;
          loop
                fetch GPAPtr into CurrName, CurrGPA;
    if (GPAPtr%found) then
        dbms_output.put_line(CurrName || ' : ' || CurrGPA);
        INSERT INTO TOTAL VALUES (CurrName, CurrGPA); --when it fires, it takes a result from grade table and then stores it
    else
        exit; 
    end if;
    /*problem - each time we added something, it scratches the table and runs from scratch
     it will work but seems that we are doing a lot of work over and over again
    not very inefficient
    what we want: for the table to update only the student being inserted and keep existing
    not enough information in total to recompute grade. instead, we look at grade table. */
    
    end loop;
    dbms_output.put_line(' ');
    close GPAPtr;
END; 
/

INSERT INTO GRADE VALUES ( 'Bob', '11111', 'C' ); 
INSERT INTO GRADE VALUES ( 'Bob', '22222', 'B-' ); 
INSERT INTO GRADE VALUES ( 'Alice', '22222', 'B' ); 
INSERT INTO GRADE VALUES ( 'Alice', '33333', 'A' ); 
INSERT INTO GRADE VALUES ( 'Charlie', '22222', 'A-' ); 
INSERT INTO GRADE VALUES ( 'Alice', '11111', 'A' ); 
INSERT INTO GRADE VALUES ( 'Charlie', '33333', 'B+' );
SELECT * FROM GRADE;
-- querying the TOTAL table to display GPAs
SELECT * FROM TOTAL;
-- computing the GPAs from scratch with a query

SELECT Name, round(AVG(Points),2) AS StudentGPA 
    FROM GRADE INNER JOIN WEIGHT
    ON GRADE.Grade = WEIGHT.Grade
    GROUP BY Name
    ORDER BY Name;
