
-- Drop database if exists
DROP DATABASE IF EXISTS supercars_db;

-- Create database
CREATE DATABASE supercars_db;

-- Use database
USE supercars_db;

-- Create table
CREATE TABLE supercars (
  supercar_id INT AUTO_INCREMENT PRIMARY KEY,
  model VARCHAR(50) NOT NULL,
  make VARCHAR(50) NOT NULL,
  price_in_dollars DECIMAL(10,2) NOT NULL,
  horsepower INT NOT NULL,
  torque INT NOT NULL,
  top_speed INT NOT NULL,
  acceleration DECIMAL(4,2) NOT NULL,
  engine_type VARCHAR(50) NOT NULL,
  luxury_level ENUM('low', 'medium', 'high') NOT NULL,
  weight INT NOT NULL,
  num_gears INT NOT NULL,
  brand_ambassador VARCHAR(50),
  launch_date DATE,
  is_available BOOLEAN DEFAULT true,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Insert sample data
INSERT INTO supercars (model, make, price_in_dollars, horsepower, torque, top_speed, acceleration, engine_type, luxury_level, weight, num_gears, brand_ambassador, launch_date, is_available)
VALUES
  ('Aventador', 'Lamborghini', 500000.00, 730, 690, 217, 2.9, 'V12', 'high', 3472, 7, 'Lewis Hamilton', '2011-03-01', true),
  ('458 Italia', 'Ferrari', 250000.00, 562, 398, 210, 3.4, 'V8', 'medium', 3384, 7, 'Sebastian Vettel', '2010-01-01', true),
  ('GT', 'Ford', 150000.00, 647, 550, 216, 3.0, 'V6', 'medium', 3526, 7, NULL, '2017-01-01', true),
  ('Huracan', 'Lamborghini', 300000.00, 610, 413, 202, 3.2, 'V10', 'high', 3135, 7, 'Kylian Mbappé', NULL, false),
  ('Senna', 'McLaren', 1000000.00, 789, 590, 208, 2.8, 'V8', 'high', 2641, 7, 'Fernando Alonso', NULL, true),
  ('Chiron', 'Bugatti', 3000000.00, 1500, 1180, 261, 2.5, 'W16', 'high', 4398, 7, 'Cristiano Ronaldo', '2016-03-01', true),
  ('One-77', 'Aston Martin', 2000000.00, 750, 553, 220, 3.7, 'V12', 'high', 3307, 6, 'James Bond', '2010-01-01', true),
  ('Veyron', 'Bugatti', 2500000.00, 1001, 922, 253, 2.5, 'W16', 'high', 4162, 7, 'Usain Bolt', '2005-01-01', false),
  ('LaFerrari', 'Ferrari', 1500000.00, 950, 664, 217, 2.5, 'V12', 'high', 2855, 7, 'Michael Schumacher', '2013-01-01', true),
  ('Veneno', 'Lamborghini', 4500000.00, 740, 507, 221, 2.8, 'V12', 'high', 1490, 7, NULL, '2013-01-01', true),
  ('P1', 'McLaren', 1350000.00, 903, 664, 217, 2.8, 'V8', 'high', 3075, 7, 'Lewis Hamilton', '2014-01-01', true),
  ('Sian', 'Lamborghini', 3500000.00, 819, 720, 217, 2.8, 'V12', 'high', 3450, 7, 'Jaden Smith', NULL, false),
  ('Regera', 'Koenigsegg', 2000000.00, 1500, 1475, 255, 2.8, 'V8', 'high', 3527, 7, NULL, '2015-01-01', true),
  ('Huayra', 'Pagani', 2800000.00, 764, 740, 230, 3.0, 'V12', 'high', 2976, 7, 'Lewis Hamilton', '2011-01-01', false),
  ('Sesto Elemento', 'Lamborghini', 2900000.00, 570, 398, 219, 2.5, 'V10', 'high', 2202, 6, NULL, '2010-01-01', true),
  ('TSR-S', 'Zenvo', 1700000.00, 1177, 811, 325, 2.8, 'V8', 'high', 3042, 7, NULL, '2019-01-01', true),
  ('C_Two', 'Rimac', 2000000.00, 1914, 1696, 258, 1.85, 'Electric', 'high', 1950, 1, 'Richard Hammond', '2022-01-01', true),
  ('Speedtail', 'McLaren', 2500000.00, 1050, 848, 250, 2.5, 'Hybrid', 'high', 1400, 7, 'Chris Harris', '2019-01-01', true),
  ('Naraya', 'Mazzanti', 2000000.00, 1000, 1200, 250, 3.1, 'V8', 'high', 1200, 6, NULL, '2023-01-01', false),
  ('Rebel', 'Apollo', 2300000.00, 780, 560, 224, 2.7, 'V12', 'high', 1250, 6, NULL, '2018-01-01', true),
  ('T.50', 'Gordon Murray', 3000000.00, 663, 467, 217, 2.5, 'V12', 'high', 986, 6, 'Lewis Hamilton', '2020-01-01', true),
  ('RP1', 'Rally', 700000.00, 420, 320, 155, 3.3, 'I4', 'medium', 750, 6, NULL, '2015-01-01', false),
  ('F150', 'Ferrari', 2000000.00, 1036, 663, 236, 2.4, 'V12', 'high', 1525, 7, 'Michael Schumacher', '2013-01-01', true),
  ('Chirana TGT', 'Chirana', 400000.00, 120, 320, 200, 3.0, 'I6', 'low', 2000, 5, NULL, '2017-01-01', true),
  ('Zonda HP Barchetta', 'Pagani', 2000000.00, 800, 811, 218, 3.0, 'V12', 'high', 1250, 6, 'Lewis Hamilton', '2018-01-01', false),
  ('Valkyrie', 'Aston Martin', 3000000.00, 1160, 664, 250, 2.5, 'V12', 'high', 1030, 7, 'Max Verstappen', '2021-01-01', true),
  ('Sian Roadster', 'Lamborghini', 3750000.00, 819, 720, 217, 2.8, 'V12', 'high', 3470, 7, NULL, '2020-01-01', false),
  ('CCX', 'Koenigsegg', 2500000.00, 806, 678, 245, 3.2, 'V8', 'high', 1280, 6, NULL, '2006-01-01', true),
  ('RapidE', 'Aston Martin', 250000.00, 610, 950, 249, 3.0, 'Electric', 'medium', 2150, 1, NULL, '2019-01-01', true),
  ('GMA T.50s Niki Lauda', 'Gordon Murray', 4000000.00, 725, 485, 220, 2.5, 'V12', 'high', 852, 6, 'Niki Lauda', '2022-01-01', false),
  ('Gemera', 'Koenigsegg', 1750000.00, 1700, 2580, 248, 1.9, 'Hybrid', 'high', 1850, 3, NULL, '2020-01-01', true),
  ('Essenza SCV12', 'Lamborghini', 3000000.00, 830, 750, 350, 2.8, 'V12', 'high', 1212, 6, NULL, '2020-01-01', false),
  ('Zenvo TSR', 'Zenvo', 1800000.00, 1177, 811, 325, 2.8, 'V8', 'high', 3042, 7, NULL, '2018-01-01', true),
  ('Pininfarina Battista', 'Pininfarina', 2000000.00, 1874, 1696, 217, 1.9, 'Electric', 'high', 1950, 1, NULL, '2022-01-01', false),
  ('Senna GTR', 'McLaren', 1800000.00, 814, 590, 211, 2.9, 'V8', 'high', 1198, 7, 'Jenson Button', '2020-01-01', false),
  ('Venom F5', 'Hennessey', 2500000.00, 1817, 1193, 311, 2.6, 'V8', 'high', 1338, 7, NULL, '2021-01-01', true),
  ('Bugatti Bolide', 'Bugatti', 5000000.00, 1850, 1850, 311, 2.2, 'W16', 'high', 1240, 7, 'Bugatti Chiron Super Sport 300+ Team', '2020-01-01', false),
  ('Regera Ghost Package', 'Koenigsegg', 3000000.00, 1500, 1475, 255, 2.8, 'V8', 'high', 3527, 7, NULL, '2022-01-01', true),
  ('Rimac Nevera', 'Rimac', 2400000.00, 1914, 1696, 258, 1.85, 'Electric', 'high', 2150, 1, NULL, '2021-01-01', true),
  ('T50s', 'Gordon Murray', 4000000.00, 725, 485, 220, 2.5, 'V12', 'high', 852, 6, NULL, '2023-01-01', false);


