
select
customer.customer_id,
sum(amount),
first_name,
last_name,
email 
from customer
inner join payment on payment.customer_id = customer.customer_id
group by customer.customer_id
order by sum(amount) desc;

select
customer.customer_id,
first_name,
last_name,
email, amount, 
payment_date
from customer
inner join payment on payment.customer_id = customer.customer_id;

select
customer.customer_id,
first_name,
last_name,
email, amount, 
payment_date
from customer
inner join payment on payment.customer_id = customer.customer_id
where customer.customer_id = 2
order by payment_date; --all of patricia johnson's payments

select
customer.customer_id,
first_name,
last_name,
email, amount, 
payment_date
from customer
inner join payment on payment.customer_id = customer.customer_id
where customer.first_name like 'A%';

