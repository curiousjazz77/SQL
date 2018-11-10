select payment_id as my_payment_column
from payment;

select customer_id, sum(amount) as total_spent
from payment
group by customer_id; 
