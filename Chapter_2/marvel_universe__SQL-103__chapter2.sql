-- First, drop the database if it already exists
DROP DATABASE IF EXISTS marvel_universe;

-- Create a new database called marvel_universe
CREATE DATABASE marvel_universe;

-- Use the newly created database
USE marvel_universe;


-- Create a table called "superheroes"
CREATE TABLE superheroes (
  id INT NOT NULL AUTO_INCREMENT, -- Unique identifier for each superhero
  name VARCHAR(50) NOT NULL, -- Name of the superhero
  gender VARCHAR(10) NOT NULL, -- Gender of the superhero
  age INT NOT NULL, -- Age of the superhero
  weight VARCHAR(10) NOT NULL, -- Weight of the superhero
  height VARCHAR(10) NOT NULL, -- Height of the superhero
  hero_rank INT NOT NULL, -- Rank of the superhero within the Avengers
  superpowers VARCHAR(100) NOT NULL, -- Superpowers possessed by the superhero
  first_appearance VARCHAR(50) NOT NULL, -- The comic book in which the superhero first appeared
  current_status VARCHAR(20) NOT NULL, -- Whether the superhero is alive or deceased
  affiliation VARCHAR(50) NOT NULL, -- The superhero's affiliation (in this case, the Avengers)
  num_appearances INT NOT NULL, -- Number of appearances by the superhero in various media
  aliases VARCHAR(100) NOT NULL, -- List of aliases for the superhero
  PRIMARY KEY (id) -- Define the primary key for the table
);
INSERT INTO superheroes (name, gender, age, weight, height, hero_rank, superpowers, first_appearance, current_status, affiliation, num_appearances, aliases)
VALUES 
('Iron Man', 'Male', 45, '225', '6\'1"', 1, 'Powered armor suit; weapons and flight systems', 'Tales of Suspense #39 (1963)', 'Alive', 'Avengers', 1223, 'Tony Stark, Golden Avenger, Shellhead'),
('Thor', 'Male', 1000, '640', '6\'6"', 2, 'Superhuman strength, durability, and longevity; control over storms and lightning', 'Journey into Mystery #83 (1962)', 'Alive', 'Avengers', 1228, 'Donald Blake, God of Thunder'),
('Hulk', 'Male', 48, '1400', '7\'0"', 4, 'Superhuman strength, durability, and regeneration; potential for limitless strength', 'The Incredible Hulk #1 (1962)', 'Alive', 'Avengers', 1217, 'Bruce Banner, Jade Giant'),
('Captain America', 'Male', 101, '240', '6\'2"', 5, 'Superhuman strength, agility, and durability; expert in hand-to-hand combat', 'Captain America Comics #1 (1941)', 'Alive', 'Avengers', 1226, 'Steve Rogers, Sentinel of Liberty, Star-Spangled Avenger'),
('Scarlet Witch', 'Female', 32, '132', '5\'7"', 8, 'Reality warping, energy manipulation, flight', 'X-Men #4 (1964)', 'Alive', 'Avengers', 1328, 'Wanda Maximoff'),
('Vision', 'Male', 3, '300', '6\'3"', 5, 'Superhuman strength, speed, and durability; density control, phasing, energy projection', 'Avengers #57 (1968)', 'Deceased', 'Avengers', 547, 'Victor Shade, Jonas, Visionary'),
('Black Panther', 'Male', 42, '200', '6\'0"', 3, 'Superhuman strength, agility, and senses; Vibranium suit and claws', 'Fantastic Four #52 (1966)', 'Alive', 'Avengers', 1017, 'T\'Challa'),
('Ant-Man', 'Male', 49, '180', '6\'0"', 10, 'Size manipulation, strength, and durability; telepathic control of ants', 'Tales to Astonish #27 (1962)', 'Alive', 'Avengers', 598, 'Hank Pym, Giant-Man, Goliath, Yellowjacket'),
('Spider-Man', 'Male', 16, '165', '5\'10"', 12, 'Superhuman strength, agility, and spider-like abilities; precognition', 'Amazing Fantasy #15 (1962)', 'Alive', 'Avengers', 784, 'Peter Parker'),
('Doctor Strange', 'Male', 42, '180', '6\'2"', 9, 'Mastery of magic and the mystical arts; astral projection, teleportation', 'Strange Tales #110 (1963)', 'Alive', 'Avengers', 882, 'Stephen Strange, Sorcerer Supreme'),
('Captain Marvel', 'Female', 29, '165', '5\'11"', 7, 'Superhuman strength, speed, and durability; energy projection and absorption', 'Marvel Super-Heroes #13 (1968)', 'Alive', 'Avengers', 458, 'Carol Danvers, Binary, Warbird'),
('Falcon', 'Male', 35, '245', '6\'2"', 11, 'Winged flight; enhanced senses and physical abilities; telepathic link with birds', 'Captain America #117 (1969)', 'Alive', 'Avengers', 798, 'Sam Wilson, Captain America'),
('Hawkeye', 'Male', 50, '230', '6\'3"', 13, 'Master archer and marksman; enhanced senses and physical abilities', 'Tales of Suspense #57 (1964)', 'Alive', 'Avengers', 943, 'Clint Barton, Goliath, Ronin'),
('Iron Fist', 'Male', 33, '175', '5\'11"', 14, 'Master of martial arts and chi manipulation; superhuman strength, agility, and durability', 'Marvel Premiere #15 (1974)', 'Alive', 'Avengers', 389, 'Danny Rand, Living Weapon'),
('Ms. Marvel', 'Female', 25, '130', '5\'7"', 15, 'Superhuman strength, durability, and flight; energy projection', 'Ms. Marvel #1 (1977)', 'Alive', 'Avengers', 254, 'Kamala Khan'),
('Quicksilver', 'Male', 37, '175', '6\'0"', 16, 'Superhuman speed and agility; time manipulation', 'X-Men #4 (1964)', 'Alive', 'Avengers', 917, 'Pietro Maximoff, Peter Maximoff'),
('She-Hulk', 'Female', 41, '700', '6\'7"', 17, 'Superhuman strength, durability, and regeneration; skilled lawyer', 'Savage She-Hulk #1 (1980)', 'Alive', 'Avengers', 303, 'Jennifer Walters'),
('Spider-Woman', 'Female', 30, '145', '5\'10"', 18, 'Superhuman strength, agility, and flight; bio-electric blasts', 'Marvel Spotlight #32 (1977)', 'Alive', 'Avengers', 195, 'Jessica Drew'),
('Wasp', 'Female', 36, '115', '5\'4"', 19, 'Winged flight; size manipulation and energy blasts', 'Tales to Astonish #44 (1963)', 'Alive', 'Avengers', 689, 'Janet Van Dyne, Giant-Girl, Yellowjacket'),
('Aquaman', 'Male', 35, '325', '6\'1"', 3, 'Ability to communicate with marine life; superhuman strength and durability', 'More Fun Comics #73 (1941)', 'Alive', 'Justice League', 719, 'Arthur Curry, King of the Seven Seas'),
('Wonder Woman', 'Female', 5000, '135', '6\'0"', 2, 'Superhuman strength, durability, and agility; mastery of hand-to-hand combat', 'All Star Comics #8 (1941)', 'Alive', 'Justice League', 1243, 'Diana Prince, Amazon Princess'),
('Batman', 'Male', 45, '210', '6\'2"', 1, 'Genius-level intellect; peak physical conditioning; extensive arsenal of weapons and gadgets', 'Detective Comics #27 (1939)', 'Alive', 'Justice League', 1974, 'Bruce Wayne, Dark Knight, Caped Crusader'),
('Green Lantern', 'Male', 34, '200', '6\'2"', 4, 'Ability to create solid constructs out of green energy; limited flight', 'All American Comics #16 (1940)', 'Alive', 'Justice League', 1024, 'Hal Jordan'),
('The Flash', 'Male', 29, '175', '6\'0"', 5, 'Superhuman speed and reflexes; time travel and dimensional travel', 'Flash Comics #1 (1940)', 'Alive', 'Justice League', 825, 'Barry Allen, Fastest Man Alive'),
('Cyborg', 'Male', 25, '385', '6\'6"', 7, 'Advanced cybernetic enhancements; superhuman strength, durability, and hacking skills', 'DC Comics Presents #26 (1980)', 'Alive', 'Justice League', 398, 'Victor Stone'),
('Green Arrow', 'Male', 35, '185', '6\'2"', 10, 'Expert archer and marksman; peak physical conditioning', 'More Fun Comics #73 (1941)', 'Alive', 'Justice League', 676, 'Oliver Queen, Emerald Archer'),
('Martian Manhunter', 'Male', 317, '350', '6\'7"', 6, 'Superhuman strength, durability, and shape-shifting; telepathy and telekinesis', 'Detective Comics #225 (1955)', 'Alive', 'Justice League', 598, 'J\'onn J\'onzz, Last Martian'),
('Supergirl', 'Female', 16, '135', '5\'7"', 9, 'Superhuman strength, durability, and flight; heat vision and freeze breath', 'Action Comics #252 (1959)', 'Alive', 'Justice League', 531, 'Kara Zor-El, Maid of Might'),
('Shazam', 'Male', 14, '190', '6\'0"', 8, 'Ability to transform into a superpowered adult with strength, speed, and flight; wisdom of Solomon', 'Whiz Comics #2 (1940)', 'Alive', 'Justice League', 287, 'Billy Batson, World\'s Mightiest Mortal');


