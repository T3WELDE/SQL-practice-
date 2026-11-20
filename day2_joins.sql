-- Day 2: Joins
-- Tables: customers(customer_id, name, city)
--         orders(order_id, customer_id, order_date, amount)
--         employees(employee_id, name, manager_id)

-- 1. Each order with the customer's name and city
SELECT o.order_id, c.name, c.city
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id;

-- 2. All customers, including those with no orders (order_id is NULL if none)
SELECT c.customer_id, c.name, o.order_id
FROM customers c
LEFT JOIN orders o ON o.customer_id = c.customer_id;

-- 3. INNER JOIN keeps only rows that match in both tables.
--    LEFT JOIN keeps every row from the left table, with NULLs on the right where nothing matches.

-- 4. Total spent per customer, highest first
SELECT c.name, SUM(o.amount) AS total_spent
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
GROUP BY c.name
ORDER BY total_spent DESC;

-- 5. Self join: each employee next to their manager
SELECT e.name AS employee, m.name AS manager
FROM employees e
JOIN employees m ON e.manager_id = m.employee_id;
