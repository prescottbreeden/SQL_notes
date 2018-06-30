-- CREATING SCHEMA

CREATE SCHEMA IF NOT EXISTS new_amazon 
	   DEFAULT CHARACTER SET utf8;

USE new_amazon;

-- CREATING CUSTOMERS TABLE

CREATE TABLE IF NOT EXISTS customers (	
	customer_id		INTEGER			NOT NULL	AUTO_INCREMENT,
	first_name		VARCHAR(20)		NOT NULL,
	last_name		VARCHAR(20)		NOT NULL,
	email			VARCHAR(50)		NOT NULL,
	created_date	DATETIME		NOT NULL	DEFAULT NOW(),
	updated_date	DATETIME		NOT NULL	DEFAULT NOW()	ON UPDATE NOW(),
	
	PRIMARY KEY	(customer_id),
	CONSTRAINT email_unique UNIQUE (email)
);

-- CREATING ORDERS TABLE

CREATE TABLE IF NOT EXISTS orders (
	order_id		INTEGER			NOT NULL	AUTO_INCREMENT,
	order_date		DATETIME		NOT NULL	DEFAULT NOW(),
	amount			DECIMAL(8,2)	NOT NULL,
	customer_id		INTEGER			NOT NULL,
	
	PRIMARY KEY (order_id),
	FOREIGN KEY (customer_id) 
		REFERENCES customers(customer_id)
		ON DELETE CASCADE
);

-- INSERT DATA INTO CUSTOMERS

INSERT INTO customers (first_name, last_name, email)
VALUES ('Boy', 'George', 'george@gmail.com'),
	   ('George', 'Michael', 'gm@gmail.com'),
	   ('David', 'Bowie', 'david@gmail.com'),
	   ('Blue', 'Steele', 'blue@gmail.com'),
       ('Bette', 'Davis', 'bette@aol.com'),
	   ('Chuck', 'Norris', 'chuck@gmail.com');

-- INSERT DATA INTO ORDERS

INSERT INTO orders (order_date, amount, customer_id)
VALUES ('2016/02/10', 99.99, 1),
	   ('2017/11/11', 35.50, 1),
	   ('2014/12/12', 800.67, 2),
	   ('2015/01/03', 12.50, 2),
	   ('1999/04/11', 450.25, 5);



