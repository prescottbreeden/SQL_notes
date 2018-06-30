-- CREATING SCHEMA

CREATE SCHEMA IF NOT EXISTS netflixDB
		DEFAULT CHARACTER SET utf8;

USE netflixDB;

-- CREATING users TABLE

CREATE TABLE IF NOT EXISTS users (
	user_id			INTEGER			NOT NULL	AUTO_INCREMENT	PRIMARY KEY,
	first_name		VARCHAR(20)		NOT NULL,
	last_name		VARCHAR(20)		NOT NULL,
	email			VARCHAR(255)	NOT NULL	DEFAULT 'gmail@gmail.com;',
	created_date	DATETIME		NOT NULL	DEFAULT NOW(),
	updated_date	DATETIME		NOT NULL	DEFAULT NOW()	ON UPDATE NOW()
);

-- CREATING GENRE TABLE

CREATE TABLE IF NOT EXISTS genres (
	genre_id		INTEGER			NOT NULL	AUTO_INCREMENT	PRIMARY KEY,
	genre_type		VARCHAR(255)	NOT NULL,
	created_date	DATETIME		NOT NULL	DEFAULT NOW(),
	updated_date	DATETIME		NOT NULL	DEFAULT NOW()	ON UPDATE NOW()
);

-- CREATING SERIES TABLE

CREATE TABLE IF NOT EXISTS series (
	series_id		INTEGER			NOT NULL	AUTO_INCREMENT	PRIMARY KEY,
	title			VARCHAR(255)	NOT NULL,
	released_year	YEAR(4)			NOT NULL,
	created_date	DATETIME		NOT NULL	DEFAULT NOW(),
	updated_date	DATETIME		NOT NULL	DEFAULT NOW()	ON UPDATE NOW(),
	genre_id		INTEGER			NOT NULL,

	FOREIGN KEY (genre_id)
		REFERENCES genres(genre_id)
);

-- CREATING RATINGS TABLE

CREATE TABLE IF NOT EXISTS ratings (
	rating_id		INTEGER			NOT NULL	AUTO_INCREMENT	PRIMARY KEY,
	rating			DECIMAL(2,1)	NOT NULL,
	series_id		INTEGER			NOT NULL,
	user_id			INTEGER			NOT NULL,

	FOREIGN KEY (user_id)
		REFERENCES users(user_id),
	FOREIGN KEY (series_id)
		REFERENCES series(series_id)
);

-- INSERT GENRE DATUM

 INSERT INTO genres (genre_type)
 VALUES ('Animation'),
		('Action/Adventure'),
		('Comedy'),
		('Drama'),
		('Horror');

-- INSERT REVIWERS DATUM

 INSERT INTO users (first_name, last_name) 
 VALUES ('Thomas', 'Stoneman'),
		('Wyatt', 'Skaggs'),
		('Kimbra', 'Masters'),
		('Domingo', 'Cortes'),
		('Colt', 'Steele'),
		('Pinkie', 'Petit'),
		('Marlon', 'Crafford');

-- INSERT SERIES DATUM
		
 INSERT INTO series (title, released_year, genre_id)
 VALUES ('Archer', 2009, 1),
		('Arrested Development', 2003, 3),
		("Bob's Burgers", 2011, 1),
		('Bojack Horseman', 2014, 1),
		("Breaking Bad", 2008, 4),
		('Curb Your Enthusiasm', 2000, 3),
		("Fargo", 2014, 4),
		('Freaks and Geeks', 1999, 3),
		('General Hospital', 1963, 4),
		('Halt and Catch Fire', 2014, 4),
		('Malcolm In The Middle', 2000, 3),
		('Pushing Daisies', 2007, 3),
		('Seinfeld', 1989, 3),
		('Stranger Things', 2016, 4);

-- INSERT RATINGS DATUM

 INSERT INTO ratings (series_id, user_id, rating) 
 VALUES (1, 1, 8.0),
		(1, 2, 7.5),
		(1, 3, 8.5),
		(1, 4, 7.7),
		(1, 5, 8.9),
		(2, 1, 8.1),
		(2, 4, 6.0),
		(2, 3, 8.0),
		(2, 6, 8.4),
		(2, 5, 9.9),
		(3, 1, 7.0),
		(3, 6, 7.5),
		(3, 4, 8.0),
		(3, 3, 7.1),
		(3, 5, 8.0),
		(4, 1, 7.5),
		(4, 3, 7.8),
		(4, 4, 8.3),
		(4, 2, 7.6),
		(4, 5, 8.5),
		(5, 1, 9.5),
		(5, 3, 9.0),
		(5, 4, 9.1),
		(5, 2, 9.3),
		(5, 5, 9.9),
		(6, 2, 6.5),
		(6, 3, 7.8),
		(6, 4, 8.8),
		(6, 2, 8.4),
		(6, 5, 9.1),
		(7, 2, 9.1),
		(7, 5, 9.7),
		(8, 4, 8.5),
		(8, 2, 7.8),
		(8, 6, 8.8),
		(8, 5, 9.3),
		(9, 2, 5.5),
		(9, 3, 6.8),
		(9, 4, 5.8),
		(9, 6, 4.3),
		(9, 5, 4.5),
		(10, 5, 9.9),
		(13, 3, 8.0),
		(13, 4, 7.2),
		(14, 2, 8.5),
		(14, 3, 8.9),
		(14, 4, 8.9);



