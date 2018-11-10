select first_name, last_name, email from customer
limit 5;

select * from film
order by title;

select distinct release_year from film;

select distinct rental_rate from film;

select distinct rating from film;

select rating, count(rating) from film
group by rating;

select first_name, last_name from customer
where first_name = 'Jamie';

select first_name, last_name from customer
where first_name = 'Jamie' and last_name = 'Rice';


--3524 rows affected
select customer_id, amount, payment_date 
from payment
where amount <= 1 or amount >= 8; --where the rental amount paid is  either less than 1 USD or greater than 8 USD


-3524 total rentals from custmoers paying these amount, there are duplicates
select count(customer_id)
from payment
where amount <= 1 or amount >= 8; --where the rental amount paid is  either less than 1 USD or greater than 8 USD

--598 distinct customers
select count(distinct customer_id)
from payment
where amount <= 1 or amount >= 8; --where the rental amount paid is  either less than 1 USD or greater than 8 USD

select email from customer 
where first_name = 'Jared';

select * from customer 
where store_id = 1;

select * from customer 
where store_id = 1 and address_id > 5;

select * from customer 
where store_id = 1 and address_id >= 200;

select * from customer 
where store_id = 1 or store_id = 2;

select email from customer
where first_name = 'Nancy' 
and last_name = 'Thomas';



select * from film 
limit 3; 

select title, description from film
where title = 'Outlaw Hanky'
;

select description from film
where title = 'Outlaw Hanky'
;

select * from customer 
limit 1;

select address_id, phone from address --432 (id), 419-00-985-7119 (phone)
where address = '259 Ipoh Drive';

select first_name, last_name, address_id from customer --Jesus McCartney
where address_id =
(select address_id from address
where address = '259 Ipoh Drive')
;

select * from payment
limit 3;

select count(*) from payment; --14596

select count(distinct amount) --19 distinct ones
from payment;

select count(distinct( amount)) --19 distinct ones
from payment;

select amount, count(amount --most purchases are amount 4.99, then 2.99 and then 0.99
from payment
group by amount
order by amount;

select count(amount) 
from payment
where amount > 5; --3618 payments were over $5

select count(*) 
from actor
where first_name like 'P%';

select count(distinct(district)) from address; --378
					  
select distinct(district) 
from address;
