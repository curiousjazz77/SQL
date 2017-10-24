@/Users/.../Workers.sql
INSERT INTO WORKERS VALUES('X', 4, 95000); 
INSERT INTO WORKERS VALUES('Y', 1, 99000); 
INSERT INTO WORKERS VALUES('Z', 2, 92000);

/* output


Table WORKERS dropped.


Table WORKERS created.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


1 row inserted.


N DEPTNUMBER     SALARY
- ---------- ----------
A          5      30000
B          2      45000
C          5      70000
D          2      55000
E          1      25000
F          3      90000
G          4      90000
H          2      39000
I          1      36000
J          3      60000
K          5      76000

N DEPTNUMBER     SALARY
- ---------- ----------
L          3      40000
M          4      85000
N          1      39000
O          2      42000

15 rows selected. 


SUM(SALARY)
-----------
     822000


Trigger SALARYCAP compiled


1 row inserted.


Error starting at line : 3 in command -
INSERT INTO WORKERS VALUES('Y', 1, 99000)
Error report -
ORA-20001: Million Dollar Limit Excceeded
ORA-06512: at "JOMEKE.SALARYCAP", line 11
ORA-04088: error during execution of trigger 'JOMEKE.SALARYCAP'


Error starting at line : 4 in command -
INSERT INTO WORKERS VALUES('Z', 2, 92000)
Error report -
ORA-20001: Million Dollar Limit Excceeded
ORA-06512: at "JOMEKE.SALARYCAP", line 11
ORA-04088: error during execution of trigger 'JOMEKE.SALARYCAP'

*/
