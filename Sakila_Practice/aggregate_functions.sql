-- MAX MIN AVG SUM ROUND

select * from payment
limit 5;

select avg(amount) from payment; --"4.2006056453822965"
select min(amount) from payment; --0
select max(amount) from payment; --11.99
select round(avg(amount), 2) from payment; --4.20
select sum(amount) from payment; --61312.04
select round(sum(amount), 1) from payment; --61312.0

select amount
from payment
order by amount; 

select count(amount)
from payment
where  amount=0.0; --24 zero amount transactions
