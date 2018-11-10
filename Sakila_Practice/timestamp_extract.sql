
select * from payment
limit 3;

select payment_date 
from payment;

select extract(day from payment_date) 
from payment;

select extract(month from payment_date) 
from payment;

select extract(year from payment_date) 
from payment;

select customer_id, extract(day from payment_date) 
from payment;

select sum(amount), extract(month from payment_date) as month 
from payment
group by month
order by sum(amount) desc
limit 1;

select sum(amount) as total, extract(month from payment_date) as month 
from payment
group by month
order by total desc
limit 1;
