CREATE DATABASE instagram_practice;
USE instagram_practice;

CREATE TABLE user (
    id INT AUTO_INCREMENT PRIMARY KEY UNIQUE,
    user_name VARCHAR(255) UNIQUE,
    time_creation TIMESTAMP DEFAULT NOW()
);

ALTER TABLE user MODIFY user_name VARCHAR(255) UNIQUE NOT NULL;
desc user;

CREATE TABLE photos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    url VARCHAR(1000) NOT NULL,
    time_creation TIMESTAMP DEFAULT NOW(),
    user_id INT NOT NULL,
    FOREIGN KEY (user_id)
        REFERENCES user (id)
);
desc photos;

CREATE TABLE comments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    comment VARCHAR(255) NOT NULL,
    time_creation TIMESTAMP DEFAULT NOW(),
    user_id INT NOT NULL,
    photo_id INT NOT NULL,
    FOREIGN KEY (user_id)
        REFERENCES user (id),
	FOREIGN KEY (photo_id)
        REFERENCES photos (id)
);
desc comments;

CREATE TABLE likes (
    time_creation TIMESTAMP DEFAULT NOW(),
    user_id INT NOT NULL,
    photo_id INT NOT NULL,
    FOREIGN KEY (user_id)
        REFERENCES user (id),
    FOREIGN KEY (photo_id)
        REFERENCES photos (id),
    PRIMARY KEY (user_id , photo_id)
);

CREATE TABLE follows (
    follower_id INTEGER NOT NULL,
    followee_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(follower_id) REFERENCES user (id),
    FOREIGN KEY(followee_id) REFERENCES user (id),
    PRIMARY KEY(follower_id, followee_id)
);

CREATE TABLE tags (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tag_name VARCHAR(100) UNIQUE,
    time_creation TIMESTAMP DEFAULT NOW()
);
    
CREATE TABLE photo_tags (
    photo_id INT NOT NULL,
    tag_id INT NOT NULL,
    FOREIGN KEY (photo_id)
        REFERENCES photos (id),
    FOREIGN KEY (tag_id)
        REFERENCES tags (id),
	PRIMARY KEY(photo_id,tag_id)
);





