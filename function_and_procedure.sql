--1. Create a Stored Procedure that will insert a new film into the film table with the
--following arguments: title, description, release_year, language_id, rental_duration,
--rental_rate, length, replace_cost, rating

CREATE OR REPLACE PROCEDURE add_film(
							title VARCHAR, 
							description VARCHAR, 
							release_year INTEGER, 
							language_id INTEGER, 
							rental_duration INTEGER, 
							rental_rate NUMERIC(5, 2), 
							length INTEGER, 
							replacement_cost NUMERIC(5, 2), 
							rating public.mpaa_rating)
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO film(
		title,
		description, 
		release_year,
		language_id,
		rental_duration,
		rental_rate,
		length,
		replacement_cost,
		rating)
	VALUES (
		title,
		description, 
		release_year,
		language_id,
		rental_duration,
		rental_rate,
		length,
		replacement_cost,
		rating);
END;
$$;

CALL add_film( 'Deathgasm', 'Hardcore carnage at the local deli', '2024', '1', '7', '7.99', '128', '99.99', 'G');

SELECT * FROM film WHERE title = 'Deathgasm';



--2. Create a Stored Function that will take in a category_id and return the number of
--films in that category

SELECT COUNT(*) 
FROM film_category
WHERE category_id = 2


CREATE OR REPLACE FUNCTION num_in_cat(num INTEGER)
RETURNS INTEGER
LANGUAGE plpgsql
AS $$
	DECLARE num_cat INTEGER;
BEGIN 
	SELECT COUNT(*) INTO num_cat
	FROM film_category
	WHERE category_id = num;
	RETURN num_cat;
END;
$$;


SELECT num_in_cat(2);
SELECT num_in_cat(3);
SELECT num_in_cat(1);
