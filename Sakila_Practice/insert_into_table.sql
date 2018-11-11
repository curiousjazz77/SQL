
CREATE TABLE link(
ID serial PRIMARY KEY,
url VARCHAR(255) NOT NULL, 
name VARCHAR(255) NOT NULL,
description VARCHAR(255),
rel VARCHAR(50)
);

select * from link; 

insert into link(url, name)
VALUES
('www.google.com', 'Google');

select * from link;

insert into link(url, name)
VALUES
('www.yahoo.com', 'Yahoo');

insert into link(url, name)
VALUES
('www.bing.com', 'Bing'),
('www.amazon.com', 'Amazon')
;

select * from link;
