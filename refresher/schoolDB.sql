-- CREATE SCHEMA

CREATE SCHEMA IF NOT EXISTS schoolDB
		DEFAULT CHARACTER SET utf8;

USE schoolDB;

-- CREATING STUDENTS TABLE

CREATE TABLE IF NOT EXISTS students (
	student_id		INTEGER			NOT NULL	AUTO_INCREMENT,
	first_name		VARCHAR(20)		NOT NULL,
	created_date	DATETIME		NOT NULL	DEFAULT NOW(),
	updated_date	DATETIME		NOT NULL	DEFAULT NOW()	ON UPDATE NOW(),

	PRIMARY KEY (student_id)
);

-- CREATING PAPERS TABLE

CREATE TABLE IF NOT EXISTS papers (
	paper_id		INTEGER			NOT NULL	AUTO_INCREMENT,
	title			VARCHAR(255)	NOT NULL,
	grade			INTEGER			NOT NULL,
	student_id		INTEGER,

	PRIMARY KEY (paper_id),
	FOREIGN KEY (student_id)
		REFERENCES students(student_id)
		ON DELETE CASCADE
);

-- INSERT DATA INTO TABLES

 INSERT INTO students (first_name) 
 VALUES ('Caleb'), 
		('Samantha'), 
		('Raj'), 
		('Carlos'), 
		('Lisa');

 INSERT INTO papers (student_id, title, grade ) 
 VALUES (1, 'My First Book Report', 60),
		(1, 'My Second Book Report', 75),
		(2, 'Russian Lit Through The Ages', 94),
		(2, 'De Montaigne and The Art of The Essay', 98),
		(4, 'Borges and Magical Realism', 89);



