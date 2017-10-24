/*learning aid - addig records to table
seeking record that is not there, protection with if clause*/


/*output in the end:
Querying STUDENT table
8000 Marta
(Adding record to table in position 1...)

2100 Julie
(Adding record to table in position 4...)

7856 Crista
(Adding record to table in position 7...)

1130 Yasmin
(Adding record to table in position 10...)

Query done!

The first element is in position: 1
The last element is in position: 10
Element 3 is: 
Not there.
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
    /*table type*/
    type studentTable is table of STUDENT%rowtype
        index by binary_integer;
        
    /*declare table of new type*/
    students studentTable; 
    /*index variable*/
    i binary_integer :=1;
    
/*each time we fetch a student, it'll store it in position i of this student
table*/ 
begin
    dbms_output.put_line( 'Querying STUDENT table'); 
    
    for studentInfo in studentPtr
    loop
        dbms_output.put_line( studentInfo.ID || ' ' || studentInfo.Name); 
        dbms_output.put_line( '(Adding record to table in position ' || i || '...)'); 
        dbms_output.put_line('');
        
        students(i) := studentInfo;
        
        i := i + 3;
    end loop; 
    
    dbms_output.put_line( 'Query done!');
    dbms_output.put_line( '');
    
    /*table limits and one element*/
    dbms_output.put_line( 'The first element is in position: ' || students.first);
    dbms_output.put_line( 'The last element is in position: ' || students.last);
    dbms_output.put_line( 'Element 3 is: ');
    /*dbms_output.put_line(students(3).ID || ' ' || students(3).Name);
    
    included to avoid "no data found" error if no data at element 3*/
    
    if (students.exists(3)) then
         dbms_output.put_line(students(3).ID || ' ' || students(3).Name);
    else
         dbms_output.put_line('Not there.'); 
    end if; 

end; 

 
