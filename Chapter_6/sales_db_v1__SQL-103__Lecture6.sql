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
INSERT INTO customers (id, name, email)
VALUES (1, 'John Smith', 'john@example.com'),
    (2, 'Jane Doe', 'jane@example.com'),
    (3, 'Bob Johnson', 'bob@example.com'),
    (4, 'Samantha Lee', 'sam@example.com'),
    (5, 'Mike Miller', 'mike@example.com');
INSERT INTO orders (id, customer_id, product, price, date_ordered)
VALUES (1, 1, 'Widget', 19.99, '2022-01-01'),
    (2, 1, 'Gadget', 29.99, '2022-01-03'),
    (3, 2, 'Thingamajig', 39.99, '2022-01-02'),
    (4, 3, 'Widget', 19.99, '2022-01-02'),
    (5, 4, 'Gadget', 29.99, '2022-01-04'),
    (6, 5, 'Thingamajig', 39.99, '2022-01-03');