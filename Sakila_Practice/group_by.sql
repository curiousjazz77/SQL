
SELECT * FROM PAYMENT
LIMIT 2;

select customer_id, sum(amount) 
from payment
group by customer_id
order by sum(amount) desc;

select customer_id 
from payment
order by customer_id desc; -- duplicates

select customer_id 
from payment
group by customer_id
order by customer_id desc; -- no duplicates

select sum(amount) 
from payment
group by customer_id;

select staff_id, sum(payment_id) 
from payment
group by staff_id;

select rating, count(rating) 
from film
group by rating;


select rental_duration, count(rental_duration) 
from film
group by rental_duration;

select rating, rental_rate
from film
group by rating, rental_rate
order by rating;

select rating, avg(rental_rate)
from film
group by rating;

select staff_id, count(amount) as payments_handled, sum(amount) as dollars_handled 
from payment
group by staff_id 
;
/*
staff person two handled the most payments
staff person two handled the most money

1	"7292" number of payments
2	"7304"

1	"30252.12" total amount handled
2	"31059.92"
*/

select rating, round(avg(replacement_cost), 2) 
from film
group by rating;

select customer_id, sum(amount) 
from payment
group by customer_id
order by sum(amount) desc
limit 5;

