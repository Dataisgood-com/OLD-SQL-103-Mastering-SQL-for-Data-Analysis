-- Drop the database if it already exists
DROP DATABASE IF EXISTS Tinder_replica;

-- Create the database
CREATE DATABASE Tinder_replica;

-- Use the database
USE Tinder_replica;

-- Create the users table
CREATE TABLE users (
  user_id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL,
  age INT NOT NULL,
  gender ENUM('male', 'female', 'non-binary') NOT NULL,
  bio TEXT,
  plan ENUM('free', 'basic', 'premium', 'platinum') NOT NULL DEFAULT 'free',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (user_id)
);


-- Create the interests table
CREATE TABLE interests (
  interest_id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL,
  PRIMARY KEY (interest_id)
);

-- Create the user_interests table
CREATE TABLE user_interests (
  user_id INT NOT NULL,
  interest_id INT NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES users (user_id),
  FOREIGN KEY (interest_id) REFERENCES interests (interest_id),
  PRIMARY KEY (user_id, interest_id)
);

-- Create the swipes table
CREATE TABLE swipes (
  swipe_id INT NOT NULL AUTO_INCREMENT,
  swiping_user_id INT NOT NULL,
  swiped_user_id INT NOT NULL,
  is_like TINYINT(1) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (swiping_user_id) REFERENCES users (user_id),
  FOREIGN KEY (swiped_user_id) REFERENCES users (user_id),
  PRIMARY KEY (swipe_id)
);

-- Create the matches table
CREATE TABLE matches (
  match_id INT NOT NULL AUTO_INCREMENT,
  user_id_1 INT NOT NULL,
  user_id_2 INT NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id_1) REFERENCES users (user_id),
  FOREIGN KEY (user_id_2) REFERENCES users (user_id),
  PRIMARY KEY (match_id)
);


-- Insert sample users into the users table
INSERT INTO users (plan, name, age, gender, bio) VALUES
('platinum', 'Tony Stark', 45, 'male', 'Genius, billionaire, playboy, philanthropist.'),
('platinum', 'Steve Rogers', 103, 'male', 'I can do this all day.'),
('free', 'Thor Odinson', 41, 'male', 'I am Thor, son of Odin.'),
('free', 'Natasha Romanoff', 36, 'female', 'I am always picking up after you boys.'),
('premium', 'Wanda Maximoff', 32, 'female', 'I can make anything I want.'),
('premium', 'Gamora Zen Whoberi Ben Titan', 32, 'female', 'Daughter of Thanos, but I am nothing like him.'),
('free', 'Peter Parker', 20, 'male', 'Friendly neighborhood Spider-Man.'),
('free', 'Bruce Banner', 49, 'male', 'I am always angry.'),
('premium', 'Shuri', 18, 'female', 'The smartest person in Wakanda.'),
('free', 'Mantis', 28, 'female', 'I am empathic, which means I feel others\' emotions.'),
('free', 'Jean Grey', 27, 'female', 'I have telekinetic and telepathic abilities.'),
('basic', 'Storm', 33, 'female', 'I control the weather.'),
('free', 'T\'Challa', 38, 'male', 'I am the king of Wakanda.'),
('premium', 'Stephen Strange', 42, 'male', 'I was a surgeon, now I am a sorcerer.'),
('free', 'Scott Lang', 41, 'male', 'I am Ant-Man.'),
('premium', 'Valkyrie', 31, 'female', 'I am the last of the Valkyrior.'),
('basic', 'Carol Danvers', 33, 'female', 'I am Captain Marvel.'),
('free', 'Peter Quill', 39, 'male', 'I am Star-Lord.'),
('free', 'Groot', 18, 'male', 'I am Groot.'),
('free', 'Rocket Raccoon', 18, 'male', 'I have anger issues.'),
('free', 'Okoye', 47, 'female', 'I am the general of the Dora Milaje.'),
('free', 'Sam Wilson', 42, 'male', 'On your left.'),
('basic', 'Vision', 18, 'male', 'I am an artificial intelligence created by Tony Stark and Bruce Banner.'),
('free', 'Diana Prince', 27, 'female', 'I am Wonder Woman.'),
('basic', 'Barry Allen', 29, 'male', 'I am the fastest man alive.');

-- Insert interests into the interests table
INSERT INTO interests (name) VALUES
('Adventure'),
('Arts'),
('Books'),
('Cars'),
('Comics'),
('Cooking'),
('Dancing'),
('Fashion'),
('Fitness'),
('Football'),
('Gaming'),
('Hiking'),
('Music'),
('Photography'),
('Singing'),
('Skiing'),
('Swimming'),
('Traveling'),
('Watching Movies'),
('Writing');


-- Insert interests for each user
INSERT INTO user_interests (user_id, interest_id) VALUES
(1, 1), (1, 2), (1, 3), (1, 4), (1, 5), (1, 6), (1, 7), (1, 8),
(2, 1), (2, 2), (2, 3), (2, 4), (2, 5), (2, 9), (2, 10), (2, 11),
(3, 1), (3, 2), (3, 3), (3, 5), (3, 12), (3, 13), (3, 14), (3, 15),
(4, 2), (4, 3), (4, 5), (4, 6), (4, 16), (4, 17), (4, 18), (4, 19),
(5, 1), (5, 3), (5, 5), (5, 6), (5, 7), (5, 8), (5, 12), (5, 13),
(6, 2), (6, 4), (6, 6), (6, 7), (6, 8), (6, 10), (6, 12), (6, 14),
(7, 1), (7, 2), (7, 3), (7, 4), (7, 5), (7, 9), (7, 10), (7, 11),
(8, 1), (8, 2), (8, 4), (8, 5), (8, 7), (8, 8), (8, 9), (8, 13),
(9, 1), (9, 3), (9, 5), (9, 6), (9, 8), (9, 9), (9, 10), (9, 12),
(10, 2), (10, 3), (10, 5), (10, 6), (10, 7), (10, 8), (10, 12), (10, 13),
(11, 2), (11, 4), (11, 6), (11, 8), (11, 9), (11, 10), (11, 13), (11, 15),
(12, 2), (12, 3), (12, 4), (12, 5), (12, 7), (12, 8), (12, 11), (12, 14),
(13, 2), (13, 3), (13, 5), (13, 6), (13, 8), (13, 9), (13, 11), (13, 15),
(14, 1), (14, 2), (14, 3), (14, 4), (14, 5), (14, 7), (14, 8), (14, 11),
(15, 1), (15, 3), (15, 5), (15, 6), (15, 8), (15, 9), (15, 11), (15, 13),
(16, 2), (16, 3), (16, 4), (16, 5), (16, 7), (16, 8), (16, 9), (16, 10),
(17, 1), (17, 2), (17, 4), (17, 5), (17, 6), (17, 8), (17, 10), (17, 12),
(18, 2), (18, 3), (18, 5), (18, 6), (18, 7), (18, 8), (18, 11), (18, 13),
(19, 1), (19, 3), (19, 5), (19, 6), (19, 8), (19, 9), (19, 11), (19, 15),
(20, 2), (20, 4), (20, 6), (20, 8), (20, 9), (20, 10), (20, 13), (20, 15),
(21, 1), (21, 2), (21, 3), (21, 4), (21, 5), (21, 7), (21, 8), (21, 11),
(22, 1), (22, 3), (22, 4), (22, 5), (22, 6), (22, 7), (22, 9), (22, 10),
(23, 2), (23, 3), (23, 5), (23, 6), (23, 7), (23, 8), (23, 11), (23, 14),
(24, 1), (24, 2), (24, 3), (24, 5), (24, 6), (24, 8), (24, 9), (24, 12),
(25, 1), (25, 3), (25, 4), (25, 5), (25, 7), (25, 8), (25, 10), (25, 13);


-- Tony Stark swipes right on Natasha, Wanda, and Shuri, and left on Storm
INSERT INTO swipes (swiping_user_id, swiped_user_id, is_like, created_at) VALUES
(1, 4, 1, DATE_SUB(NOW(), INTERVAL FLOOR(RAND() * 730) DAY)),
(1, 5, 1, DATE_SUB(NOW(), INTERVAL FLOOR(RAND() * 730) DAY)),
(1, 9, 1, DATE_SUB(NOW(), INTERVAL FLOOR(RAND() * 730) DAY)),
(1, 12, 0, DATE_SUB(NOW(), INTERVAL FLOOR(RAND() * 730) DAY)),
-- Steve Rogers swipes right on Wanda, and left on Natasha and Shuri
(2, 5, 1, DATE_SUB(NOW(), INTERVAL FLOOR(RAND() * 730) DAY)),
(2, 4, 0, DATE_SUB(NOW(), INTERVAL FLOOR(RAND() * 730) DAY)),
(2, 9, 0, DATE_SUB(NOW(), INTERVAL FLOOR(RAND() * 730) DAY)),
-- Thor Odinson swipes right on Carol and Valkyrie, and left on Wanda
(3, 17, 1, DATE_SUB(NOW(), INTERVAL FLOOR(RAND() * 730) DAY)),
(3, 16, 1, DATE_SUB(NOW(), INTERVAL FLOOR(RAND() * 730) DAY)),
(3, 5, 0, DATE_SUB(NOW(), INTERVAL FLOOR(RAND() * 730) DAY)),
-- Natasha Romanoff swipes right on Tony and left on Steve and T'Challa
(4, 1, 1, DATE_SUB(NOW(), INTERVAL FLOOR(RAND() * 730) DAY)),
(4, 2, 0, DATE_SUB(NOW(), INTERVAL FLOOR(RAND() * 730) DAY)),
(4, 13, 0, DATE_SUB(NOW(), INTERVAL FLOOR(RAND() * 730) DAY)),
-- Wanda Maximoff swipes right on Tony and Vision, and left on Steve and Thor
(5, 1, 1, DATE_SUB(NOW(), INTERVAL FLOOR(RAND() * 730) DAY)),
(5, 23, 1, DATE_SUB(NOW(), INTERVAL FLOOR(RAND() * 730) DAY)),
(5, 2, 0, DATE_SUB(NOW(), INTERVAL FLOOR(RAND() * 730) DAY)),
(5, 3, 0, DATE_SUB(NOW(), INTERVAL FLOOR(RAND() * 730) DAY)),
-- Gamora swipes right on Peter, and left on Thor
(6, 18, 1, DATE_SUB(NOW(), INTERVAL FLOOR(RAND() * 730) DAY)),
(6, 3, 0, DATE_SUB(NOW(), INTERVAL FLOOR(RAND() * 730) DAY)),
-- Bruce Banner swipes right on Natasha, and left on Wanda
(8, 4, 1, DATE_SUB(NOW(), INTERVAL FLOOR(RAND() * 730) DAY)),
(8, 5, 0, DATE_SUB(NOW(), INTERVAL FLOOR(RAND() * 730) DAY)),
-- Shuri swipes right on Tony, and left on Steve
(9, 1, 1, DATE_SUB(NOW(), INTERVAL FLOOR(RAND() * 730) DAY)),
(9, 2, 0, DATE_SUB(NOW(), INTERVAL FLOOR(RAND() * 730) DAY)),
-- Mantis swipes right on Thor and left on T'Challa
(10, 3, 1, DATE_SUB(NOW(), INTERVAL FLOOR(RAND() * 730) DAY)),
(10, 13, 0, DATE_SUB(NOW(), INTERVAL FLOOR(RAND() * 730) DAY)),
-- Jean Grey swipes right on Scott, and left on Thor
(11, 15, 1, DATE_SUB(NOW(), INTERVAL FLOOR(RAND() * 730) DAY)),
(11, 3, 0, DATE_SUB(NOW(), INTERVAL FLOOR(RAND() * 730) DAY)),
-- Storm swipes right on Thor and left on Tony
(13, 3, 1, DATE_SUB(NOW(), INTERVAL FLOOR(RAND() * 730) DAY)),
(13, 1, 0, DATE_SUB(NOW(), INTERVAL FLOOR(RAND() * 730) DAY)),
-- T'Challa swipes right on Shuri and left on Natasha
(22, 9, 1, DATE_SUB(NOW(), INTERVAL FLOOR(RAND() * 730) DAY)),
(22, 4, 0, DATE_SUB(NOW(), INTERVAL FLOOR(RAND() * 730) DAY)),
-- Vision swipes right on Wanda and left on no one
(23, 5, 1, DATE_SUB(NOW(), INTERVAL FLOOR(RAND() * 730) DAY)),
-- Scott Lang swipes right on Valkyrie and left on Okoye
(14, 16, 1, DATE_SUB(NOW(), INTERVAL FLOOR(RAND() * 730) DAY)),
(14, 22, 0, DATE_SUB(NOW(), INTERVAL FLOOR(RAND() * 730) DAY)),
-- Valkyrie swipes right on Scott and left on Bruce
(16, 14, 1, DATE_SUB(NOW(), INTERVAL FLOOR(RAND() * 730) DAY)),
(16, 4, 0, DATE_SUB(NOW(), INTERVAL FLOOR(RAND() * 730) DAY)),
-- Rocket Raccoon swipes right on Gamora and left on Tony
(17, 5, 1, DATE_SUB(NOW(), INTERVAL FLOOR(RAND() * 730) DAY)),
(17, 1, 0, DATE_SUB(NOW(), INTERVAL FLOOR(RAND() * 730) DAY)),
-- Okoye swipes right on T'Challa and left on Scott
(21, 8, 1, DATE_SUB(NOW(), INTERVAL FLOOR(RAND() * 730) DAY)),
(21, 14, 0, DATE_SUB(NOW(), INTERVAL FLOOR(RAND() * 730) DAY));


-- Create matches for users who both swipe right on each other
INSERT INTO matches (user_id_1, user_id_2, created_at, updated_at) 
SELECT s1.swiping_user_id, s1.swiped_user_id, DATE_SUB(NOW(), INTERVAL FLOOR(RAND() * 730) DAY), DATE_SUB(NOW(), INTERVAL FLOOR(RAND() * 365) DAY)
FROM swipes s1
INNER JOIN swipes s2
ON s1.swiping_user_id = s2.swiped_user_id
AND s1.swiped_user_id = s2.swiping_user_id
AND s1.is_like = 1
AND s2.is_like = 1
AND s1.swiping_user_id < s2.swiping_user_id;


