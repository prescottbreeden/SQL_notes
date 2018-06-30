CREATE TABLE cats
	(
		cat_id INT NOT NULL AUTO_INCREMENT,
		name VARCHAR(100),
		breed VARCHAR(100),
		age INT,
		PRIMARY KEY (cat_id)
	);

INSERT INTO cats(name, breed, age)
VALUES	('Ringo', 'Tabby', 4),
		('Cindy', 'Maine Coon', 11),
		('Dunbledore', 'Maine Coon', 11),
		('Egg', 'Persian', 4),
		('Misty', 'Tabby', 13),
		('George Michael', 'Ragdoll', 9),
		('Jackson', 'Sphinx', 7);

