--Script--
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS customers;

CREATE TABLE customers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);
CREATE TABLE orders (
    id INT PRIMARY KEY,
    customer_id INT NULL,
    order_date DATE,
    total_amount DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);
INSERT INTO customers (id, first_name, last_name) VALUES
(1, 'John', 'Doe'),
(2, 'Jane', 'Smith'),
(3, 'Alice', 'Smith'),
(4, 'Bob', 'Jones');

INSERT INTO orders (id, customer_id, order_date, total_amount) VALUES
(1, 1, '2024-01-15', 150.00),
(2, 1, '2024-02-20', 200.00),
(3, 2, '2024-03-10', 50.00),
(4, 3, '2024-04-05', 300.00),
(5, 4, '2024-05-12', 75.00),
(6, NULL, '2024-05-12', 75.00);

--tasK 1--
SELECT customer_id, SUM(total_amount) AS total_spent
FROM orders
GROUP BY customer_id;
--task 2--
SELECT customer_id, order_date, SUM(total_amount) AS total_spent
FROM orders
GROUP BY customer_id;
--task 3--
SELECT customer_id, order_date, SUM(total_amount) AS total_spent
FROM orders
GROUP BY customer_id, order_date;
--task 4--
SELECT customer_id, SUM(total_amount) AS total_spent
FROM orders
WHERE total_amount > 200
GROUP BY customer_id;
--task 5--
SELECT customer_id, SUM(total_amount) AS total_spent
FROM orders
GROUP BY customer_id
HAVING SUM(total_amount) > 200;
--task 6--
SELECT * FROM orders;
--task 7--
SELECT orders.id, customers.first_name, customers.last_name, orders.order_date, orders.total_amount
FROM orders
INNER JOIN customers ON orders.customer_id = customers.id;
--task 8--
SELECT orders.id, customers.first_name, customers.last_name, orders.order_date, orders.total_amount
FROM orders
LEFT JOIN customers ON orders.customer_id = customers.id;
--task 9--
SELECT id, order_date, total_amount
FROM orders
WHERE total_amount >= (SELECT AVG(total_amount) FROM orders);
--task 10--
SELECT id, order_date, total_amount, customer_id
FROM orders
WHERE customer_id IN
(SELECT id FROM customers WHERE last_name = 'Smith');
--task 11--
SELECT order_date
FROM (SELECT id, order_date, total_amount FROM orders) AS order_summary;
