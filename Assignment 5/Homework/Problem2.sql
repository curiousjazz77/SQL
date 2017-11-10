/*
Jasmine Omeke
CSC 453 
Section 710 Online
Assignment 5 
Problem 2, 11/2/2017
*/

DROP TABLE MEMBER CASCADE CONSTRAINTS;
DROP TABLE CLUB CASCADE CONSTRAINTS;

CREATE TABLE CLUB
(
 ID                 CHAR(2),
 Name               VARCHAR2(30),
 MemberCount        NUMBER(2,0) DEFAULT 0,
 CONSTRAINT PK_CLUB
             PRIMARY KEY (ID)
);
CREATE TABLE MEMBER
(
 ClubID CHAR(2),
 MemberID CHAR(9),
 MonthlyFee NUMBER(5,2),

 CONSTRAINT PK_MEMBER
             PRIMARY KEY (ClubID, MemberID),
             
 CONSTRAINT FK_MEMBER_CLUB
             FOREIGN KEY (ClubID)
             REFERENCES CLUB (ID)
);




/* when a user attempts to INSERT a row into MEMBER
The first trigger, named AddMember, will fire when a user attempts to INSERT 
a row into MEMBER. This trigger will check the value of MemberCount for the 
corresponding job. If MemberCount is less than 10, then there is still room in 
the club for another member, so it will allow the INSERT to occur and will 
increase the value of MemberCount by one. If MemberCount is equal to 10, then 
the club is full, so it will cancel the INSERT and display an error message 
stating that the club is full.
*/
CREATE OR REPLACE TRIGGER AddMember BEFORE UPDATE OR INSERT ON MEMBER 
    FOR EACH ROW

DECLARE 
totalMemberCount_byClub INTEGER;
maxHeadCount INTEGER := 10;

BEGIN 
    
     SELECT COUNT(*) INTO totalMemberCount_byClub
            FROM Member
            WHERE ClubID = :new.ClubID;
            DBMS_OUTPUT.PUT_LINE('previous count ' || totalMemberCount_byClub);
    IF
         totalMemberCount_byClub > maxHeadCount -1 THEN
         DBMS_OUTPUT.PUT_LINE('TRIGGER Error AddMember: Member ' || :new.MemberID || ' not added to club ' || :new.ClubID || '. Club at max capacity of 10');
         RAISE_APPLICATION_ERROR (-30,'Limit exceeded. Clubs have max of 10 ppl');
         
    
    ELSE 
            
            UPDATE CLUB
                 SET MemberCount = MemberCount + 1
                 WHERE ID = :new.ClubID;
                 DBMS_OUTPUT.PUT_LINE('TRIGGER AddMember: Member ' || :new.MemberID || ' added to club ' || :new.ClubID || '.');
                 --had issues having total count per club update after insertion.
                 DBMS_OUTPUT.PUT_LINE('updated count = previous count: ' || totalMemberCount_byClub || '+ 1 addition');
              
       END IF;
    
  
END;  
/

    
    
    
    /*The second trigger, named RemoveMember, will fire when a user attempts to 
    DELETE one or more rows from MEMBER. This trigger will update the values of 
    MemberCount for any affected clubs to make sure they are accurate after the 
    rows are deleted, by decreasing the value of MemberCount by one each time a
    member is removed from a club.*/
    
CREATE OR REPLACE TRIGGER RemoveMember AFTER DELETE ON MEMBER
    FOR EACH ROW

BEGIN
       IF (:old.MemberID IS NOT NULL) THEN
           UPDATE CLUB
           SET MemberCount = MemberCount - 1
           WHERE ID = :old.ClubID ;
           DBMS_OUTPUT.PUT_LINE('TRIGGER RemoveMember: Member ' || :old.MemberID || ' removed from club ' || :old.ClubID);

END IF; 

END;
/

/*The third trigger, named NoUpdates, will fire when a user attempts to UPDATE
one or more rows of MEMBER. The trigger will simply cancel the UPDATE and 
display an error message stating that no updates are permitted to existing 
rows of MEMBER.
*/

CREATE TRIGGER NoUpdates BEFORE UPDATE ON MEMBER

    
BEGIN
       DBMS_OUTPUT.PUT_LINE('TRIGGER Error NoUpdates: Updates are not allowed to member information. Please see administrator for assistance.');
       RAISE_APPLICATION_ERROR(-31,'Updates are not allowed. That user already exists.');  
    
END;
/

    
INSERT INTO CLUB (ID, Name) VALUES ( '10', 'East Bank Club' );
INSERT INTO CLUB (ID, Name) VALUES ( '22', 'Lakeview Athletic Club' );
INSERT INTO CLUB (ID, Name) VALUES ( '37', 'David Barton Gym' );


SELECT * FROM CLUB;
SELECT * FROM MEMBER;

/*Test cases*/

INSERT INTO MEMBER VALUES ('22', '99', 35);
INSERT INTO MEMBER VALUES ('37', '11', 550);
INSERT INTO MEMBER VALUES ('10', '14444', 55);
INSERT INTO MEMBER VALUES ('10', '44444', 55); 
INSERT INTO MEMBER VALUES ('22', '989', 35);
UPDATE MEMBER SET MONTHLYFEE = 21 WHERE MEMBERID = '99';
INSERT INTO MEMBER VALUES ('37', '11', 550);
INSERT INTO MEMBER VALUES ('10', '19444', 55);
INSERT INTO MEMBER VALUES ('10', '24444', 55);
UPDATE MEMBER SET MemberID = '318' WHERE MEMBERID = '11';
INSERT INTO MEMBER VALUES ('10', '34444', 55);
INSERT INTO MEMBER VALUES ('10', '54444', 55);
INSERT INTO MEMBER VALUES ('10', '64444', 55);
DELETE FROM MEMBER WHERE MemberID =  '44444';
INSERT INTO MEMBER VALUES ('10', '74444', 55);
INSERT INTO MEMBER VALUES ('10', '84444', 55);
INSERT INTO MEMBER VALUES ('10', '94444', 55);
INSERT INTO MEMBER VALUES ('10', '04444', 55);
INSERT INTO MEMBER VALUES ('10', '23444', 55);
INSERT INTO MEMBER VALUES ('10', '13444', 55);
INSERT INTO MEMBER VALUES ('10', '63444', 55);
INSERT INTO MEMBER VALUES ('10', '73444', 55);
DELETE FROM MEMBER WHERE MemberID =  '74444';
INSERT INTO MEMBER VALUES ('22', '99555', 35);
INSERT INTO MEMBER VALUES ('37', '111111', 550);
UPDATE MEMBER SET MONTHLYFEE = 21 WHERE MEMBERID = '11';
INSERT INTO MEMBER VALUES ('10', '813', 550);
INSERT INTO MEMBER VALUES ('10', '138', 550);
INSERT INTO MEMBER VALUES ('10', '183', 550);

SELECT * FROM CLUB; 