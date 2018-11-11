select * from link; 

UPDATE link
SET description = 'Empty Description'; --sets all descriptions as this

select * from link; 

UPDATE link
SET description = 'Name starts with an A'
where name like 'A%';

select * from link; 

UPDATE link
SET description = name;

select * from link; 

UPDATE link
SET description = 'New Description'
where id = 1
returning id, url, name, description;
;

select * from link;
