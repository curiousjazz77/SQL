/*learning aid, record creation with for loop/cursor */


/*output in the end:
Querying STUDENT table
8000 Marta
2100 Julie
7856 Crista
1130 Yasmin
Query done!
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
    studentInfo STUDENT%rowtype;
    cursor studentPtr is SELECT * FROM STUDENT; 
    

begin
    dbms_output.put_line( 'Querying STUDENT table'); 
    
    for studentInfo in studentPtr
    loop
        dbms_output.put_line( studentInfo.ID || ' ' || studentInfo.Name); 
    end loop; 
    
    dbms_output.put_line( 'Query done!');
    

end; 

 
