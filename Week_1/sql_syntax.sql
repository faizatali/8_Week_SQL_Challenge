-- show table structure
SHOW TABLES;

DESCRIBE members;
DESCRIBE menu;
DESCRIBE sales;

-- Query 1: What is the total amount each customer spent at the restaurant?
SELECT customer_id, SUM(price) AS total_spent
FROM sales 
JOIN menu ON sales.product_id = menu.product_id
GROUP BY customer_id;

-- Query 2: How many days has each customer visited the restaurant?
SELECT customer_id, COUNT(DISTINCT order_date) AS num_days_visited
FROM sales
GROUP BY customer_id;

-- Query 3: What was the first item from the menu purchased by each customer?
SELECT s.customer_id, s.order_date AS first_purchase, m.product_name
FROM sales s 
JOIN menu m ON s.product_id = m.product_id
WHERE (s.customer_id, s.order_date) IN (
    SELECT customer_id, MIN(order_date)
    FROM sales
    GROUP BY customer_id);

-- Query 4: What is the most purchased item on the menu and how many times was it purchased by all customers?

-- Query 5: Which item was the most popular for each customer?

-- Query 6: Which item was purchased first by the customer after they became a member?

-- Query 7: Which item was purchased just before the customer became a member?

-- Query 8: What is the total items and amount spent for each member before they became a member?

-- Query 9: If each $1 spent equates to 10 points and sushi has a 2x points multiplier - how many points would each customer have?

-- Query 10: In the first week after a customer joins the program (including their join date) they earn 2x points on all items, not just sushi - how many points do customer A and B have at the end of January?