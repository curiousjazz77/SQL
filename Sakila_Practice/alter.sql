CREATE TABLE link_2(
link_id serial PRIMARY KEY,
title VARCHAR(255) NOT NULL, 
url VARCHAR(255) NOT NULL
);

ALTER TABLE link_2 ADD COLUMN active boolean; 

ALTER TABLE link_2 DROP COLUMN active; 

select * from link_2;

ALTER TABLE link_2 RENAME COLUMN title TO new_title_name;

select * from link_2;

ALTER TABLE link_2 RENAME TO url_table;
select * from url_table;

select * from link_2; -- ERROR:  relation "link_2" does not exist

