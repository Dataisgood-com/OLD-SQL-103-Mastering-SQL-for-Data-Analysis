-- Let's drop the database if it already exists to ensure that we start with a clean slate:
DROP DATABASE IF EXISTS TikTok;

-- Create the TikTok database
CREATE DATABASE TikTok;

-- Switch to the TikTok database
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