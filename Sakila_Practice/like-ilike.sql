
select first_name, last_name
from customer
where first_name like 'Jen%'; --pattern matching technique

--underscore matches any single character
--percent matches any sequence of characters

select first_name, last_name
from customer
where first_name like '%er%'; --bring back a ton of results, wildcard on both sides

select first_name, last_name
from customer
where first_name like '_her%'; --underscore to replace first character of name

select first_name, last_name
from customer
where first_name like 'BAR%'; --none brought back due to caps

--matching values without regard to case sensitivity
--ilike for case insensitivity
select first_name, last_name
from customer
where first_name ilike 'BAR%'; --results come back irrespective of caps

select first_name, last_name
from customer
where first_name ilike 'BaR%'; --results come back irrespective of caps

