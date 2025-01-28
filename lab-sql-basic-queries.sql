-- Display all available tables in the Sakila database.
USE sakila;
SHOW TABLES;
-- Retrieve all the data from the tables `actor`, `film` and `customer`.
SELECT * FROM actor;
SELECT * FROM film;
SELECT * FROM customer;
-- Retrieve the following columns from their respective tables:
-- Titles of all films from the `film` table
SELECT title FROM film;
-- List of languages used in films, 
-- with the column aliased as `language` from the `language` table
SELECT name AS language FROM language;
-- List of first names of all employees from the `staff` table
SELECT first_name FROM staff;
-- Retrieve unique release years.
SELECT DISTINCT release_year FROM film;
-- Counting records for database insights:
-- Determine the number of stores that the company has.
SELECT COUNT(store_id) AS nr_stores FROM store;
-- Determine the number of employees that the company has.
SELECT COUNT(staff_id) AS nr_employees FROM staff;
-- Determine how many films are available for rent and how many have been rented.
SELECT COUNT(film_id) AS nr_films FROM film;
SELECT DISTINCT inventory_id, COUNT(rental_id) AS nr_rentals FROM rental GROUP BY inventory_id;
SELECT COUNT(DISTINCT inventory_id) AS nr_rented_films FROM rental;
-- Determine the number of distinct last names of the actors in the database.
SELECT COUNT(DISTINCT last_name) AS distinct_last_name FROM actor;
-- Retrieve the 10 longest films.
SELECT title, length FROM film ORDER BY length DESC, title ASC LIMIT 5;
-- Use filtering techniques in order to:
-- Retrieve all actors with the first name "SCARLETT".
SELECT first_name, last_name FROM actor
WHERE first_name="SCARLETT" GROUP BY last_name;
-- Retrieve all movies that have ARMAGEDDON in their title 
-- and have a duration longer than 100 minutes. 
-- Hint: use `LIKE` operator. (https://www.w3schools.com/sql/sql_like.asp)
SELECT title, length FROM film WHERE length>100 AND title LIKE "%ARMAGEDDON%" ORDER BY title;
-- Determine the number of films that include Behind the Scenes content
SELECT DISTINCT special_features FROM film;
SELECT COUNT(film_id) as nr_films_behind_scenes FROM film
WHERE special_features LIKE "%Behind%";
