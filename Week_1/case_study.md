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
SELECT 
    s.customer_id,
    SUM(m.price) AS total_spent
FROM sales s
JOIN menu m
ON s.product_id = m.product_id
GROUP BY s.customer_id;
```

Output:

| customer_id | total_sales |
| ----------- | ----------- |
| A           | 76          |
| B           | 74          |
| C           | 36          |

**Answer:**

Customer A spent $76, customer B spent $74, and customer C spent $36.

<br>

#### 📌 2. How many days has each customer visited the restaurant?

SQL Query:

```sql
SELECT 
    customer_id, 
    COUNT(*) AS total_visits
FROM sales
GROUP BY customer_id;
```

Output:

| customer_id | total_visits |
|-------------|--------------|
| A           | 6            |
| B           | 6            |
| C           | 3            |

**Answer:**

Customer A and B each visited the resturant 6 times, while customer C visited 3 times. 

<br>

#### 📌 3. What was the first item from the menu purchased by each customer?

SQL Query:

```sql
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
```

Output:

| customer_id | order_date  | product_name |
|-------------|-------------|--------------|
| A           | 2021-01-01  | sushi        |
| A           | 2021-01-01  | curry        |
| B           | 2021-01-01  | curry        |
| C           | 2021-01-01  | ramen        |
| C           | 2021-01-01  | ramen        |

**Answer:**

Customer A ordered sushi and curry, customer B ordered curry, and lastly customer C ordered ramen bowls.

<br>

#### 📌 4. What is the most purchased item on the menu and how many times was it purchased by all customers?

SQL Query:

```sql
SELECT 
    m.product_name,
    COUNT(s.order_date) as total_purchased
FROM menu m
JOIN sales s
ON m.product_id = s.product_id
GROUP BY m.product_name
ORDER BY COUNT(s.order_date) DESC
LIMIT 1;
```

Output:

| product_name | total_purchased |
|--------------|-----------------|
| ramen        | 8               |

**Answer:**

The most purchased item on the menu was ramen, which was purchased 8 times.

<br>

#### 📌 5. Which item was the most popular for each customer?

#### 📌 6. Which item was purchased first by the customer after they became a member?

#### 📌 7. Which item was purchased just before the customer became a member?

#### 📌 8. What is the total items and amount spent for each member before they became a member?

#### 📌 9. If each $1 spent equates to 10 points and sushi has a 2x points multiplier - how many points would each customer have?

#### 📌 10. In the first week after a customer joins the program (including their join date) they earn 2x points on all items, not just sushi - how many points do customer A and B have at the end of January?
