-- 1. Which actor has appeared in the most films?
SELECT first_name, count(film_id) as c FROM film_actor AS a INNER JOIN actor as b on a.actor_id = b.actor_id GROUP BY first_name ORDER BY c DESC LIMIT 1;
-- 2. Most active customer (the customer that has rented the most number of films)
SELECT first_name, last_name, count(rental_id) AS rent_most from rental as a INNER JOIN customer AS b ON a.customer_id=b.customer_id GROUP BY first_name, last_name ORDER BY rent_most DESC LIMIT 1;
-- 3 List number of films per category.
SELECT name, count(film_id) AS car_num FROM film_category as f INNER JOIN category AS c ON f.category_id= c.category_id GROUP BY name;
-- 4 Display the first and last names, as well as the address, of each staff member.
SELECT first_name, last_name, address FROM staff AS s LEFT JOIN sakila.address AS a ON s.address_id = a.address_id;
-- 5. Display the total amount rung up by each staff member in August of 2005.
SELECT first_name, last_name, sum(amount) AS sum FROM staff AS s INNER JOIN payment AS p ON s.staff_id = p.staff_id WHERE payment_date LIKE "2005-08%" GROUP BY first_name, last_name;
-- 6. List each film and the number of actors who are listed for that film.
SELECT title, count(actor_id) as num_act FROM FILM as f INNER JOIN film_actor as fa on f.film_id = fa.film_id GROUP BY title; 
-- 7. Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name. 
-- Bonus: Which is the most rented film? The answer is Bucket Brotherhood This query might require using more than one join statement. Give it a try.
SELECT first_name, last_name, sum(amount) as paid_amount FROM customer as c INNER JOIN payment as p on c.customer_id=p.customer_id GROUP BY first_name, last_name ORDER BY last_name ASC;
SELECT title, count(rental_id) as rent_c FROM rental as r LEFT JOIN inventory AS i ON r.inventory_id = i.inventory_id INNER JOIN film as f on i.film_id = f.film_id GROUP BY f.film_id ORDER BY rent_c DESC LIMIT 1;

