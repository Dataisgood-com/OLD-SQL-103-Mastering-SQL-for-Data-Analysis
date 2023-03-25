-- Let's drop the database if it already exists to ensure that we start with a clean slate:
DROP DATABASE IF EXISTS TikTok_v2;

-- Create the TikTok v2 database
CREATE DATABASE TikTok_v2;

-- Switch to the TikTok v2 database
USE TikTok;

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

-- Insert sample data into the Users table
INSERT INTO Users (user_id, username, email, bio, followers, following) VALUES
(1, 'akshay_kumar', 'akshay_kumar@gmail.com', 'Actor', 5000000, 50),
(2, 'deepikapadukone', 'deepikapadukone@gmail.com', 'Actress', 10000000, 100),
(3, 'hrithikroshan', 'hrithikroshan@gmail.com', 'Actor', 2000000, 20),
(4, 'govinda', 'govinda@gmail.com', 'Actor', 100000, 10),
(5, 'madhuridixit', 'madhuridixit@gmail.com', 'Actress', 500000, 50),
(6, 'iamsrk', 'iamsrk@gmail.com', 'Actor', 3000000, 30),
(7, 'tigerjackieshroff', 'tigerjackieshroff@gmail.com', 'Actor', 1500000, 15),
(8, 'raveenatandon', 'raveenatandon@gmail.com', 'Actress', 50000, 5),
(9, 'sunilshetty', 'sunilshetty@gmail.com', 'Actor', 100000, 10),
(10, 'himeshreshammiya', 'himeshreshammiya@gmail.com', 'Singer', 5000, 50),
(11, 'shreyaghoshal', 'shreyaghoshal@gmail.com', 'Singer', 10000, 100);

-- Insert sample data into the Videos table
INSERT INTO Videos (video_id, user_id, caption, likes, views) VALUES
    (1, 1, 'Khiladiyon ka khiladi', 10000, 1000000),
    (2, 2, 'Chennai Express', 5000, 500000),
    (3, 3, 'Koi Mil Gaya', 20000, 2000000),
    (4, 4, 'Hero No. 1', 1000, 100000),
    (5, 5, 'Hum Aapke Hain Koun', 5000, 500000),
    (6, 6, 'Dilwale', 7000, 700000),
    (7, 7, 'Baaghi 3', 8000, 800000),
    (8, 1, 'Hera Pheri', 30000, 3000000),
    (9, 2, 'Padmaavat', 4000, 400000),
    (10, 3, 'War', 9000, 900000),
    (11, 4, 'Aankhen', 2000, 200000),
    (12, 5, 'Dil To Pagal Hai', 6000, 600000);

-- Insert sample data into the Comments table
INSERT INTO Comments (comment_id, video_id, user_id, comment) VALUES
    (1, 1, 2, 'Tum humesha aise hi bhaagne waale the ya aaj koi special occasion hai?'),
    (2, 1, 3, 'Love the movie!'),
    (3, 2, 4, 'Bohot samay baad ek acha gaana sunne ko mila.'),
    (5, 3, 5, 'Hrithik bhai, aapke dance moves toh mere dil mein bas gaye hai! Aap toh dancing ka Baap nikle!'),
    (6, 3, 7, 'I love the music in this movie'),
    (7, 4, 1, 'Govinda, you are hilarious!'),
    (8, 5, 2, 'Madhuri, you are a timeless beauty'),
    (9, 5, 3, 'This is one of my favorite movies!'),
    (10, 6, 4, 'Shahrukh, you are the king of Bollywood!'),
    (11, 7, 5, 'Tiger, Chote bache ho kya'),
    (12, 7, 6, 'I love the action scenes in this movie'),
    (13, 8, 7, 'One of the funniest movies ever!'),
    (14, 9, 1, 'Sunil, dilwale to bahut dekhe hai, par jo pyaar mei pagal ho jaaye aise dilwale ko pehli baar dekha'),
    (15, 10, 2, 'Himesh, Toip utar kar naach!'),
    (16, 11, 3, 'Shreya, your voice is magical!');

-- Insert sample data into the Favorites table
INSERT INTO Favorites (user_id, video_id) VALUES
    (1, 3),
    (1, 7),
    (2, 1),
    (2, 10),
    (3, 2),
    (4, 5),
    (4, 8),
    (5, 4),
    (6, 6),
    (7, 11),
    (8, 9),
    (9, 12),
    (10, 1),
    (11, 3),
    (11, 6);


-- Add the 2021 Events table
CREATE TABLE `2021_Events` (
  `event_id` INT PRIMARY KEY,
  `user_id` INT,
  `video_id` INT,
  `comment_id` INT,
  `favorite_id` INT,
  `event_type` ENUM('comment', 'favorite', 'video_create') NOT NULL,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Add the 2022 Events table
CREATE TABLE `2022_Events` (
  `event_id` INT PRIMARY KEY,
  `user_id` INT,
  `video_id` INT,
  `comment_id` INT,
  `favorite_id` INT,
  `event_type` ENUM('comment', 'favorite', 'video_create') NOT NULL,
  `device_type` ENUM('mobile', 'ipad', 'laptop') NOT NULL,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
);


-- Insert data into the Events2021 table
INSERT INTO Events2021 (event_id, user_id, video_id, event_type, event_date) VALUES
(1, 1, 3, 'comment', '2021-01-01'),
(2, 2, 4, 'favorite', '2021-01-02'),
(3, 3, 1, 'video', '2021-01-03'),
(4, 4, 5, 'comment', '2021-01-04'),
(5, 5, 2, 'favorite', '2021-01-05'),
(6, 1, 6, 'comment', '2021-02-01'),
(7, 2, 7, 'favorite', '2021-02-02'),
(8, 3, 2, 'video', '2021-02-03'),
(9, 4, 6, 'comment', '2021-02-04'),
(10, 5, 1, 'favorite', '2021-02-05'),
(11, 1, 7, 'comment', '2021-03-01'),
(12, 2, 5, 'favorite', '2021-03-02'),
(13, 3, 3, 'video', '2021-03-03'),
(14, 4, 2, 'comment', '2021-03-04'),
(15, 5, 4, 'favorite', '2021-03-05');


-- Insert sample data into the Events2022 table
INSERT INTO Events2022 (event_id, user_id, video_id, event_type, event_date, device_type, location) VALUES
(1, 1, 9, 'video', '2022-01-01', 'mobile', 'New York'),
(2, 2, 10, 'comment', '2022-01-02', 'laptop', 'Los Angeles'),
(3, 3, 8, 'favorite', '2022-01-03', 'ipad', 'Chicago'),
(4, 4, 7, 'comment', '2022-01-04', 'mobile', 'Houston'),
(5, 5, 6, 'favorite', '2022-01-05', 'ipad', 'Miami'),
(6, 1, 10, 'comment', '2022-02-01', 'mobile', 'New York'),
(7, 2, 9, 'favorite', '2022-02-02', 'laptop', 'Los Angeles'),
(8, 3, 7, 'video', '2022-02-03', 'ipad', 'Chicago'),
(9, 4, 8, 'comment', '2022-02-04', 'mobile', 'Houston'),
(10, 5, 6, 'favorite', '2022-02-05', 'ipad', 'Miami'),
(11, 1, 8, 'comment', '2022-03-01', 'mobile', 'New York'),
(12, 2, 7, 'favorite', '2022-03-02', 'laptop', 'Los Angeles'),
(13, 3, 9, 'video', '2022-03-03', 'ipad', 'Chicago'),
(14, 4, 10, 'comment', '2022-03-04', 'mobile', 'Houston'),
(15, 5, 7, 'favorite', '2022-03-05', 'ipad', 'Miami'),
(16, 1, 8, 'comment', '2022-04-01', 'mobile', 'New York'),
(17, 2, 9, 'favorite', '2022-04-02', 'laptop', 'Los Angeles'),
(18, 3, 10, 'video', '2022-04-03', 'ipad', 'Chicago'),
(19, 4, 7, 'comment', '2022-04-04', 'mobile', 'Houston'),
(20, 5, 9, 'favorite', '2022-04-05', 'ipad', 'Miami'),
(21, 1, 10, 'comment', '2022-05-01', 'mobile', 'New York'),
(22, 2, 8, 'favorite', '2022-05-02', 'laptop', 'Los Angeles'),
(23, 3, 9, 'video', '2022-05-03', 'ipad', 'Chicago'),
(24, 4, 8, 'comment', '2022-05-04', 'mobile', 'Houston'),
(25, 5, 10, 'favorite', '2022-05-05', 'ipad', 'Miami');


-- Add sample data to the 2021 Events table-- Let's drop the database if it already exists to ensure that we start with a clean slate:
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

-- Insert sample data into the Users table
INSERT INTO Users (user_id, username, email, bio, followers, following) VALUES
(1, 'akshay_kumar', 'akshay_kumar@gmail.com', 'Actor', 5000000, 50),
(2, 'deepikapadukone', 'deepikapadukone@gmail.com', 'Actress', 10000000, 100),
(3, 'hrithikroshan', 'hrithikroshan@gmail.com', 'Actor', 2000000, 20),
(4, 'govinda', 'govinda@gmail.com', 'Actor', 100000, 10),
(5, 'madhuridixit', 'madhuridixit@gmail.com', 'Actress', 500000, 50),
(6, 'iamsrk', 'iamsrk@gmail.com', 'Actor', 3000000, 30),
(7, 'tigerjackieshroff', 'tigerjackieshroff@gmail.com', 'Actor', 1500000, 15),
(8, 'raveenatandon', 'raveenatandon@gmail.com', 'Actress', 50000, 5),
(9, 'sunilshetty', 'sunilshetty@gmail.com', 'Actor', 100000, 10),
(10, 'himeshreshammiya', 'himeshreshammiya@gmail.com', 'Singer', 5000, 50),
(11, 'shreyaghoshal', 'shreyaghoshal@gmail.com', 'Singer', 10000, 100);

-- Insert sample data into the Videos table
INSERT INTO Videos (video_id, user_id, caption, likes, views) VALUES
    (1, 1, 'Khiladiyon ka khiladi', 10000, 1000000),
    (2, 2, 'Chennai Express', 5000, 500000),
    (3, 3, 'Koi Mil Gaya', 20000, 2000000),
    (4, 4, 'Hero No. 1', 1000, 100000),
    (5, 5, 'Hum Aapke Hain Koun', 5000, 500000),
    (6, 6, 'Dilwale', 7000, 700000),
    (7, 7, 'Baaghi 3', 8000, 800000),
    (8, 1, 'Hera Pheri', 30000, 3000000),
    (9, 2, 'Padmaavat', 4000, 400000),
    (10, 3, 'War', 9000, 900000),
    (11, 4, 'Aankhen', 2000, 200000),
    (12, 5, 'Dil To Pagal Hai', 6000, 600000);

-- Insert sample data into the Comments table
INSERT INTO Comments (comment_id, video_id, user_id, comment) VALUES
    (1, 1, 2, 'Tum humesha aise hi bhaagne waale the ya aaj koi special occasion hai?'),
    (2, 1, 3, 'Love the movie!'),
    (3, 2, 4, 'Bohot samay baad ek acha gaana sunne ko mila.'),
    (5, 3, 5, 'Hrithik bhai, aapke dance moves toh mere dil mein bas gaye hai! Aap toh dancing ka Baap nikle!'),
    (6, 3, 7, 'I love the music in this movie'),
    (7, 4, 1, 'Govinda, you are hilarious!'),
    (8, 5, 2, 'Madhuri, you are a timeless beauty'),
    (9, 5, 3, 'This is one of my favorite movies!'),
    (10, 6, 4, 'Shahrukh, you are the king of Bollywood!'),
    (11, 7, 5, 'Tiger, Chote bache ho kya'),
    (12, 7, 6, 'I love the action scenes in this movie'),
    (13, 8, 7, 'One of the funniest movies ever!'),
    (14, 9, 1, 'Sunil, dilwale to bahut dekhe hai, par jo pyaar mei pagal ho jaaye aise dilwale ko pehli baar dekha'),
    (15, 10, 2, 'Himesh, Toip utar kar naach!'),
    (16, 11, 3, 'Shreya, your voice is magical!');

-- Insert sample data into the Favorites table
INSERT INTO Favorites (user_id, video_id) VALUES
    (1, 3),
    (1, 7),
    (2, 1),
    (2, 10),
    (3, 2),
    (4, 5),
    (4, 8),
    (5, 4),
    (6, 6),
    (7, 11),
    (8, 9),
    (9, 12),
    (10, 1),
    (11, 3),
    (11, 6);

-- Add the 2021 Events table
CREATE TABLE `2021_Events` (
  `event_id` INT PRIMARY KEY,
  `user_id` INT,
  `video_id` INT,
  `comment_id` INT,
  `favorite_id` INT,
  `event_type` ENUM('comment', 'favorite', 'video_create') NOT NULL,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Add the 2022 Events table
CREATE TABLE `2022_Events` (
  `event_id` INT PRIMARY KEY,
  `user_id` INT,
  `video_id` INT,
  `comment_id` INT,
  `favorite_id` INT,
  `event_type` ENUM('comment', 'favorite', 'video_create') NOT NULL,
  `device_type` ENUM('mobile', 'ipad', 'laptop') NOT NULL,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- Add sample data to the 2021 Events table
INSERT INTO `2021_Events` (`event_id`, `user_id`, `video_id`, `comment_id`, `favorite_id`, `event_type`)
VALUES
  (1, 1, 3, 1, NULL, 'comment'),
  (2, 2, NULL, NULL, 1, 'favorite'),
  (3, 3, 2, NULL, NULL, 'video_create'),
  (4, 4, 5, 2, NULL, 'comment'),
  (5, 5, 6, NULL, NULL, 'video_create'),
  (6, 6, 1, NULL, 2, 'favorite'),
  (7, 7, NULL, 3, NULL, 'comment'),
  (8, 8, 4, NULL, NULL, 'video_create');

-- Add sample data to the 2022 Events table
INSERT INTO `2022_Events` (`event_id`, `user_id`, `video_id`, `comment_id`, `favorite_id`, `event_type`, `device_type`)
VALUES
  (1, 1, 3, NULL, NULL, 'video_create', 'mobile'),
  (2, 2, NULL, 2, NULL, 'comment', 'ipad'),
  (3, 3, NULL, NULL, 2, 'favorite', 'laptop'),
  (4, 4, 7, NULL, NULL, 'video_create', 'laptop'),
  (5, 5, NULL, 1, NULL, 'comment', 'mobile'),
  (6, 6, 10, NULL, 1, 'favorite', 'laptop'),
  (7, 7, NULL, 4, NULL, 'comment', 'ipad'),
  (8, 8, 11, NULL, NULL, 'video_create', 'mobile');
  
  
  

INSERT INTO `2021_Events` (`event_id`, `user_id`, `video_id`, `comment_id`, `favorite_id`, `event_type`)
VALUES
  (1, 1, 3, 1, NULL, 'comment'),
  (2, 2, NULL, NULL, 1, 'favorite'),
  (3, 3, 2, NULL, NULL, 'video_create'),
  (4, 4, 5, 2, NULL, 'comment'),
  (5, 5, 6, NULL, NULL, 'video_create'),
  (6, 6, 1, NULL, 2, 'favorite'),
  (7, 7, NULL, 3, NULL, 'comment'),
  (8, 8, 4, NULL, NULL, 'video_create');

-- Add sample data to the 2022 Events table
INSERT INTO `2022_Events` (`event_id`, `user_id`, `video_id`, `comment_id`, `favorite_id`, `event_type`, `device_type`)
VALUES
  (1, 1, 3, NULL, NULL, 'video_create', 'mobile'),
  (2, 2, NULL, 2, NULL, 'comment', 'ipad'),
  (3, 3, NULL, NULL, 2, 'favorite', 'laptop'),
  (4, 4, 7, NULL, NULL, 'video_create', 'laptop'),
  (5, 5, NULL, 1, NULL, 'comment', 'mobile'),
  (6, 6, 10, NULL, 1, 'favorite', 'laptop'),
  (7, 7, NULL, 4, NULL, 'comment', 'ipad'),
  (8, 8, 11, NULL, NULL, 'video_create', 'mobile');
