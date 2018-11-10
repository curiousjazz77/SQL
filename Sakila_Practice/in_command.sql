select * from rental; 

select customer_id, rental_id, return_date
from rental
where customer_id in (1,2)
order by return_date desc; --Mary and Patricia's rentals over time

select * 
from customer
where customer_id in (1,2); --Mary and Patricia

select customer_id, rental_id, return_date
from rental
where customer_id not in (1,2)
order by return_date desc; --everyone besides Mary and Patricia

select customer_id, rental_id, return_date
from rental
where customer_id in (7, 13, 10)
order by return_date desc;

select customer_id, rental_id, return_date
from rental
where customer_id = 7
or customer_id = 13
or customer_id =10
order by return_date desc;

select customer_id, rental_id, return_date
from rental
where customer_id = 7
or customer_id = 13
or customer_id = 10
order by return_date desc;

select * 
from payment 
where amount in (7.99, 8.99);
