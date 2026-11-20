-- Day 1: SELECT, WHERE, GROUP BY, HAVING
-- Tables: orders(order_id, customer_id, order_date, amount, status)
--         customers(customer_id, name, city, signup_date)

-- 1. Shipped orders over 100, newest first
SELECT *
FROM orders
WHERE amount > 100 AND status = 'shipped'
ORDER BY order_date DESC;

-- 2. Number of orders per customer
SELECT customer_id, COUNT(*) AS order_count
FROM orders
GROUP BY customer_id;

-- 3. Total amount per city, only cities above 5000
SELECT c.city, SUM(o.amount) AS total
FROM customers c
JOIN orders o ON o.customer_id = c.customer_id
GROUP BY c.city
HAVING SUM(o.amount) > 5000;

-- 4. Customers with no orders (two ways)
SELECT c.*
FROM customers c
LEFT JOIN orders o ON o.customer_id = c.customer_id
WHERE o.order_id IS NULL;

SELECT *
FROM customers
WHERE customer_id NOT IN (SELECT customer_id FROM orders);

-- Billboard dataset: most common groups
SELECT group_name, COUNT(*) AS appearances
FROM tutorial.billboard_top_100_year_end
GROUP BY group_name
ORDER BY COUNT(*) DESC
LIMIT 5;

-- Same, but only groups appearing more than 3 times
SELECT group_name, COUNT(*) AS appearances
FROM tutorial.billboard_top_100_year_end
GROUP BY group_name
HAVING COUNT(*) > 3
ORDER BY COUNT(*) DESC;
