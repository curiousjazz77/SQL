create table learn_null(
	first_name varchar(50),
	sales integer NOT NULL
); 

INSERT INTO learn_null(first_name)
VALUES('John'); -- Failing row contains (John, null)

create table learn_null(
	first_name varchar(50),
	sales integer NOT NULL
); 

INSERT INTO learn_null(first_name, sales)
VALUES('John', 12); --valid

select * from learn_null;

