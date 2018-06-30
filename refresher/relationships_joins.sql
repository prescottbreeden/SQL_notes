-- CREATING SCHEMA

CREATE SCHEMA IF NOT EXISTS new_amazon DEFAULT CHARACTER SET utf8;
USE new_amazon;

-- CREATING CUSTOMERS TABLE

CREATE TABLE IF NOT EXISTS customers (	
	customer_id		INTEGER		NOT NULL	AUTO_INCREMENT,
	first_name		VARCHAR(20)	NOT NULL,
	last_name		VARCHAR(20)	NOT NULL,
	email			VARCHAR(50)	NOT NULL,
	spent_total		FLOAT					DEFAULT 0,
	created_date	TIMESTAMP	NOT NULL	DEFAULT CURRENT_TIMESTAMP,
	updated_date	TIMESTAMP	NULL		DEFAULT NULL,
	
	PRIMARY KEY	(customer_id),
	CONSTRAINT email_unique UNIQUE (email),

);

-- CREATING ORDERS TABLE

CREATE TABLE IF NOT EXISTS orders (
	order_id	INTEGER		NOT NULL	AUTO_INCREMENT,
	order_date	TIMESTAMP	NOT NULL	DEFAULT CURRENT_TIMESTAMP,
	amount		FLOAT		NOT NULL	DEFAULT 0,
	
	PRIMARY KEY (order_id)
);

INSERT INTO customers (first_name, last_name, email)
VALUES ('Chuck', 'Norris', 'chuck@gmail.com'),
	   ('Bill', 'Clinton', 'bill@gmail.com'),
	   ('Boy', 'George', 'george@gmail.com'),
	   ('George', 'Michael', 'gm@gmail.com'),
	   ('David', 'Bowie', 'david@gmail.com'),
	   ('Blue', 'Steele', 'blue@gmail.com');



