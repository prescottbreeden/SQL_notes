CREATE SCHEMA IF NOT EXISTS online_customer_db;

CREATE TABLE IF NOT EXISTS customers (	
	PRIMARY KEY	(customer_id),
	customer_id		INT			NOT NULL	AUTO_INCREMENT,
	first_name		VARCHAR(20)	NOT NULL,
	last_name		VARCHAR(20)	NOT NULL,
	email			VARCHAR(50)	NOT NULL,
	spent_total		INT						DEFAULT 0,
	created_date	timestamp	NOT NULL	DEFAULT CURRENT_TIMESTAMP,
	updated_date	timestamp	NULL		DEFAULT NULL
);

CREATE TABLE IF NOT EXISTS orders (
	order_id	INT			NOT NULL	AUTO_INCREMENT,
	order_date	DATETIME	NOT NULL	DEFAULT NOW,
	amount		INT			NOT NULL	DEFAULT 0,
	PRIMARY KEY (order_id)
);








