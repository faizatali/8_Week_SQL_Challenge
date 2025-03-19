-- show table structure
SHOW TABLES;

DESCRIBE members;
DESCRIBE menu;
DESCRIBE sales;

-- Query 1: What is the total amount each customer spent at the restaurant?
SELECT 
    s.customer_id,
    SUM(m.price) AS total_spent
FROM sales s
JOIN menu m 
ON s.product_id = m.product_id
GROUP BY s.customer_id;


-- Query 2: How many days has each customer visited the restaurant?
SELECT 
    customer_id, 
    COUNT(*) AS total_visits
FROM sales
GROUP BY customer_id;


-- Query 3: What was the first item from the menu purchased by each customer?
SELECT 
    s.customer_id, 
    s.order_date, 
    m.product_name
FROM sales s
JOIN menu m
ON s.product_id = m.product_id
WHERE 
    s.order_date = (
        SELECT MIN(order_date)
        FROM sales 
        WHERE customer_id = s.customer_id);


-- Query 4: What is the most purchased item on the menu and how many times was it purchased by all customers?
SELECT 
    m.product_name,
    COUNT(s.order_date) as total_purchased
FROM menu m
JOIN sales s
ON m.product_id = s.product_id
GROUP BY m.product_name
ORDER BY COUNT(s.order_date) DESC
LIMIT 1;
