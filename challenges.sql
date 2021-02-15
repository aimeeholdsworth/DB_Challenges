USE `sakila`;
-- List all actors
SELECT * FROM actor;

-- Surname of actor with first name John
SELECT * FROM actor WHERE `first_name` LIKE "john";

-- find actors with surname neeson
SELECT * FROM actor WHERE `last_name` LIKE "neeson";

-- actors with id numbers divisble by 10
SELECT * FROM actor WHERE (`actor_id` % 10) =0;

-- description of film with id 100
SELECT `description` FROM film WHERE `film_id` = 100;

-- find every r rated movie
SELECT * FROM film WHERE `rating` LIKE "R";

-- find every non r rated movie
SELECT * FROM film WHERE `rating` NOT LIKE "R";

-- FIND 10 SHORTEST MOVIES
SELECT *  FROM film ORDER BY `length` ASC LIMIT 10;

-- FILMS WITH LONGEST RUN TIME
SELECT * 
FROM `film` 
WHERE `length` = (
SELECT MAX(`length`) FROM film
);

-- find all movies with deleted scenes
SELECT *
FROM `film`
WHERE `special_features` LIKE "%Deleted Scenes";

-- USe having to reverse the names alphabetically, then list names that aren't repeated
SELECT `last_name`, COUNT(*)
FROM actor
GROUP BY `last_name`
HAVING  COUNT(*) =1
ORDER BY `last_name` DESC;

-- list names that appear more than once, highest frequency to lowest frequency
SELECT `last_name`, COUNT(*)
FROM actor
GROUP BY `last_name`
HAVING COUNT(*)>1
ORDER BY COUNT(*) DESC;

-- WHICH ACTOR HAS APPEARED IN THE MOST FILMS
SELECT * FROM `film_actor`;



SELECT actor.actor_id, first_name, last_name, COUNT(actor.actor_id)
FROM actor
JOIN film_actor ON actor.actor_id=film_actor.actor_id
GROUP BY actor.actor_id
ORDER BY COUNT(actor.actor_id) DESC LIMIT 1;

-- average run time of all films
SELECT AVG(length)
FROM film;

-- average runtime for every film category
SELECT avg(f.length), fc.category_id FROM film AS f JOIN film_category AS fc ON f.film_id = fc.film_id
GROUP BY fc.category_id;

-- list all films featuring a robot
SELECT *
FROM `film`
WHERE `description` LIKE "%Robot%";

-- how many films released in 2010
SELECT COUNT(title), release_year
FROM film WHERE `release_year` ="2010";

-- find the titles of all the horror movies
SELECT * FROM category;

-- name of staff member with id 2
SELECT `first_name`, `last_name` FROM staff WHERE `staff_id` = 2;

-- all movies fred costner has appeared in








