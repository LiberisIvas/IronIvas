-- 1 How many copies of the film Hunchback Impossible exist in the inventory system?
use sakila;

select count(*) as copies from inventory 
  WHERE  film_id = (SELECT film_id FROM film WHERE title = 'Hunchback Impossible') ;
  
 
-- 2 List all films whose length is longer than the average of all the films

SELECT title, length from film 
WHERE length > (SELECT AVG(length) FROM film ORDER BY length DESC) ; 

-- 3 Use subqueries to display all actors who appear in the film Alone Trip.
SELECT first_name, last_name, actor_id FROM actor
WHERE actor_id IN (SELECT actor_id FROM film_actor
WHERE film_id = (SELECT film_id from film WHERE title = "Alone Trip"));

-- 4 Sales have been lagging among young families, and you wish to target all family movies for a promotion. Identify all movies categorized as family films. 
SELECT title FROM film
WHERE film_id IN (SELECT film_id FROM film_category
WHERE category_id = (SELECT category_id FROM category
WHERE name = "Family"));

-- 5 Get name and email from customers from Canada using subqueries. Do the same with joins. 
-- Note that to create a join, you will have to identify the correct 
-- tables with their primary keys and foreign keys, that will help you get the relevant information.

SELECT first_name, email FROM customer WHERE
address_id IN (SELECT address_id FROM address 
WHERE city_id IN (SELECT city_id FROM city
WHERE country_id IN (SELECT country_id FROM country
WHERE country = "Canada")));

SELECT first_name, email, country FROM customer as c
INNER JOIN address as a on a.address_id=c.address_id
INNER JOIN city as city on city.city_id=a.city_id
INNER JOIN country as country on country.country_id=city.country_id
WHERE country = 'Canada';

-- 6.Which are films starred by the most prolific actor? Most prolific actor is defined as the actor that has acted in the most number 
 -- of films. First you will have to find the most prolific actor and then use that actor_id to find the different films that he/she starred.
SELECT title from film 
WHERE film_id IN (SELECT film_id FROM film_actor 
WHERE actor_id IN (SELECT actor_id FROM 
(SELECT count(actor_id) as "prolific actor" from film_actor
GROUP BY actor_id 
ORDER BY "prolific actor" ) as tableX ))


