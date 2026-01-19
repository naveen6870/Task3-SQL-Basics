-- Basic preview
SELECT * FROM superstore LIMIT 10;

-- Filtering
SELECT * FROM superstore WHERE category = 'Technology';
SELECT * FROM superstore WHERE region = 'West';

-- Sorting
SELECT * FROM superstore ORDER BY sales DESC LIMIT 10;

-- Aggregations
SELECT category, SUM(sales) AS total_sales
FROM superstore GROUP BY category ORDER BY total_sales DESC;

SELECT region, SUM(sales) AS total_sales
FROM superstore GROUP BY region ORDER BY total_sales DESC;

SELECT segment, COUNT(*) AS order_count
FROM superstore GROUP BY segment ORDER BY order_count DESC;

-- HAVING
SELECT category, SUM(sales) AS total_sales
FROM superstore GROUP BY category
HAVING SUM(sales) > 100000;

-- BETWEEN
SELECT *
FROM superstore
WHERE TO_DATE(order_date, 'MM/DD/YYYY')
BETWEEN '2016-01-01' AND '2016-12-31';

-- LIKE
SELECT DISTINCT customer_name
FROM superstore
WHERE customer_name LIKE 'A%';

-- Top customers
SELECT customer_name, SUM(sales) AS total_spend
FROM superstore GROUP BY customer_name
ORDER BY total_spend DESC LIMIT 5;
