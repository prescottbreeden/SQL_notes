----------------------------
------- ONE TO MANY -------
----------------------------

SELECT * FROM customers, orders WHERE customers.id = orders.customer_id;

-- implicit inner join --
SELECT first_name, last_name, order_date 
FROM customers, orders 
	WHERE customers.id = orders.customer_id;

-- explicit inner join --
SELECT * 
FROM customers
JOIN orders
	ON customers.id = orders.customer_id;

SELECT first_name, last_name, order_date 
FROM customers
JOIN orders
	ON customers.id = orders.customer_id;

-- order doesn't really matter: following produces identical table
SELECT first_name, last_name, order_date 
FROM orders
JOIN customers
	ON customers.id = orders.customer_id;

-- arbitrary join - don't do this!
-- result is mismatched ids!
SELECT * FROM customers
JOIN orders ON customers.id = orders.id;


-- getting fancier

SELECT first_name, last_name, order_date, amount 
FROM orders
JOIN customers
	ON customers.id = orders.customer_id
ORDER BY order_date;

SELECT first_name, last_name, order_date, amount 
FROM orders
JOIN customers
	ON customers.id = orders.customer_id
ORDER BY amount DESC;

-- even fancier --

SELECT 
	first_name, 
	last_name,  
	sum(amount) as total_spent
FROM orders
JOIN customers
	ON customers.id = orders.customer_id
GROUP BY customer_id;


-- LEFT JOIN --

SELECT * FROM customers
LEFT JOIN orders
	ON customer_id = orders.customer_id;

-- better --

SELECT
	first_name,
	last_name,
	order_date,
	amount
FROM customers
LEFT JOIN orders
	ON customers.id = orders.customer_id;

SELECT
	first_name,
	last_name,
	sum(amount)
FROM customers
LEFT JOIN orders
	ON customers.id = orders.customer_id
GROUP BY first_name, last_name;


SELECT
	first_name,
	last_name,
	IFNULL(sum(amount), 0) AS total_spent
FROM customers
LEFT JOIN orders
	ON customers.id = orders.customer_id
GROUP BY first_name, last_name
ORDER BY total_spent;

-- right join -- mostly ignore -- these are the weeds
-- right join is the same as a left join with the tables swapped

SELECT * FROM customers
RIGHT JOIN orders
	ON customers.id = orders.customer_id;

SELECT 
    IFNULL(first_name,'MISSING') AS first, 
    IFNULL(last_name,'USER') AS last, 
    order_date, 
    amount, 
    SUM(amount)
FROM customers
RIGHT JOIN orders
    ON customers.id = orders.customer_id
GROUP BY first_name, last_name;

----------------------------
------- MANY TO MANY -------
----------------------------

-- using netflix_reviews DB

SELECT * FROM series
JOIN reviews
	ON series.id = reviews.series_id;

-- challenge 1 -- JOIN shows with reviews

SELECT title, rating 
FROM series
JOIN reviews
	ON series.id = reviews.series_id;

-- challenge 2 -- JOIN shows with avg ratings

SELECT
	title, 
	avg(rating) as avg_rating
FROM series
JOIN reviews
	ON series.id = reviews.series_id
GROUP BY title
ORDER BY avg_rating;

-- challenge 3 -- JOIN reviewers with ratings

SELECT
	first_name,
	last_name,
	rating
FROM reviewers
JOIN reviews
	ON reviewers.id = reviews.reviewer_id;

-- challenge 4 -- unreviewed_series

SELECT
	title as 'unreviewed_series'
FROM series
LEFT JOIN reviews
	ON series.id = reviews.series_id
WHERE rating IS NULL;

-- challenge 5 -- genre and avg_rating

SELECT
	genre,
	ROUND(
		AVG(rating),
		2 
	) AS avg_rating
FROM series
INNER JOIN reviews
	ON series.id = reviews.series_id
GROUP BY genre;

-- challenge 6 -- REVIEWER STATS

SELECT 
	first_name,
	last_name,
	COUNT(rating) AS count,
	IFNULL(MIN(rating), 0) AS min,
	IFNULL(MAX(rating), 0) AS max,
	IFNULL(AVG(rating), 0) AS avg,
	-- IF(COUNT(rating) >= 1, 'ACTIVE', 'INACTIVE') AS STATUS
	CASE
		WHEN COUNT(rating) >= 10 THEN 'POWER USER'
		WHEN COUNT(rating) > 0 THEN 'ACTIVE'
		ELSE 'INACTIVE'
	END AS status
FROM reviewers
LEFT JOIN reviews
	ON reviewers.id = reviews.reviewer_id
GROUP BY first_name, last_name
ORDER BY status;

-- challenge 7 -- title, rating, reviewer
-- many to many join --
SELECT 
	title,
	rating,
	CONCAT(first_name, ' ', last_name) AS reviewer
FROM series
INNER JOIN reviews
	ON series.id = reviews.series_id
INNER JOIN reviewers
	ON reviews.reviewer_id = reviewers.id
ORDER BY title;

--