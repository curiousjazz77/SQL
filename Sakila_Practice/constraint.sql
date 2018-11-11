select * from new_users; 

insert into new_users(first_name, birth_date, join_date, salary)
values ('Joe', '1980-02-02', '1990-04-04', -10); -- new row for relation "new_users" violates check constraint "new_users_salary_check"

create table checktest(
sales integer constraint positive_sales check(sales > 0)
);

insert into checktest(sales)
values (-12); --new row for relation "checktest" violates check constraint "positive_sales"

create table checktest(
sales integer constraint positive_sales check(sales > 0)
);

insert into checktest(sales)
values (10);

select * from checktest;
