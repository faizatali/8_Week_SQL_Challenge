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

### Case Study Questions

#### 📌 1. What is the total amount each customer spent at the restaurant?

SQL Query:
```sql
SELECT 
    s.customer_id,
    SUM(m.price) AS total_spent
FROM 
    sales s
JOIN 
    menu m
ON 
    s.product_id = m.product_id
GROUP BY 
    s.customer_id;
```

Output:

| customer_id | total_sales |
| ----------- | ----------- |
| A           | 76          |
| B           | 74          |
| C           | 36          |

**Answer:**

Customer A spent $76, customer B spent $74, and customer C spent $36.

#### 2. How many days has each customer visited the restaurant?

3. What was the first item from the menu purchased by each customer?

4. What is the most purchased item on the menu and how many times was it purchased by all customers?

5. Which item was the most popular for each customer?

6. Which item was purchased first by the customer after they became a member?

7. Which item was purchased just before the customer became a member?

8. What is the total items and amount spent for each member before they became a member?

9. If each $1 spent equates to 10 points and sushi has a 2x points multiplier - how many points would each customer have?

10. In the first week after a customer joins the program (including their join date) they earn 2x points on all items, not just sushi - how many points do customer A and B have at the end of January?
