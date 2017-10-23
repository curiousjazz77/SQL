DROP TABLE PROJECT CASCADE CONSTRAINTS;
DROP TABLE ASSIGNMENT CASCADE CONSTRAINTS;


CREATE TABLE PROJECT
(
Code    NUMBER(3,0),
Name    VARCHAR2(30),

CONSTRAINT PK_PROJECT
    PRIMARY KEY (Code)
);

CREATE TABLE ASSIGNMENT
(
EmpID       CHAR(5),
EmpLName    VARCHAR2(30),
EmpFName    VARCHAR2(20),
Dept        VARCHAR2(20),
ProjCode    NUMBER(3),
Hours       NUMBER(*,0),

CONSTRAINT PK_ASSIGNMENT
    PRIMARY KEY(EmpID, ProjCode),

CONSTRAINT FK_ASSIGNMENT_PROJECT
    FOREIGN KEY (ProjCode)
    REFERENCES PROJECT (Code)
);
   
   
INSERT INTO PROJECT VALUES(101, 'Four-Dimensional Phones'); 
INSERT INTO PROJECT VALUES(252, 'Matter Transporters'); 
INSERT INTO PROJECT VALUES(995, 'Anti-Gravity Clothing'); 

INSERT INTO ASSIGNMENT VALUES('550', 'Smith', 'Winston', 'Accounting', 101, 20); 
INSERT INTO ASSIGNMENT VALUES('550', 'Smith', 'Winston', 'Accounting', 252, 10); 
INSERT INTO ASSIGNMENT VALUES('601', 'Smith', 'Barney', 'Finance', 252, 5); 
INSERT INTO ASSIGNMENT VALUES('390', 'Hammong', 'Evey', 'Personnel', 995, 25); 
INSERT INTO ASSIGNMENT VALUES('001', 'Preston', 'Bill', 'Special Events', 995, 5); 
INSERT INTO ASSIGNMENT VALUES('100', 'Logan', 'Ted', 'Special Events', 995, 5); 
INSERT INTO ASSIGNMENT VALUES('007', 'Bond', 'James', 'Personnel', 252, 20);
INSERT INTO ASSIGNMENT VALUES('505', 'Lois', 'Lane', 'Media Relations', 101, 10);
INSERT INTO ASSIGNMENT VALUES('505', 'Lois', 'Lane', 'Media Relations', 252, 10);
INSERT INTO ASSIGNMENT VALUES('505', 'Lois', 'Lane', 'Media Relations', 995, 10);

SELECT * FROM PROJECT;
SELECT * FROM ASSIGNMENT; 

/*query to be transplanted into PL/SQL with a cursor*/

SELECT EmpID, EmpFName, EmpLName FROM ASSIGNMENT WHERE PROJCODE =101;

/*report project codes and names*/

declare

    projectCode NUMBER(3,0);
    projectName VARCHAR(30);
    cursor projectPtr is SELECT * FROM PROJECT;
    
begin
    dbms_output.put_line('Projects:');
    dbms_output.put_line('');
    open projectPtr;
    
    loop
        fetch projectPtr into projectCode, projectName;
        if (projectPtr%found) then
            dbms_output.put_line(projectCode || ': ' || projectName );
        else
            exit; 
        end if;
        
    end loop;
    close projectPtr;
    dbms_output.put_line('');
    end; 
    

/*now to report project codes and names + list of IDS and names of employees
who worked on the project*/

declare
    projectCode NUMBER(3,0);
    projectName VARCHAR(30);
    cursor projectPtr is SELECT * FROM PROJECT; 
    
    id CHAR(5);
    firstname VARCHAR2(20);
    lastname VARCHAR2(30);
    
    /*parameterized cursor*/
    cursor personPtr (codeIn in PROJECT.Code%type) is
            SELECT EmpID, EmpFName, EmpLName FROM ASSIGNMENT 
            WHERE PROJCODE =codeIn
            ORDER BY EmpID;
            

begin 
    dbms_output.put_line('Projects and Personnel:');
    dbms_output.put_line('');
    open projectPtr;
    
    loop
    
    /*get one project*/
    
    fetch projectPtr into projectCode, projectName;
        if (projectPtr%found) then
            dbms_output.put_line(projectCode || ': ' || projectName );
            
            /*for current project, get all employees working on that proj*/
            
            open personPtr(projectCode);
            
            loop
                fetch personPtr into id, firstname, lastname;
                if (personPtr%found) then
                    dbms_output.put_line(' ' || id || ' : ' ||  firstname || ', ' || lastname);
                
                else
                    exit; 
                end if;
        
            end loop;
            
            dbms_output.put_line('');
            close personPtr;
    
        else

            exit; 
   end if;
        
    end loop;
end;  
 
