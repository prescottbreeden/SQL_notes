CREATE TABLE emails 
	(
		id INT NOT NULL AUTO_INCREMENT,
		username VARCHAR(100) NOT NULL,
		email VARCHAR(100) NOT NULL,
		password VARCHAR(100) NOT NULL,
		salt CHAR(4), 
		created_at DATETIME NOT NULL DEFAULT NOW(),
		updated_at DATETIME NOT NULL DEFAULT NOW(),
		PRIMARY KEY(id)
	);

INSERT INTO emails (email)
VALUES 
('prescott.breeden@gmail.com'),
('androgenagonist@gmail.com'),
('brittany.boulding@gmail.com'),
('plucky.clucky@gmail.com')


insert_query = "INSERT INTO users (username, email, password, salt, created_at, updated_at)
     VALUES (:username, :email, :hashed_pw, :salt, NOW(), NOW())"