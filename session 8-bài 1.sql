create database shop;
use shop;

create table products(
product_id int primary key,
product_name varchar(100),
product_price decimal,
product_stock int
);

create table customers(
customer_id int primary key,
customer_name varchar(100),
customer_city varchar(50)
);

create table orders(
order_id int primary key,
order_date DATE,
customer_id int,
foreign key (customer_id) references customers( customer_id),
total_amount decimal
);

SELECT COUNT(*) AS total_products
FROM Products;

SELECT SUM(total_amount) AS total_revenue
FROM Orders;

SELECT AVG(price) AS average_price
FROM Products;

SELECT MAX(total_amount) AS max_order_amount
FROM Orders;

SELECT MIN(total_amount) AS min_order_amount
FROM Orders;

SELECT COUNT(*) AS hanoi_customers_count
FROM Customers
WHERE city = 'Hanoi';




