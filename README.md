Project Overview

This project demonstrates my ability to work with relational databases using SQL.
I created a mini Ecommerce Database (2022–2024) and performed data analysis using:

SELECT, WHERE, ORDER BY

GROUP BY & Aggregations

JOINS (INNER, LEFT, RIGHT)

Subqueries

Views

Indexes for Optimization

The project simulates real-world ecommerce analytics such as revenue analysis, order trends, customer insights, and product performance.

Dataset Used

I prepared four CSV files:

orders.csv – Order-level data

customers.csv – Customer details

products.csv – Product catalog

order_items.csv – Line-item level details

These were imported into PostgreSQL using \copy.

The database contains four related tables:
Tables:

customers(customer_id, customer_name, email, region…)

orders(order_id, customer_id, order_date, order_status)

products(product_id, product_name, category, price)

order_items(order_item_id, order_id, product_id, quantity, total_price)

SQL Skills Demonstrated: 
✔ Data Retrieval        

SELECT                  

Filtering (WHERE)

Sorting (ORDER BY)

✔ Aggregations

SUM, AVG, COUNT

GROUP BY + HAVING

✔ Joins

INNER JOIN

LEFT JOIN

RIGHT JOIN

✔ Subqueries

Filtered subqueries

Aggregate subqueries

✔ Index Optimization

Created indexes on frequently used columns for faster query performance.



