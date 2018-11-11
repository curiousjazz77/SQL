delete from link
where name like 'B%';

delete from link
where url = 'www.google.com';

delete from link
where name like 'A%'
returning *;

select * from link;
