/*use when you want to return a value vs procedure when you don't want the same overhead and don't need anything back*/

CREATE OR REPLACE FUNCTION
    raisetopoweragain(base in INTEGER, exponent IN INTEGER) RETURN INTEGER
    /*two go in, nothing comes out in this one*/  
AS 

    x INTEGER := 1;
    
BEGIN

    FOR i IN 1..exponent 
    LOOP
        x := x * base;  
    END LOOP;
 
    return x; 
    
END; 


/*calling function from anonymous block*/

DECLARE

    a INTEGER := 10; 
    b INTEGER := 2; 
 
    
BEGIN

    dbms_output.put_line(' a is ' || a);  
    dbms_output.put_line(' b is ' || b);
    dbms_output.put_line(' Calling function raisetopoweragain...');
    dbms_output.put_line(' result is ' || raisetopoweragain(a,b)); 
    
END;
