CREATE DATABASE QLTTTH_DB;
USE QLTTTH_DB;
CREATE TABLE notifications (
	id INT NOT NULL auto_increment,
	title VARCHAR ( 255 ) NOT NULL,
	content VARCHAR ( 255 ) NOT NULL,
	priority VARCHAR ( 30 ) DEFAULT "LOW",
	date TIMESTAMP,
	PRIMARY KEY ( id ) 
);
CREATE TABLE pages (
	type VARCHAR ( 100 ) NOT NULL,
	content LONGTEXT NOT NULL,
	PRIMARY KEY ( type ) 
);
CREATE TABLE users (
	id INT NOT NULL auto_increment,
	type VARCHAR ( 100 ) DEFAULT "STUDENT",
	username VARCHAR ( 255 ) NOT NULL,
	hashPassword VARCHAR ( 255 ) NOT NULL,
	firstName VARCHAR ( 255 ) NOT NULL,
	lastName VARCHAR ( 255 ) NOT NULL,
	birthDay DATE,
	address VARCHAR ( 255 ),
	urlAvatar MEDIUMTEXT,
	email VARCHAR ( 255 ) NOT NULL,
	maxim MEDIUMTEXT,
	PRIMARY KEY ( id ) 
);
CREATE TABLE courses (
	id INT NOT NULL auto_increment,
	title VARCHAR ( 255 ) NOT NULL,
	shortDescription VARCHAR ( 255 ) NOT NULL,
	objective LONGTEXT,
	eligibility LONGTEXT,
	outline LONGTEXT,
	schedules VARCHAR ( 255 ) NOT NULL,
	totalSeat INT NOT NULL,
	availableSeat INT DEFAULT 0,
	fee FLOAT NOT NULL,
	lecturer INT NOT NULL,
	FOREIGN KEY ( lecturer ) REFERENCES users ( id ),
	PRIMARY KEY ( id ) 
);
CREATE TABLE comments (
	id INT NOT NULL auto_increment,
	date TIMESTAMP NOT NULL,
	commenter INT NOT NULL,
	content MEDIUMTEXT NOT NULL,
	type VARCHAR ( 100 ) NOT NULL,
	PRIMARY KEY ( id ),
	FOREIGN KEY ( commenter ) REFERENCES users ( id ) 
);
CREATE TABLE certificates (
	id INT NOT NULL auto_increment,
	title VARCHAR ( 255 ) NOT NULL,
	description VARCHAR ( 255 ) NOT NULL,
	PRIMARY KEY ( id ) 
);
CREATE TABLE messages (
	id INT NOT NULL auto_increment,
	emailOrPhone VARCHAR ( 255 ),
	senderName VARCHAR ( 255 ),
	SUBJECT VARCHAR ( 255 ) NOT NULL,
	content MEDIUMTEXT NOT NULL,
	isRead TINYINT ( 1 ) DEFAULT 0,
	PRIMARY KEY ( id ) 
);
CREATE TABLE enrollments (
	id INT NOT NULL auto_increment,
	course INT NOT NULL,
	student INT NOT NULL,
	enrolledDate TIMESTAMP NOT NULL,
	certificate INT,
	receivedCertificateDate TIMESTAMP,
	FOREIGN KEY ( certificate ) REFERENCES certificates ( id ),
	FOREIGN KEY ( course ) REFERENCES courses ( id ),
	FOREIGN KEY ( student ) REFERENCES users ( id ),
	PRIMARY KEY ( id ) 
);
CREATE TABLE scores (
	id INT NOT NULL auto_increment,
	firstScore FLOAT,
	secondScore FLOAT,
	enrollment INT NOT NULL,
	FOREIGN KEY ( enrollment ) REFERENCES enrollments ( id ),
	PRIMARY KEY ( id ) 
);
CREATE TABLE categories (
	id INT NOT NULL auto_increment,
	title VARCHAR ( 255 ) NOT NULL,
	description VARCHAR ( 255 ) NOT NULL,
	PRIMARY KEY ( id ) 
);
CREATE TABLE posts (
	id INT NOT NULL auto_increment,
	posterUrl MEDIUMTEXT NOT NULL,
	lecturer INT NOT NULL,
	date TIMESTAMP NOT NULL,
	views INT DEFAULT 0,
	title VARCHAR ( 255 ) NOT NULL,
	summary MEDIUMTEXT NOT NULL,
	content LONGTEXT NOT NULL,
	STATUS VARCHAR ( 100 ) DEFAULT "PENDING",
	PRIMARY KEY ( id ),
	FOREIGN KEY ( lecturer ) REFERENCES users ( id ) 
);
CREATE TABLE classificaionOfPosts (
	id INT NOT NULL auto_increment,
	post INT NOT NULL,
	category INT NOT NULL,
	PRIMARY KEY ( id ),
	FOREIGN KEY ( post ) REFERENCES posts ( id ),
	FOREIGN KEY ( category ) REFERENCES categories ( id ) 
);
CREATE TABLE attachFiles (
	id INT NOT NULL auto_increment,
	page VARCHAR ( 1000 ) NOT NULL,
	url VARCHAR ( 255 ) NOT NULL,
PRIMARY KEY ( id ) 
);