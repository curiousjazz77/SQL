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

select count(*)
from film
where rating = 'R'
and replacement_cost between 5 and 15 ; -- 52

select count(*) 
from film
where rating = 'R'
and replacement_cost >=5 and replacement_cost <= 15 ; --52
