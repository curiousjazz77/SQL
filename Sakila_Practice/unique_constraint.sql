CREATE TABLE people(
id serial PRIMARY KEY,
first_name VARCHAR(50),
email VARCHAR(100) UNIQUE);

select * from people;

insert into people(id, first_name, email)
VALUES (1, 'Joe', 'joe@joe.com'); 

select * from people;

insert into people(id, first_name, email)
VALUES (1, 'Joe', 'joe@joe.com'); --duplicate key value violates unique constraint "people_pkey"
