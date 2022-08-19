--1 - List all customers who live in Texas
SELECT first_name, last_name 
FROM customer WHERE address_id IN( 
		SELECT address_id FROM address
		WHERE district = 'Texas');

-- 2 Get all payments above $6.99 with the Customer’s full name

SELECT first_name, last_name FROM customer 
WHERE customer_id IN (	
	SELECT customer_id FROM payment 
	WHERE payment.amount > 6.99);

-- 3 Show all customer names who have made payments over $175
SELECT first_name, last_name FROM customer 
WHERE customer_id IN (	
	SELECT customer_id FROM payment 
	GROUP BY payment.customer_id
	HAVING sum(payment.amount) > 175);

-- 4 List all customers that live in Argentina
SELECT first_name, last_name FROM customer    
WHERE customer.address_id IN (
	SELECT address_id FROM address           
	WHERE address.city_id IN(
		SELECT city_id FROM city 	       
		WHERE city.country_id IN(
			SELECT country_id FROM country     
			WHERE country = 'Argentina')
		)
	);

-- 5 Which film category has the least movies in it 
SELECT "name" FROM category 
WHERE category.category_id = (
	SELECT category_id FROM film_category 
	GROUP BY category_id
	ORDER BY count(category_id) ASC
	LIMIT 1);

-- 6 What film had the most actors in it
SELECT title FROM film 
WHERE film.film_id = (
	SELECT film_id FROM film_actor 
	GROUP BY film_id
	ORDER BY count(film_id) DESC
	LIMIT 1);

-- 7 Which actor has been in the least movies?
SELECT first_name, last_name FROM actor 
WHERE actor.actor_id = (
	SELECT actor_id FROM film_actor 
	GROUP BY actor_id
	ORDER BY count(actor_id) ASC
	LIMIT 1);

-- 8 Which country has the most cities?
SELECT country FROM country 
WHERE country.country_id = (
	SELECT country_id FROM city 
	GROUP BY city_id
	ORDER BY count(city_id) DESC
	LIMIT 1);

-- 9 List the actors who have been in more than 3 films but less than 6.
SELECT first_name, last_name FROM actor 
WHERE actor.actor_id IN (
	SELECT actor_id FROM film_actor 
	GROUP BY actor_id
	HAVING count(actor_id) BETWEEN 3 AND 15);

