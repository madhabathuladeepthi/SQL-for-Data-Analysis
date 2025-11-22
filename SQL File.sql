CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    city VARCHAR(100),
    state VARCHAR(100),
    email VARCHAR(150)
);

SELECT COUNT(*) FROM customers;

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(150),
    category VARCHAR(100),
    price NUMERIC(10,2)
);

SELECT COUNT(*) FROM products;

CREATE TABLE orders (
    order_id INT,
    customer_id INT,
    order_date DATE,
    order_status VARCHAR(20)
);

copy public.orders (order_id, customer_id, order_date, order_status)
FROM 'C:/Program Files/PostgreSQL/18/data/orders.csv'
DELIMITER ',' CSV HEADER ENCODING 'UTF8' QUOTE '"';

TRUNCATE TABLE order_items, orders RESTART IDENTITY CASCADE;

copy public.orders (order_id, customer_id, order_date, order_status)
FROM 'C:/PROGRA~1/POSTGR~1/18/data/orders.csv'
DELIMITER ','
CSV HEADER;

SELECT * FROM orders LIMIT 10;

CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT REFERENCES orders(order_id),
    product_id INT REFERENCES products(product_id),
    quantity INT,
    price NUMERIC(10,2)
);

SELECT COUNT(*) FROM order_items;

SELECT *
FROM orders
WHERE order_status = 'Completed';

SELECT *
FROM orders
WHERE order_date >= '2023-01-01';

SELECT *
FROM orders
ORDER BY order_date DESC;

SELECT customer_id,
       COUNT(order_id) AS total_orders
FROM orders
GROUP BY customer_id
ORDER BY total_orders DESC;

SELECT o.order_id, o.order_date, c.customer_name
FROM orders o
INNER JOIN customers c
    ON o.customer_id = c.customer_id;

SELECT o.order_id, oi.product_id, oi.quantity
FROM orders o
LEFT JOIN order_items oi
    ON o.order_id = oi.order_id;

SELECT p.product_id, p.product_name, oi.order_id
FROM order_items oi
RIGHT JOIN products p
    ON oi.product_id = p.product_id;

SELECT *
FROM customers
WHERE customer_id IN (
    SELECT customer_id
    FROM orders
    GROUP BY customer_id
    HAVING COUNT(*) > 5
);

SELECT MAX(quantity) AS max_qty
FROM order_items;

CREATE INDEX idx_orders_customer
ON orders(customer_id);

CREATE INDEX idx_items_product
ON order_items(product_id);

CREATE INDEX idx_orders_date
ON orders(order_date);