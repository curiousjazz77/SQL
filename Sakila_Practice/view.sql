CREATE VIEW customer_info AS
SELECT first_name, last_name, email, address, phone
FROM customer
JOIN address
ON customer.address_id = address.address_id; 

select * from customer_info; 

ALTER VIEW customer_info RENAME TO customer_master_list; 

select * from customer_master_list;
