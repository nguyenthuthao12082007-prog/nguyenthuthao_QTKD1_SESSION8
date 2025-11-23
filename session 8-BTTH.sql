select count(order_id) as total_order
from orders;

select sum(quantity) as Total_Quantity_Sold
from orders;

select avg(price) as avg_price
from orders;

select min(price) as min_price
from orders;

select max(price) as max_price
from orders;

select country, count(order_id) as total_order
from orders
group by country;

select country, avg(price) as avg_price
from orders
group by country;
