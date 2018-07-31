/*
    Assignment 3
*/

DROP TABLE TYPEF CASCADE CONSTRAINTS;
DROP TABLE SHIP CASCADE CONSTRAINTS;
DROP TABLE BATTLE CASCADE CONSTRAINTS;
DROP TABLE OUTCOME5 CASCADE CONSTRAINTS;

CREATE TABLE TYPEF
(
TypeName  VARCHAR(32),
Weight       NUMBER(3,0),
NumberOfGuns     NUMBER(3,0),

CONSTRAINT PK_TYPEF
    PRIMARY KEY (TypeName)
);

--INSERT TABLE VALUES
INSERT INTO TYPEF VALUES ('Destroyer', 45, 8);
INSERT INTO TYPEF VALUES ('Runner', 12, 12);
INSERT INTO TYPEF VALUES ('Sail boat', 88, 3);
INSERT INTO TYPEF VALUES ('Motor boat', 2, 100);


CREATE TABLE SHIP
(
ShipName  VARCHAR(32),
Country   VARCHAR(32),
ShipType  VARCHAR(32),
DateLaunched DATE,

CONSTRAINT PK_SHIP
    PRIMARY KEY (ShipName),
    
CONSTRAINT PK_F_SHIP
    FOREIGN KEY (ShipType)
    REFERENCES TYPEF(TypeName)
);

INSERT INTO SHIP VALUES ('OMG', 'Bogota', 'Destroyer', DATE '1212-03-24');
INSERT INTO SHIP VALUES ('Sodade', 'Belize', 'Sail boat', DATE '1882-03-25');
INSERT INTO SHIP VALUES ('Hang Tight', 'Kenya', 'Motor boat', DATE '1772-03-25');
INSERT INTO SHIP VALUES ('Jetter', 'Myanmar', 'Destroyer', DATE '2000-04-18');

CREATE TABLE BATTLE
(
BattleName   VARCHAR(32),
BattleDate DATE,

            
CONSTRAINT PK_BATTLE
PRIMARY KEY (BattleName)
);

INSERT INTO BATTLE VALUES ('Nightmare', DATE '1876-05-24');
INSERT INTO BATTLE VALUES ('Run', DATE '2013-07-13');
INSERT INTO BATTLE VALUES ('Cry', DATE '1772-06-04');


CREATE TABLE OUTCOME5
(
BattleName  VARCHAR(32),
ShipName    VARCHAR(32),
ResultT VARCHAR(32),
    
CONSTRAINT PK_OUTCOME
    FOREIGN KEY (BattleName)
    REFERENCES BATTLE(BattleName),
    
CONSTRAINT PK_OUTCOME2
    FOREIGN KEY (ShipName)
    REFERENCES SHIP(ShipName)
);

INSERT INTO OUTCOME5 VALUES ('Nightmare', 'OMG', 'Undamaged');
INSERT INTO OUTCOME5 VALUES ('Run', 'Sodade', 'Sunk');
INSERT INTO OUTCOME5 VALUES ('Cry', 'Hang Tight', 'Damaged');
INSERT INTO OUTCOME5 VALUES ('Cry', 'Jetter', 'Damaged');

SELECT * FROM TYPEF;
SELECT * FROM SHIP;
SELECT * FROM BATTLE;
SELECT * FROM OUTCOME5;

SELECT Country from (TYPEF T INNER JOIN SHIP S ON T.TypeName = S.ShipType) Where Weight = (SELECT Min(Weight) FROM TYPEF);

SELECT ShipType from (SHIP S INNER JOIN OUTCOME5 O ON S.ShipName = O.ShipName) Where ResultT != 'Sunk';

SELECT ShipName, NumberOfGuns FROM (TYPEF T INNER JOIN SHIP S ON T.TypeName = S.ShipType) WHERE NumberOfGuns >= 6;

SELECT BattleName FROM (SHIP S INNER JOIN OUTCOME5 Y ON S.ShipName = Y.ShipName) WHERE ShipType = 'Destroyer';
