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

/*PL/SQL BLOCK*/

declare
    studentName STUDENT.Name%type;
    studentID STUDENT.ID%type;
    targetID STUDENT.ID%type := '1130';
    score TEST.Score%type := '100';

begin
    dbms_output.put_line( 'Querying STUDENT and TEST table for ID' || targetID || ':'); 
    
    /*result stored*/
    
    SELECT Name, ID
    INTO studentName, studentID
    FROM STUDENT
    WHERE ID = targetID;
    
    dbms_output.put_line( 'Query Done!' ); 
    dbms_output.put_line( 'For ID ' || studentID || ' , Name is ' || studentName ||'.'); 
    
end; 

