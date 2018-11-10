select count(title) from film;
select count(*) from payment; --14596
select count(distinct (amount)) from payment; --19

select * from customer 
limit 5;

select * from customer 
limit 1;


select first_name, last_name from customer
order by first_name ASC; 

select first_name, last_name from customer
order by first_name DESC;

select first_name, last_name from customer
order by last_name ASC; 

select first_name, last_name from customer
order by last_name DESC; 



select first_name, last_name from customer
order by first_name ASC, --if first name is the same, last name descending ordering takes effect
last_name DESC;


select first_name, last_name from customer
order by last_name ASC, --if last name is the same, first name descending ordering takes effect
first_name DESC;
