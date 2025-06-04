create database online_sales6;
use online_sales6;
CREATE TABLE online_sales6(order_id INT,order_date DATE,amount DECIMAL(10,2),product_id VARCHAR(10));
INSERT INTO online_sales6 VALUES
(1, '2023-01-05', 500, 'P1'),
(2, '2023-01-15', 1000, 'P2'),
(3, '2023-02-10', 700, 'P3'),
(4, '2023-02-20', 800, 'P2'),
(5, '2023-03-01', 950, 'P1');
#Use EXTRACT(MONTH FROM order_date) for month
SELECT 
    EXTRACT(MONTH FROM order_date) AS order_month
FROM 
    online_sales6;
#GROUP BY year/month
SELECT 
    EXTRACT(YEAR FROM order_date) AS order_year,
    EXTRACT(MONTH FROM order_date) AS order_month
FROM 
    online_sales6
GROUP BY 
    EXTRACT(YEAR FROM order_date), EXTRACT(MONTH FROM order_date);
#Use SUM() for revenue
SELECT 
    EXTRACT(YEAR FROM order_date) AS order_year,
    EXTRACT(MONTH FROM order_date) AS order_month,
    SUM(amount) AS total_revenue
FROM 
    online_sales6
GROUP BY 
    EXTRACT(YEAR FROM order_date), EXTRACT(MONTH FROM order_date)
ORDER BY 
    order_year, order_month;
#COUNT(DISTINCT order_id) for volume
SELECT 
    EXTRACT(YEAR FROM order_date) AS order_year,
    EXTRACT(MONTH FROM order_date) AS order_month,
    COUNT(DISTINCT order_id) AS total_orders
FROM 
    online_sales6
GROUP BY 
    EXTRACT(YEAR FROM order_date), EXTRACT(MONTH FROM order_date);
#Use ORDER BY for sorting
SELECT 
    EXTRACT(YEAR FROM order_date) AS order_year,
    EXTRACT(MONTH FROM order_date) AS order_month,
    SUM(amount) AS total_revenue,
    COUNT(DISTINCT order_id) AS total_orders
FROM 
    online_sales6
GROUP BY 
    EXTRACT(YEAR FROM order_date), EXTRACT(MONTH FROM order_date)
ORDER BY 
    order_year, order_month;
#Limit results for specific time periods
SELECT 
    EXTRACT(YEAR FROM order_date) AS order_year,
    EXTRACT(MONTH FROM order_date) AS order_month,
    SUM(amount) AS total_revenue,
    COUNT(DISTINCT order_id) AS total_orders
FROM 
    online_sales6
WHERE 
    order_date BETWEEN '2023-01-01' AND '2023-02-28'
GROUP BY 
    EXTRACT(YEAR FROM order_date), EXTRACT(MONTH FROM order_date)
ORDER BY 
    order_year, order_month;

    




