/*learning aid - record creation*/


/*output in the end:
Querying STUDENT table for ID 1130:
Query done!
For ID: 1130, Name is Yasmin
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
    targetID STUDENT.ID%type := '1130';
    

begin
    dbms_output.put_line( 'Querying STUDENT table for ID ' || targetID || ':' ); 
    
    /*store result of query in record*/
    SELECT * INTO studentInfo
    FROM STUDENT WHERE ID = targetID; 
    
    dbms_output.put_line( 'Query done!');
    dbms_output.put_line( 'For ID: ' || studentInfo.ID || ', Name is ' || studentInfo.Name );

end; 

 
