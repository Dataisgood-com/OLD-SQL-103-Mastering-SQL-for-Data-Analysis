-- Let's drop the database if it already exists to ensure that we start with a clean slate:
DROP DATABASE IF EXISTS TikTok_v2;

-- Create the TikTok v2 database
CREATE DATABASE TikTok_v2;

-- Switch to the TikTok v2 database
USE TikTok_v2;

-- Create the Users table
CREATE TABLE Users (
user_id INT PRIMARY KEY,
username VARCHAR(255),
email VARCHAR(255),
bio TEXT,
followers INT,
following INT
);

-- Create the Videos table
CREATE TABLE Videos (
video_id INT PRIMARY KEY,
user_id INT,
caption TEXT,
likes INT,
views INT,
FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- Create the Comments table
CREATE TABLE Comments (
comment_id INT PRIMARY KEY,
video_id INT,
user_id INT,
comment TEXT,
FOREIGN KEY (video_id) REFERENCES Videos(video_id),
FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- Create the Favorites table
CREATE TABLE Favorites (
user_id INT,
video_id INT,
PRIMARY KEY (user_id, video_id),
FOREIGN KEY (user_id) REFERENCES Users(user_id),
FOREIGN KEY (video_id) REFERENCES Videos(video_id)
);


-- Add the 2021 Events table with modified foreign key constraints
CREATE TABLE `2021_Events` (
  `event_id` INT PRIMARY KEY,
  `user_id` INT,
  `video_id` INT,
  `comment_id` INT,
  `favorite_id` INT,
  `event_type` ENUM('comment', 'favorite', 'video_create') NOT NULL,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (`user_id`) REFERENCES `Users`(`user_id`),
  FOREIGN KEY (`video_id`) REFERENCES `Videos`(`video_id`),
  FOREIGN KEY (`comment_id`) REFERENCES `Comments`(`comment_id`)
);

-- Add the 2022 Events table with modified foreign key constraints
CREATE TABLE `2022_Events` (
  `event_id` INT PRIMARY KEY,
  `user_id` INT,
  `video_id` INT,
  `comment_id` INT,
  `favorite_id` INT,
  `event_type` ENUM('comment', 'favorite', 'video_create') NOT NULL,
  `device_type` ENUM('mobile', 'ipad', 'laptop') NOT NULL,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (`user_id`) REFERENCES `Users`(`user_id`),
  FOREIGN KEY (`video_id`) REFERENCES `Videos`(`video_id`),
  FOREIGN KEY (`comment_id`) REFERENCES `Comments`(`comment_id`)
);



-- Insert sample data into Users table
INSERT INTO Users (user_id, username, email, bio, followers, following)
VALUES
(1, 'ShahRukh_Khan', 'shahrukh@example.com', 'Bollywood King - Dilwale', 2000000, 100),
(2, 'Priyanka_Chopra', 'priyanka@example.com', 'Global Star - Desi Girl', 1800000, 120),
(3, 'Amitabh_Bachchan', 'amitabh@example.com', 'Bollywood Shehenshah', 2500000, 75),
(4, 'Deepika_Padukone', 'deepika@example.com', 'Mastani of Bollywood', 2200000, 150),
(5, 'Salman_Khan', 'salman@example.com', 'Bhaijaan of Bollywood', 2300000, 80),
(6, 'Aamir_Khan', 'aamir@example.com', 'Mr. Perfectionist', 1900000, 50),
(7, 'Kareena_Kapoor', 'kareena@example.com', 'Bebo of Bollywood', 1700000, 130),
(8, 'Ranveer_Singh', 'ranveer@example.com', 'Energetic Superstar', 2100000, 110),
(9, 'Katrina_Kaif', 'katrina@example.com', 'Bollywood Barbie', 1600000, 140),
(10, 'Hrithik_Roshan', 'hrithik@example.com', 'Greek God of Bollywood', 2400000, 90),
(11, 'Alia_Bhatt', 'alia@example.com', 'Bollywood''s Rising Star', 1500000, 200),
(12, 'Akshay_Kumar', 'akshay@example.com', 'Khiladi of Bollywood', 2600000, 70);

-- Insert sample data into Videos table
INSERT INTO Videos (video_id, user_id, caption, likes, views)
VALUES
(1, 1, 'DDLJ - Raj Simran train scene', 35000, 200000),
(2, 1, 'My Name is Khan - Mandira''s speech', 28000, 175000),
(3, 2, 'Quantico - Alex saves the day', 15000, 120000),
(4, 2, 'Bajirao Mastani - Kashibai dance', 18000, 130000),
(5, 3, 'Sholay - Yeh dosti hum nahi todenge', 42000, 240000),
(6, 3, 'Amitabh recites Madhushala', 38000, 230000),
(7, 4, 'Padmaavat - Ghoomar dance', 25000, 150000),
(8, 4, 'Cocktail - Deepika''s entry', 22000, 140000),
(9, 5, 'Bajrangi Bhaijaan - Munni finds her voice', 32000, 190000),
(10, 5, 'Dabangg - Chulbul Pandey intro', 29000, 180000),
(11, 6, '3 Idiots - All is Well scene', 26000, 160000),
(12, 6, 'Lagaan - Winning moment', 24000, 155000),
(13, 7, 'Jab We Met - Geet meets Aditya', 21000, 135000),
(14, 7, 'Kabhi Khushi Kabhie Gham - Pooja''s entry', 23000, 145000),
(15, 8, 'Gully Boy - Apna Time Aayega rap', 31000, 185000),
(16, 8, 'Bajirao Mastani - Bajirao''s entry', 27000, 170000),
(17, 9, 'Dhoom 3 - Kamli dance', 20000, 125000),
(18, 9, 'Namastey London - Jazz confronts Arjun', 17000, 110000),
(19, 10, 'Krrish - Flying to save the day', 33000, 195000),
(20, 10, 'Jodhaa Akbar - Azeem-O-Shaan Shahenshah', 30000, 185000);

-- Insert sample data into Comments table
INSERT INTO Comments (comment_id, video_id, user_id, comment)
VALUES
(1, 1, 2, 'Raj and Simran are iconic! #DDLJ'),
(2, 1, 6, 'All time favorite movie scene!'),
(3, 2, 3, 'Khan sahab, aap toh badshah ho!'),
(4, 3, 1, 'Priyanka, you make India proud!'),
(5, 4, 8, 'Bajirao and Mastani''s chemistry is amazing!'),
(6, 5, 12, 'Yeh dosti hum nahi todenge - evergreen song!'),
(7, 6, 11, 'Amit ji, your voice is mesmerizing.'),
(8, 7, 5, 'Deepika, you are the true queen of Bollywood!'),
(9, 8, 7, 'Loved your performance in Cocktail!'),
(10, 9, 10, 'Salman bhai, Bajrangi Bhaijaan touched my heart.'),
(11, 10, 3, 'Chulbul Pandey, aapka style hai kamal.'),
(12, 11, 4, '3 Idiots - a film that will always be relevant.'),
(13, 12, 9, 'Lagaan - a true masterpiece! Hats off, Aamir.'),
(14, 13, 1, 'Kareena, you were amazing as Geet!'),
(15, 14, 2, 'Poo, you are fabulous!'),
(16, 15, 3, 'Ranveer, you are an inspiration to all Gully Boys!'),
(17, 16, 6, 'Bajirao ne mastani se mohabbat ki hai, ayyashi nahi!'),
(18, 17, 7, 'Katrina, your dance moves are stunning!'),
(19, 18, 8, 'Namastey London - one of my favorite films!'),
(20, 19, 5, 'Hrithik, you are the real superhero of Bollywood!'),
(21, 20, 11, 'Jodhaa Akbar - a timeless love story!'),
(22, 1, 7, 'DDLJ never gets old! Love from Bebo.'),
(23, 2, 10, 'My Name is Khan - a movie that touched millions.'),
(24, 4, 1, 'Priyanka, you are a true desi girl!'),
(25, 7, 9, 'Deepika, you are a true diva!');

-- Insert sample data into Favorites table
INSERT INTO Favorites (user_id, video_id)
VALUES
(1, 5),
(2, 7),
(3, 1),
(4, 8),
(5, 12),
(6, 11),
(7, 2),
(8, 15),
(9, 17),
(10, 20),
(11, 3),
(12, 6);


-- Insert sample data into 2021_Events table
INSERT INTO `2021_Events` (event_id, user_id, video_id, comment_id, event_type)
VALUES
(1, 1, 1, NULL, 'video_create'),
(2, 2, NULL, 1, 'comment'),
(3, 6, NULL, 2, 'comment'),
(4, 2, 3, NULL, 'video_create'),
(5, 3, NULL, 3, 'comment'),
(6, 3, 5, NULL, 'video_create'),
(7, 12, NULL, 6, 'comment'),
(8, 4, 7, NULL, 'video_create'),
(9, 5, NULL, 8, 'comment');

-- Insert sample data into 2022_Events table
INSERT INTO `2022_Events` (event_id, user_id, video_id, comment_id, event_type, device_type)
VALUES
(1, 4, 8, NULL, 'video_create', 'mobile'),
(2, 7, NULL, 9, 'comment', 'ipad'),
(3, 5, 9, NULL, 'video_create', 'laptop'),
(4, 10, NULL, 10, 'comment', 'mobile'),
(5, 3, NULL, 11, 'comment', 'ipad'),
(6, 6, 11, NULL, 'video_create', 'laptop'),
(7, 4, NULL, 12, 'comment', 'mobile'),
(8, 9, NULL, 13, 'comment', 'ipad'),
(9, 1, NULL, 14, 'comment', 'laptop'),
(10, 2, NULL, 15, 'comment', 'mobile'),
(11, 3, NULL, 16, 'comment', 'ipad'),
(12, 6, NULL, 17, 'comment', 'laptop'),
(13, 7, NULL, 18, 'comment', 'mobile'),
(14, 8, NULL, 19, 'comment', 'ipad'),
(15, 5, NULL, 20, 'comment', 'laptop'),
(16, 11, NULL, 21, 'comment', 'mobile'),
(17, 7, NULL, 22, 'comment', 'ipad'),
(18, 10, NULL, 23, 'comment', 'laptop'),
(19, 1, NULL, 24, 'comment', 'mobile'),
(20, 9, NULL, 25, 'comment', 'ipad');






