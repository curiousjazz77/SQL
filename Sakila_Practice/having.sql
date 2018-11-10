
--Having has usage for aggregate functions and always comes at end after group by statement if used. 
select customer_id, sum(amount)
from payment
group by customer_id
having sum(amount) > 200;

select store_id, count(customer_id)
from customer
group by store_id
having count(customer_id) > 300;

select rating, rental_rate 
from film
where rating in ('R', 'G', 'PG');

select rating, avg(rental_rate) 
from film
where rating in ('R', 'G', 'PG')
group by rating;

select rating, avg(rental_rate) 
from film
where rating in ('R', 'G', 'PG')
group by rating
having avg(rental_rate) < 3;

select rating, avg(rental_rate) 
from film
group by rating
having avg(rental_rate) < 3;

select customer_id, count(amount)
from payment
group by customer_id
having count(amount) >= 40;

select rating, avg(rental_duration) 
from film
group by rating
having avg(rental_duration) > 5
; 
