-- CREATE EMPLOYEES TABLE

CREATE TABLE employees (
    employee_id		INTEGER			NOT NULL	AUTO_INCREMENT	PRIMARY KEY,
    first_name		VARCHAR(255)	NOT NULL,
    last_name		VARCHAR(255)	NOT NULL,
    middle_name		VARCHAR(255),
    age				INTEGER			NOT NULL,
    current_status	VARCHAR(100)	NOT NULL	DEFAULT 'employed',
	created_date	DATETIME		NOT NULL	DEFAULT NOW(),
	updated_date	DATETIME		NOT NULL	DEFAULT NOW()	ON UPDATE NOW()
);

 INSERT INTO employees 
		(last_name, first_name, age, current_status)
 VALUES ('Breeden', 'Prescott', 35, 'fired'),
        ('Franklin', 'Bob', 62, 'retired');

-- CREATE SHIRTS TABLE

CREATE TABLE shirts (
    shirt_id		INTEGER			NOT NULL	AUTO_INCREMENT	PRIMARY KEY,
    article			VARCHAR(50)		NOT NULL,
    color			VARCHAR(50)		NOT NULL,
    shirt_size		VARCHAR(3)		NOT NULL,
    last_worn		INTEGER			NOT NULL	DEFAULT 0,
	created_date	DATETIME		NOT NULL	DEFAULT NOW(),
	updated_date	DATETIME		NOT NULL	DEFAULT NOW()	ON UPDATE NOW()
);

 INSERT INTO shirts (article, color, shirt_size, last_worn)
 VALUES ('t-shirt', 'white', 'S', 10),
		('t-shirt', 'green', 'S', 200),
		('polo-shirt', 'black', 'M', 10),
		('tank top', 'blue', 'S', 50),
		('t-shirt', 'pink', 'S', 0),
		('polo shirt', 'red', 'M', 5),
		('tank top', 'white', 'S', 200),
		('tank top', 'blue', 'M', 15);
