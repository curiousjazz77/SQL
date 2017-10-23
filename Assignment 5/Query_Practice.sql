/*learning aid, Lecture 6 */

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

/*Will get "no rows selected" since called outside of PS/SQL script.
But this kind of query will be an issue if transplanted into the select into
statement (too little data -->will cause error due to null value*/
SELECT ID, Name FROM STUDENT WHERE ID = '1717'; 

/*We also run into problems if we have too much data to pull.
this wouldn't work inside the PS/SQL statement.
 This selects entire contents from student table*/
SELECT ID, Name FROM STUDENT; 

/*PL/SQL BLOCK*/

declare
    studentName STUDENT.Name%type;
    studentID STUDENT.ID%type;
    targetID STUDENT.ID%type := '1130';
    score TEST.Score%type := '100';

begin
    dbms_output.put_line( 'Querying STUDENT for ID ' || targetID || ':'); 
    
    /*result stored*/
    
    /*select into structure is very fragile
    if changed target to 1717, we get a report that we are querying for 
    1717, but when hits query with into, we get an error.
    It's best to write PS/SQL query incrementally so you can isolate the error*/
    SELECT Name, ID
    INTO studentName, studentID
    FROM STUDENT
    /*is this where condition is deleted, an error will be thrown.
    Select into can't return this table for each student.
    It only wants one row of data to return back.
    Error message: "exact fetch returns more than requested number of rows".
    We need something more flexible to get back multiple rows by traversal*/
    WHERE ID = targetID;
    
    dbms_output.put_line( 'Query Done!' ); 
    dbms_output.put_line( 'For ID ' || studentID || ' , Name is ' || studentName ||'.'); 
    
    
    /*A cursor - can think of as a pointer into a set of results. Associated with a particular query.
    See cursor file for more info*/
    
end; 

