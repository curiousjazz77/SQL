/*fetches a specific ID

learning aid, cursors 


output in the end:

Traversing STUDENT table with a cursor:
1 : For ID 7856 , Name is Crista
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

INSERT INTO TEST VALUES('8000', 'Midterm', 77);
INSERT INTO TEST VALUES('7856', 'Final', 95);
INSERT INTO TEST VALUES('2100', 'Midterm', 98);
INSERT INTO TEST VALUES('1130', 'Final', 100);

SELECT * FROM STUDENT;

SELECT * FROM TEST;


declare
    studentName STUDENT.Name%type;
    studentID STUDENT.ID%type;
    /*cursor set up. We don't know state of the table yet
    only one row will come back with this edit to find one ID*/
    cursor studentPtr is SELECT * FROM STUDENT WHERE ID ='7856' ; 

begin
    dbms_output.put_line( 'Traversing STUDENT table with a cursor:'); 
    
    /*open cursor*/
    open studentPtr;
    
    /*loop to fetch one record at a time until no more found*/
    loop
        fetch studentPtr into studentID, studentName;
        
        if studentPtr%found then /*if we have data, this will be true*/
            dbms_output.put_line( studentPtr%rowcount || 
            ' : For ID ' || studentID || ' , Name is ' || studentName);
            
        else
            exit;
        end if; 
            
    end loop; 
    
    close studentPtr;
  
  dbms_output.put_line( 'Wa la!');  
    end;
    
    
    
   
