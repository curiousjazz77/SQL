DROP TABLE STUDENT CASCADE CONSTRAINTS;
DROP TABLE PERCENTAGES CASCADE CONSTRAINTS;

CREATE TABLE STUDENT
(
ID CHAR(5),
Name VARCHAR2(20),
Homework NUMBER(3,0) CHECK (Homework>=0 AND Homework<=100),
Midterm NUMBER(3,0) CHECK (Midterm>=0 AND Midterm<=100),
Final NUMBER(3,0) CHECK (Final>=0 AND Final<=100),
Labs NUMBER(3,0) CHECK (Labs>=0 AND Labs<=100),
PRIMARY KEY (ID)
);
INSERT INTO STUDENT VALUES ( '41511', 'Jagger', 98, 88, 90, 100 );
INSERT INTO STUDENT VALUES ( '12833', 'Jones', 75, 67, 50, 75 );
INSERT INTO STUDENT VALUES ( '90909', 'Richards', 93, 84, 86, 95 );
INSERT INTO STUDENT VALUES ( '67676', 'Watts', 84, 78, 89, 90 );
INSERT INTO STUDENT VALUES ( '52873', 'Wood', 84, 60, 80, 85 );
INSERT INTO STUDENT VALUES ( '10111', 'Wyman', 80, 82, 91, 70 );
SELECT * FROM STUDENT;




CREATE TABLE PERCENTAGES
(
HWPercent NUMBER(3,0) CHECK (HWPercent>=0 AND HWPercent<=100),
MidPercent NUMBER(3,0) CHECK (MidPercent>=0 AND MidPercent<=100),
FinPercent NUMBER(3,0) CHECK (FinPercent>=0 AND FinPercent<=100),
LabPercent NUMBER(3,0) CHECK (LabPercent>=0 AND LabPercent<=100)
);
INSERT INTO PERCENTAGES VALUES ( 25, 30, 35, 10 );
SELECT * FROM PERCENTAGES;
SELECT * FROM STUDENT;
COMMIT;


/*
Write a script file Problem1.sql containing an anonymous PL/SQL block that will do the
following:
First, report the four percentages found in the PERCENTAGES table. (You may assume that the
PERCENTAGES table contains only one record.) */



declare
    percentInfo PERCENTAGES%rowtype;
    cursor percentPtr is SELECT * FROM PERCENTAGES;
    cursor studentPtr is SELECT * FROM STUDENT; 
    w PERCENTAGES.HWPercent%type;  
    x PERCENTAGES.MidPercent%type;
    y PERCENTAGES.FinPercent%type;
    z PERCENTAGES.LabPercent%type;
    
    w1           STUDENT.Homework%type; 
    x1           STUDENT.Midterm%type; 
    y1           STUDENT.Final%type; 
    z1           STUDENT.Labs%type; 
    studentID   STUDENT.ID%type;
    studentName STUDENT.Name%type; 
    total       NUMBER(5,2); 
    Grade       VARCHAR2(1);
    
begin
    open percentPtr;
    loop
        fetch percentPtr into w, x, y, z;
        
        if percentPtr%found then /*if we have data, this will be true*/
            dbms_output.put_line('Percentages are ' || w || ', ' || x || ', ' || y || ', ' || z);
            
        else
            exit;
        end if; 
            
    end loop; 
    
    close percentPtr;

/*
Next, output the name of each student in the
STUDENT table and their overall score, computed as w percent Homework, x percent Midterm, 
y percent Final, and z percent Labs, where w, x, y, and z are the corresponding percentages
found in the PERCENTAGES table. (You may assume that w+x+y+z=100.)
*/

    open studentPtr;
    loop
        fetch studentPtr into studentID, studentName, w1, x1, y1, z1;
        if studentPtr%found then
        total := (w1*w + x1*x + y1*y + z1*z) /100;
         
/*
Also convert each
student’s overall score to a letter grade by the rule 90-100=A, 80-89.99=B, 70-79.99=C, 60-
69.99=D, 0-59.99=F, and include the letter grade in the output. Output each student’s
information on a separate line. For the sample data given above, the output should be:
Percentages are 25, 30, 35, 10
41511 Jagger 92.4 A
12833 Jones 63.85 D
90909 Richards 88.05 B
67676 Watts 84.55 B
52873 Wood 75.5 C
10111 Wyman 83.45 B
Of course, this is just an example – your PL//SQL block should work in general, not just for the
given sample data.

        Grade Bands: 90-100=A, 80-89.99=B, 70-79.99=C, 60-
69.99=D, 0-59.99=F
*/
        
        if (total >= 90) then
        Grade :='A';
      elsif (total >= 80) then
        Grade :='B';
      elsif (total >= 70) then
        Grade :='C';
      elsif(total >= 60) then
        Grade := 'D';
      else
        Grade :='F';
      end if;
    dbms_output.put_line( studentID || ' ' || studentName || ' ' ||   total || ' ' || Grade);  
        else
            exit;
        end if;
    
    end loop; 
    close studentPtr; 
end;



    




