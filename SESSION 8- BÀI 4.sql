create table products(
product_id INT PRIMARY KEY,
product_name VARCHAR(100),
category VARCHAR(50),
price DECIMAL
);
CREATE TABLE ORDERS(
order_id INT PRIMARY KEY,
customer_id INT,
order_date DATE,
total_amount DECIMAL
);

SELECT category, COUNT(*) AS number_of_products
FROM Products
GROUP BY category;

SELECT customer_id, SUM(total_amount) AS total_spent
FROM Orders
GROUP BY customer_id;

SELECT category, 
       COUNT(*) AS product_count, 
       AVG(price) AS avg_price, 
       MAX(price) AS max_price, 
       MIN(price) AS min_price
FROM Products
GROUP BY category;

SELECT customer_id, SUM(total_amount) AS total_spent
FROM Orders
GROUP BY customer_id
HAVING SUM(total_amount) > 1000;

SELECT category, COUNT(*) AS product_count
FROM Products
GROUP BY category
HAVING COUNT(*) > 5;

SELECT customer_id, SUM(total_amount) AS total_spent
FROM Orders
GROUP BY customer_id
ORDER BY total_spent DESC
LIMIT 3;