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

--possible in PostgreSQL
select first_name 
from customer
order by last_name; --order by last name even if you don't want that in your results

select first_name, last_name 
from customer
order by last_name; 

select customer_id, amount 
from payment
order by amount DESC
limit 10;

--subquery
select * 
from customer
where customer_id in (select customer_id from payment
order by amount DESC
limit 10)
order by first_name;

select * 
from film
order by film_id
limit 5;
