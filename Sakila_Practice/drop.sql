CREATE TABLE test_two(
test_id serial PRIMARY KEY);

SELECT * FROM test_two;

drop table test_two;

SELECT * FROM test_two; -- ERROR:  relation "test_two" does not exist

drop table if exists test_two;

drop table if exists test_two restrict; --restrict is there by default so you don't delete dependent objects

drop table if exists test_two cascade; --remove dependent objects together
