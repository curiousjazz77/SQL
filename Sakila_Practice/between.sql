select customer_id, amount
from payment
where amount between 8 and 9; --inclusive

select amount, payment_date
from payment
where payment_date between '2007-02-07' and '2007-02-15';  --not inclusive of 2/15

select distinct(payment_date)
from payment
order by payment_date; 

select amount, payment_date
from payment
where payment_date between '2007-02-07' and '2007-02-16';  --not inclusive of 2/16
