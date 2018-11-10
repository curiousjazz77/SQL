
select first_name, last_name 
from customer;

select first_name || ' ' || last_name as full_name 
from customer; --concatenation of empty string

select first_name, char_length(first_name)
from customer;

select last_name, char_length(last_name)
from customer; 

select first_name, char_length(first_name),
last_name, char_length(last_name)
from customer;

select lower(first_name)
from customer;

select char_length(first_name), octet_length(first_name)
from customer;

select 
first_name,
overlay(first_name placing 'e' from 2 for 4)
from customer;

select 
first_name,
substring(first_name from 2 for 4)
from customer;

select substring(first_name || ' ' || last_name from 1 for 6) as full_name
from customer;

--regular expressions are also involved
