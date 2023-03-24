
-- Drop the database if it already exists
DROP DATABASE IF EXISTS bollywood_movies;

-- Create the database
CREATE DATABASE bollywood_movies;

-- Use the database
USE bollywood_movies;

-- Create the movies table
CREATE TABLE movies (
    movie_id INT NOT NULL AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    year INT NOT NULL,
    genre VARCHAR(255) NOT NULL,
    director VARCHAR(255) NOT NULL,
    PRIMARY KEY (movie_id)
);

-- Create the actors table
CREATE TABLE actors (
    actor_id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    gender ENUM('Male', 'Female') NOT NULL,
    age INT NOT NULL,
    PRIMARY KEY (actor_id)
);

-- Create the movie_actors table to establish a many-to-many relationship
CREATE TABLE movie_actors (
    movie_id INT NOT NULL,
    actor_id INT NOT NULL
);

-- Insert data into the movies table
INSERT INTO movies (title, year, genre, director)
VALUES
('Dilwale Dulhania Le Jayenge', 1995, 'Romance', 'Aditya Chopra'),
('Kuch Kuch Hota Hai', 1998, 'Romance', 'Karan Johar'),
('Hum Aapke Hain Koun..!', 1994, 'Romance', 'Sooraj Barjatya'),
('Darr', 1993, 'Thriller', 'Yash Chopra'),
('Khal Nayak', 1993, 'Action', 'Subhash Ghai');

-- Insert data into the actors table
INSERT INTO actors (name, gender, age)
VALUES
('Shah Rukh Khan', 'Male', 56),
('Kajol', 'Female', 47),
('Madhuri Dixit', 'Female', 54),
('Salman Khan', 'Male', 55),
('Sanjay Dutt', 'Male', 62);

-- Insert data into the movie_actors table
INSERT INTO movie_actors (movie_id, actor_id)
VALUES
(1, 1),
(1, 2),
(2, 1),
(2, 2),
(3, 4),
(3, 3),
(4, 1),
(4, 5),
(5, 4),
(5, 1);

