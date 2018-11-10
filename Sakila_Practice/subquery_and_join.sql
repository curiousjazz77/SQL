select * from film; 

select avg(rental_rate) from film; --2.98

select title, rental_rate
from film
where rental_rate > 2.98; 

--subquery
select title, rental_rate
from film
where rental_rate > (select avg(rental_rate) from film);

select * from inventory; --we want to link inventory id to the film info

select inventory.film_id 
from rental
inner join inventory
on inventory.inventory_id = rental.inventory_id
where return_date between '2005-05-29' and '2005-05-30';

select film_id, title
from film
where film_id in 
	(
	select inventory.film_id 
	from rental
	inner join inventory
	on inventory.inventory_id = rental.inventory_id
	where return_date between '2005-05-29' and '2005-05-30'
);
