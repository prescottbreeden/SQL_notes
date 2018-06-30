-- IMPLICIT INNER JOIN

 SELECT c.customer_id, 
		c.first_name, 
		c.last_name, 
		o.order_date, 
		o.amount
   FROM customers AS c, 
		orders AS o 
  WHERE c.customer_id = o.customer_id;

-- EXPLICIT INNER JOIN

 SELECT c.customer_id, 
		c.first_name, 
		c.last_name, 
		o.order_date, 
		o.amount
   FROM customers AS c
		INNER JOIN orders AS o
		ON c.customer_id = o.customer_id
		ORDER BY amount;



 SELECT CONCAT(c.first_name, ' ', c.last_name) AS name,
		o.order_date,
		SUM(o.amount) AS total_spent
   FROM customers AS c
		INNER JOIN orders AS o
		ON c.customer_id = o.customer_id
		GROUP BY o.customer_id, o.order_date;


-- LEFT JOIN

 SELECT c.first_name,
		c.last_name,
		o.order_date,
		o.amount
   FROM customers AS c
		LEFT JOIN orders AS o
		ON c.customer_id = o.customer_id;


 SELECT CONCAT(c.first_name, ' ', c.last_name) AS name,
		SUM(o.amount) AS total_spent
   FROM customers AS c
		LEFT JOIN orders AS o
		ON c.customer_id = o.customer_id
		GROUP BY c.customer_id;


 SELECT CONCAT(c.first_name, ' ', c.last_name) AS name,
		IFNULL(SUM(o.amount), 0) AS total_spent
   FROM customers AS c
		LEFT JOIN orders AS o
		ON c.customer_id = o.customer_id
		GROUP BY c.customer_id
		ORDER BY total_spent; 


 SELECT CONCAT(c.first_name, ' ', c.last_name) AS name,
		SUM(o.amount) AS total_spent
   FROM orders AS o
		LEFT JOIN customers AS c
		ON c.customer_id = o.customer_id
		GROUP BY c.customer_id;

-- RIGHT JOIN

 SELECT c.first_name,
		c.last_name,
		o.order_date,
		o.amount
   FROM customers as c
		RIGHT JOIN orders AS o
		ON c.customer_id = o.customer_id;



