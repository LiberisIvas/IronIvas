SELECT * FROM film;
DESCRIBE actor;
SHOW COLUMNS FROM address;
SHOW COLUMNS FROM category;
SHOW COLUMNS FROM country;
SHOW COLUMNS FROM customer;
SELECT TABLE_NAME , COLUMN_NAME FROM information_schema.columns WHERE table_schema = 'sakila' ORDER BY table_name, ordinal_position;
SELECT title FROM film;
SELECT DISTINCT name as "Languages" FROM language;
SELECT COUNT( address_id ) FROM store;
SELECT COUNT( last_name ) FROM staff;
SELECT first_name FROM staff;

