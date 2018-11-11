 create table teachers(
	teacher_id serial PRIMARY KEY, 
	first_name varchar(50) NOT NULL,  
	last_name varchar(50) NOT NULL, 
	homeroom_number INTEGER, 
	department varchar(50),  
	email varchar(50) UNIQUE, 
	phone varchar(20) UNIQUE
);

create table students(
	student_id serial PRIMARY KEY,
	first_name varchar(50) NOT NULL,
	last_name varchar(50) NOT NULL, 
	homeroom_number INTEGER, 
	phone varchar(20) UNIQUE,
	email varchar(100) UNIQUE,
	grad_year INTEGER
);

select * from teachers; 
select * from students;

--since first student to add, id will be set to 1 automatically
insert into students(first_name, last_name, homeroom_number, phone, grad_year)
VALUES ('Mark', 'Watney', 5, '7775551234', 2035); 

select * from students;

insert into teachers(first_name, last_name, homeroom_number, department, email, phone)
VALUES ('Jonas', 'Salk', 5, 'Biology', 'jsalk@school.org', '7775554321'); 

select * from teachers;
