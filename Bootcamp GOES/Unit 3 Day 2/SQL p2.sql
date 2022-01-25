-- 1 Write a query to display for each store its store ID, city, and country.
SELECT store_id, address, city, country FROM store as s
INNER JOIN address as a ON s.address_id=a.address_id
INNER JOIN city as c on a.city_id=c.city_id
INNER JOIN country as ctr on ctr.country_id = c.country_id;

-- 2 Write a query to display how much business, in dollars, each store brought in.
SELECT sr.store_id, sum(amount) as tsum FROM store as sr
INNER JOIN staff as sf ON sr.store_id=sf.store_id
INNER JOIN payment as p on sf.staff_id=p.staff_id
GROUP BY sr.store_id;

-- 3 What is the average running time(length) of films by category?
SELECT name, AVG(length) as average_lenght FROM film as f
INNER JOIN film_category as fc ON f.film_id=fc.film_id
INNER JOIN category as c ON c.category_id=fc.category_id
GROUP BY name;

-- 4 Which film categories are longest(length)? (Hint: You can rely on question 3 output.)
SELECT name, AVG(length) as average_lenght FROM film as f
INNER JOIN film_category as fc ON f.film_id=fc.film_id
INNER JOIN category as c ON c.category_id=fc.category_id
GROUP BY name
ORDER BY average_lenght DESC LIMIT 5;

-- 5 Display the most frequently(number of times) rented movies in descending order.
SELECT title, count(rental_id) as rent_c FROM rental as r 
LEFT JOIN inventory AS i ON r.inventory_id = i.inventory_id
INNER JOIN film as f on i.film_id = f.film_id 
GROUP BY f.film_id ORDER BY rent_c DESC LIMIT 5;

-- 6. List the top five genres in gross revenue in descending order
SELECT name, sum(amount) as gross FROM category AS ctg 
inner join film_category as fctg on ctg.category_id=fctg.category_id
-- inner join film as f on fctg.film_id=f.film_id
inner join inventory as i on fctg.film_id=i.film_id
inner join rental as r on i.inventory_id=r.inventory_id
inner join payment as p on r.rental_id=p.rental_id
GROUP BY name
ORDER BY gross DESC LIMIT 5;

-- 7.Is "Academy Dinosaur" available for rent from Store 1?
SELECT title, rental_date, return_date FROM film as f
inner join inventory as i on f.film_id=i.film_id
inner join rental as r on i.inventory_id=r.inventory_id
WHERE title LIKE "Academy%" 
ORDER BY rental_date, return_date ;





