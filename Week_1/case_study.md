## Case Study 1 - Danny's Diner 🍜 

### Table Structures

Members:
| Field        | Type       | Null | Key | Default |
|--------------|------------|------|-----|---------|
| customer_id  | varchar(1) | YES  |     | NULL    |       
| join_date    | date       | YES  |     | NULL    |       

Menu:
| Field        | Type       | Null | Key | Default | 
|--------------|------------|------|-----|---------|
| product_id   | int        | YES  |     | NULL    |       
| product_name | varchar(5) | YES  |     | NULL    |       
| price        | int        | YES  |     | NULL    |      

Sales:
| Field        | Type       | Null | Key | Default | 
|--------------|------------|------|-----|---------|
| customer_id  | varchar(1) | YES  |     | NULL    |       
| order_date   | date       | YES  |     | NULL    |       
| product_id   | int        | YES  |     | NULL    |     

<br>

### Case Study Questions

#### 📌 1. What is the total amount each customer spent at the restaurant?

SQL Query:
```sql
SELECT customer_id, SUM(price) AS total_spent
FROM sales JOIN menu ON sales.product_id = menu.product_id
GROUP BY customer_id;
```

Output:
```sql
+-------------+-------------+
| customer_id | total_spent |
+-------------+-------------+
| A           |          76 |
| B           |          74 |
| C           |          36 |
+-------------+-------------+
3 rows in set (0.00 sec)
```

**Answer:** Customer A spent $76, customer B spent $74, and customer C spent $36.
<br><br>

#### 📌 2. How many days has each customer visited the restaurant?

SQL Query:
```sql
SELECT customer_id, COUNT(DISTINCT order_date) AS num_days_visited
FROM sales
GROUP BY customer_id;
```

Output:
```sql
+-------------+------------------+
| customer_id | num_days_visited |
+-------------+------------------+
| A           |                4 |
| B           |                6 |
| C           |                2 |
+-------------+------------------+
3 rows in set (0.01 sec)
```

**Answer:** Customer A visited 4 times, customer B visited 6 times, and customer C visited 2 times.
<br><br>

#### 📌 3. What was the first item from the menu purchased by each customer?

SQL Query:
```sql
SELECT s.customer_id, s.order_date AS first_purchase, m.product_name
FROM sales s
JOIN menu m ON s.product_id = m.product_id
WHERE (s.customer_id, s.order_date) IN (
    SELECT customer_id, MIN(order_date)
    FROM sales
    GROUP BY customer_id);
```

Output:
```sql
+-------------+----------------+--------------+
| customer_id | first_purchase | product_name |
+-------------+----------------+--------------+
| A           | 2021-01-01     | sushi        |
| A           | 2021-01-01     | curry        |
| B           | 2021-01-01     | curry        |
| C           | 2021-01-01     | ramen        |
| C           | 2021-01-01     | ramen        |
+-------------+----------------+--------------+
5 rows in set (0.00 sec)
```

**Answer:** Customer A's first order was sushi and curry, customer B's first order was curry, and customer C's first order was ramen. 
<br><br>

#### 📌 4. What is the most purchased item on the menu and how many times was it purchased by all customers?

SQL Query:
```sql
SELECT m.product_name, COUNT(s.product_id) AS total_orders
FROM sales s 
JOIN menu m ON s.product_id = m.product_id
GROUP BY m.product_name
ORDER BY total_orders DESC
LIMIT 1;
```

Output:
```sql
+--------------+--------------+
| product_name | total_orders |
+--------------+--------------+
| ramen        |            8 |
+--------------+--------------+
1 row in set (0.00 sec)
```

**Answer:** The most purchased item is ramen, which was ordered 8 times.
<br><br> 

#### 📌 5. Which item was the most popular for each customer?

SQL Query:
```sql


#### 📌 6. Which item was purchased first by the customer after they became a member?

#### 📌 7. Which item was purchased just before the customer became a member?

#### 📌 8. What is the total items and amount spent for each member before they became a member?

#### 📌 9. If each $1 spent equates to 10 points and sushi has a 2x points multiplier - how many points would each customer have?

#### 📌 10. In the first week after a customer joins the program (including their join date) they earn 2x points on all items, not just sushi - how many points do customer A and B have at the end of January?
