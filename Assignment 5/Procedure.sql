CREATE OR REPLACE PROCEDURE
    raisetopower(base in INTEGER, exponent IN INTEGER, result IN OUT INTEGER)
    
AS 

    x INTEGER:= 1;
    
BEGIN

    FOR i IN 1..exponent LOOP
        x := x * base;
        
    END LOOP;
 
    result := x; /*answer stored in result, third arg will hold the result*/
    
END; 
/

/*calling procedure from anonymous block*/

DECLARE

    a INTEGER := 2; 
    b INTEGER := 10; 
    c INTEGER; 
    
BEGIN

    dbms_output.put_line(' a is ' || a);  
    dbms_output.put_line(' b is ' || b);
    dbms_output.put_line(' Calling procedure raisetopower...');
    raisetopower(a, b, c); /*procedure, not a function. doesn't return any value*/
    dbms_output.put_line(' c is ' || c); 
    
END;
/

/*output:

Procedure RAISETOPOWER compiled

PL/SQL procedure successfully completed.

a is 2
 b is 10
 Calling procedure raisetopower...
 c is 1024
 
 */
    
