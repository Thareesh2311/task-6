
-- Task 6: Sales Trend Analysis Using Aggregations

-- 1. Monthly Revenue + Monthly Order Volume
SELECT
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    SUM(amount) AS total_revenue,
    COUNT(DISTINCT order_id) AS total_orders
FROM online_sales
GROUP BY year, month
ORDER BY year, month;

-- 2. Monthly Trend for 2024
SELECT
    EXTRACT(MONTH FROM order_date) AS month,
    SUM(amount) AS total_revenue,
    COUNT(DISTINCT order_id) AS total_orders
FROM online_sales
WHERE EXTRACT(YEAR FROM order_date) = 2024
GROUP BY month
ORDER BY month;

-- 3. Quarterly Revenue + Orders
SELECT
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(QUARTER FROM order_date) AS quarter,
    SUM(amount) AS total_revenue,
    COUNT(DISTINCT order_id) AS total_orders
FROM online_sales
GROUP BY year, quarter
ORDER BY year, quarter;

-- 4. Monthly Trend for a Specific Product (Product 101)
SELECT
    product_id,
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    SUM(amount) AS total_revenue,
    COUNT(order_id) AS total_orders
FROM online_sales
WHERE product_id = 101
GROUP BY product_id, year, month
ORDER BY year, month;

-- 5. Monthly Average Order Value
SELECT
    EXTRACT(MONTH FROM order_date) AS month,
    AVG(amount) AS avg_order_value
FROM online_sales
GROUP BY month
ORDER BY month;
