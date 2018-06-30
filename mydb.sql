CREATE TABLE friends 
	(
		id INT NOT NULL AUTO_INCREMENT,
		first_name VARCHAR(100) NOT NULL,
		last_name VARCHAR(100) NOT NULL,
		occupation VARCHAR(100) NOT NULL,
		created_at DATETIME DEFAULT NOW(),
		updated_at DATETIME DEFAULT NOW(),
		PRIMARY KEY(id)
	);

INSERT INTO friends (first_name, last_name, occupation)
VALUES 
("Jimmy", "John", "Sandwich");


INSERT INTO friends (first_name, last_name, occupation)
VALUES 
("", "Patel", "Instructor"),
("Jimmy", "Jun", "Instructor");


SELECT DATE_FORMAT(created_at, '%M %D') FROM friends;