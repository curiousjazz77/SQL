declare
    X NUMBER(3,0) := 12;
    Y X%type := 5;
    Z X%type;
    A X%type; 
    requirement NUMBER(2,0) := 18;
    age requirement%type := 28;
    grade CHAR(1) := 'X';
    counter INTEGER := 12;
    another_counter INTEGER := 7; 
    /*counter 3 declared implicitly by for loop*/
    
begin
        dbms_output.put_line( 'Hello Everyone!' );
        dbms_output.put_line( 'This is very simple PL/SQL.' );
        dbms_output.put_line( 'X is ' || X);
        dbms_output.put_line( ' Y is ' || Y);
        Z := X * Y;
        dbms_output.put_line('X * Y is' || Z);
        A := X + Y; 
        dbms_output.put_line('X + Y is' || A );
        
        dbms_output.put('Age ' || age || ': ' );
        IF (age >= requirement) THEN
            dbms_output.put_line( 'old enough to vote.');
        ELSE 
            dbms_output.put_line( 'not old enough to vote.');
        END IF; 
            
    /* one way...*/
    
    IF (grade = 'A') THEN
        dbms_output.put_line( 'Excellent!');
    ELSIF (grade = 'B') THEN
    dbms_output.put_line( 'Very Good');
     ELSIF (grade = 'C') THEN
    dbms_output.put_line( 'Satisfactory');
     ELSIF (grade = 'D') THEN
    dbms_output.put_line( 'Borderline');
     ELSIF (grade = 'F') THEN
    dbms_output.put_line( 'Failed');
    ELSE
    dbms_output.put_line( 'Invalid grade...?');
    END IF; 
    
    /*repeats until exit*/
    loop
        dbms_output.put_line( counter);
        if (counter = 0) then
            dbms_output.put_line( 'Blast off!');
            exit;
        else
            counter := counter -1;
        end if; 
    end loop; 
    
    /*repeats until false*/
    while (another_counter >= 0) loop
        dbms_output.put_line(another_counter);
        another_counter := another_counter - 1;
        /*anther_counter +1 would trigger infinite loop and error
        buffer overflow by 20,000 bytes*/
    end loop;
    
    dbms_output.put_line( 'Blast off!');
    
    for counter3 in reverse 0..8 loop
        dbms_output.put_line(counter3);
    end loop;
    dbms_output.put_line( 'Blast off!');
    
    /*print 4 rows in reverse, nested loop */
    for row in reverse 1..4 loop
        dbms_output.put_line( 'Row ' || row || ': ');
        /*...w/ ith row containing i stars*/
        for i in reverse 1..row loop
            dbms_output.put_line( '*');
        end loop;
        dbms_output.put_line( '');
    end loop; 
    
     /*print 6 rows in order, nested loop */
    for row in 1..6 loop
        dbms_output.put_line( 'Row ' || row || ': ');
        /*...w/ ith row containing i stars*/
        for i in 1..row loop
            dbms_output.put_line( '*');
        end loop;
        dbms_output.put_line( '');
    end loop; 
       
end; 
