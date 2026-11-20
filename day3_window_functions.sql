-- Day 3: Window functions
-- Table: orders(order_id, customer_id, order_date, amount)

-- 1. Number each customer's orders from oldest to newest
SELECT *,
       ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY order_date) AS order_number
FROM orders;

-- 2. Rank all orders by amount, highest first (no PARTITION BY: one ranking across everything)
SELECT *,
       RANK() OVER (ORDER BY amount DESC) AS amount_rank
FROM orders;

-- 3. ROW_NUMBER never repeats. RANK gives ties the same number, then skips (1, 2, 2, 4).

-- 4. Each order with the customer's total number of orders, without collapsing rows
SELECT *,
       COUNT(*) OVER (PARTITION BY customer_id) AS customer_order_count
FROM orders;

-- 5. PARTITION BY splits rows into groups for the calculation but keeps every row.
--    GROUP BY squashes each group into one row.

-- Billboard: ROW_NUMBER vs RANK on a column with ties
SELECT group_name, year, song_name,
       ROW_NUMBER() OVER (PARTITION BY group_name ORDER BY year) AS row_num,
       RANK()       OVER (PARTITION BY group_name ORDER BY year) AS rnk
FROM tutorial.billboard_top_100_year_end
WHERE group_name = 'Madonna'
ORDER BY year;
