SELECT client_id FROM client WHERE district_id =1 LIMIT 5 ;
SELECT client_id FROM client WHERE district_id =72 ORDER BY client_id DESC LIMIT 1 ;
SELECT amount FROM loan ORDER BY amount ASC LIMIT 3 ;
SELECT DISTINCT status FROM loan ORDER BY status ASC LIMIT 4 ;
SELECT loan_id FROM loan ORDER BY payments DESC LIMIT 1;
SELECT amount, account_id  FROM loan ORDER BY account_id LIMIT 5;
SELECT account_id, amount FROM loan WHERE duration = 60 ORDER BY amount ASC LIMIT 5;
SELECT DISTINCT k_symbol FROM `order`;
SELECT order_id FROM `aorder` WHERE account_id =34 ;
SELECT DISTINCT account_id FROM `order` WHERE order_id>29540 AND order_id<29561;
SELECT amount FROM `order` WHERE account_to=30067122;
SELECT trans_id, date, type, amount FROM trans WHERE account_id = 793 ORDER BY date DESC LIMIT 10;
SELECT district_id, count(client_id) FROM client WHERE district_id <10 GROUP BY district_id ORDER BY district_id ASC; -- nope
SELECT type, count(card_id) FROM card GROUP BY type;
SELECT account_id, sum(amount) FROM loan GROUP BY account_id ORDER BY sum(amount) DESC LIMIT 10;
SELECT date, count(loan_id) FROM loan WHERE date<930907 GROUP BY date ORDER BY date DESC;
SELECT date, duration, count(loan_id) FROM loan WHERE date LIKE "9712%" GROUP BY date ORDER BY date, duration ASC;

