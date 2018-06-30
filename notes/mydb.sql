CREATE TABLE friends (
		friend_id		INTEGER			NOT NULL	AUTO_INCREMENT	PRIMARY KEY,
		first_name		VARCHAR(100)	NOT NULL,
		last_name		VARCHAR(100)	NOT NULL,
		occupation		VARCHAR(100)	NOT NULL,
		created_date	DATETIME		NOT NULL	DEFAULT NOW(),
		updated_date	DATETIME		NOT NULL	DEFAULT NOW()
);

 INSERT INTO friends (first_name, last_name, occupation)
 VALUES ("Jimmy", "John", "Sandwich");


 INSERT INTO friends (first_name, last_name, occupation)
 VALUES (" ", "Patel", "Instructor"),
		("Jimmy", "Jun", "Instructor");

 SELECT DATE_FORMAT(created_at, '%M %D') FROM friends;
