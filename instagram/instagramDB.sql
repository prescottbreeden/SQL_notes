-- CREATING SCHEMA

CREATE SCHEMA IF NOT EXISTS instagramDB
	DEFAULT CHARACTER SET utf8;

USE instagramDB;

-- CREATING users TABLE

CREATE TABLE IF NOT EXISTS users (
	user_id			INTEGER			NOT NULL    AUTO_INCREMENT  PRIMARY KEY,
	username		VARCHAR(100)	UNIQUE		NOT NULL,
	created_at		TIMESTAMP		NOT NULL    DEFAULT NOW(),
	updated_at		TIMESTAMP		NOT NULL    DEFAULT NOW()   ON UPDATE NOW()
);

-- CREATING photos TABLE

CREATE TABLE IF NOT EXISTS photos (
	photo_id		INTEGER			NOT NULL	AUTO_INCREMENT	PRIMARY KEY,
	image_url		VARCHAR(255)	NOT NULL,
	caption_text	VARCHAR(255)	NOT NULL,
	created_at		TIMESTAMP		NOT NULL	DEFAULT NOW(),
	user_id			INTEGER			NOT NULL,

	FOREIGN KEY (user_id)
		REFERENCES users(user_id)
);

-- CREATE comments TABLE

CREATE TABLE IF NOT EXISTS comments (
	comment_id		INTEGER			NOT NULL	AUTO_INCREMENT	PRIMARY KEY,
	comment_text	VARCHAR(255)	NOT NULL,
	user_id			INTEGER			NOT NULL,
	photo_id		INTEGER			NOT NULL,
	created_at		TIMESTAMP		NOT NULL	DEFAULT NOW(),
	updated_at		TIMESTAMP		NOT NULL	DEFAULT NOW()	ON UPDATE NOW(),

	FOREIGN KEY (user_id)
		REFERENCES users(user_id),
	FOREIGN KEY (photo_id)
		REFERENCES photos(photo_id)
);

-- CREATE likes TABLE

CREATE TABLE IF NOT EXISTS likes (
	user_id			INTEGER			NOT NULL,
	photo_id		INTEGER			NOT NULL,
	created_at		TIMESTAMP		NOT NULL	DEFAULT NOW(),

	FOREIGN KEY (user_id)
		REFERENCES users(user_id),
	FOREIGN KEY (photo_id)
		REFERENCES photos(photo_id),
	PRIMARY KEY (user_id, photo_id)
);

-- CREATE follows TABLE

CREATE TABLE IF NOT EXISTS follows (
	follower_id		INTEGER			NOT NULL,
	followed_id		INTEGER			NOT NULL,
	created_at		TIMESTAMP		NOT NULL	DEFAULT NOW(),

	FOREIGN KEY (follower_id)
		REFERENCES users(user_id),
	FOREIGN KEY (follower_id)
		REFERENCES users(user_id),
	PRIMARY KEY (follower_id, followed_id)
);

-- CREATE tags TABLE

CREATE TABLE IF NOT EXISTS tags (
	tag_id			INTEGER			NOT NULL	AUTO_INCREMENT	PRIMARY KEY,
	tag_name		VARCHAR(255)	NOT NULL	UNIQUE,
	created_at		TIMESTAMP		NOT NULL	DEFAULT NOW()
);

-- CREATE photo_tags TABLE

CREATE TABLE IF NOT EXISTS photo_tags (
	photo_id		INTEGER			NOT NULL,
	tag_id			INTEGER			NOT NULL,
	created_at		TIMESTAMP		NOT NULL	DEFAULT NOW(),

	FOREIGN KEY (tag_id)
		REFERENCES tags(tag_id),
	FOREIGN KEY (photo_id)
		REFERENCES photos(photo_id),
	PRIMARY KEY (photo_id, tag_id)
);




