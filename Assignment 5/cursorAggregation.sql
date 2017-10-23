/*learning aid, cursors:
/*Give name of each exam and the number of students who took it within PL/SQL

/*output in the end:

Traversing STUDENT table with a cursor:
Exam # 1 : Name - GMAT, student(s) taking exam - 1
Exam # 2 : Name - Midterm, student(s) taking exam - 3
Exam # 3 : Name - Final, student(s) taking exam - 1
Exam # 4 : Name - LSAT, student(s) taking exam - 1
Wa la!
*/

DROP TABLE STUDENT CASCADE CONSTRAINTS;
DROP TABLE TEST CASCADE CONSTRAINTS;

CREATE TABLE STUDENT
(
    ID CHAR(4),
    Name VARCHAR2(20),
    
    PRIMARY KEY (ID)
    );
    
CREATE TABLE TEST
(
    ID      CHAR(4),
    Exam    VARCHAR2(10),
    Score   NUMBER(3,0)
            CHECK (Score >= 0 AND Score <= 100),
    PRIMARY KEY (ID, Exam),
    
    FOREIGN KEY (ID)
        REFERENCES STUDENT(ID)
);


INSERT INTO STUDENT VALUES('8000', 'Marta');
INSERT INTO STUDENT VALUES('2100', 'Julie');
INSERT INTO STUDENT VALUES('7856', 'Crista');
INSERT INTO STUDENT VALUES('1130', 'Yasmin');
INSERT INTO STUDENT VALUES('1444', 'Gingham');

INSERT INTO TEST VALUES('8000', 'Midterm', 77);
INSERT INTO TEST VALUES('7856', 'Final', 95);
INSERT INTO TEST VALUES('2100', 'Midterm', 98);
INSERT INTO TEST VALUES('1130', 'LSAT', 100);
INSERT INTO TEST VALUES('1444', 'GMAT', 100);
INSERT INTO TEST VALUES('7856', 'Make-up Midterm', 100);
INSERT INTO TEST VALUES('9415', 'Entrance Exam', 100);
INSERT INTO TEST VALUES('1444', 'Midterm', 77);

SELECT * FROM STUDENT;

SELECT * FROM TEST;

/*Give name of each exam and the number of students who took it
See alternative way to do this in PL/SQL below*/
SELECT Exam, Count(ID) FROM TEST GROUP BY Exam; 


declare
    examName TEST.Exam%type;
    examCount NUMBER(2,0);
    
    /*cursor set up. We don't know state of the table yet
    only one row will come back with this edit to find one ID*/
    cursor examPtr is SELECT Exam, Count(ID) FROM TEST GROUP BY Exam; 

begin
    dbms_output.put_line( 'Traversing STUDENT table with a cursor:'); 
    
    /*open cursor*/
    open examPtr;
    
    /*loop to fetch one record at a time until no more found*/
    loop
        fetch examPtr into examName, examCount;
        
        if examPtr%found then /*if we have data, this will be true*/
            dbms_output.put_line( 'Exam # ' || examPtr%rowcount || 
            ' : Name - ' || examName || ', student(s) taking exam - ' || examCount);
            
        else
            exit;
        end if; 
            
    end loop; 
    
    close examPtr;
  
  dbms_output.put_line( 'Wa la!');  
    end;
    
    
    
   
