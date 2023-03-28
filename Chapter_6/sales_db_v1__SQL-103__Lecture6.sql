DROP DATABASE IF EXISTS sales_db_v1;
CREATE DATABASE sales_db_v1;
USE sales_db_v1;

CREATE TABLE customers (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(50)
);

CREATE TABLE orders (
    id INT PRIMARY KEY,
    customer_id INT,
    product VARCHAR(50),
    price DECIMAL(10, 2),
    date_ordered DATE
);
