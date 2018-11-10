select * from payment; 

select customer_id+rental_id as new_id
from payment; 

select customer_id/rental_id as new_id
from payment; 

select customer_id*rental_id as new_id
from payment; 

select customer_id-rental_id as new_id
from payment;

select rental_id/customer_id as new_id
from payment;

select rental_id, customer_id as new_id
from payment;

select round(AVG(amount), 2)
from payment; 

select round(AVG(amount), 2)+round(AVG(rental_id),2)
from payment; 
