-- Table for Products
CREATE TABLE products(
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(50),
    product_price DECIMAL(10, 2),
    stock_quantity INT
);

-- Table for customers
CREATE TABLE customers(
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR (50)
);

-- Table for orders
CREATE TABLE orders(
    order_id SERIAL PRIMARY KEY,
    FOREIGN KEY customer_id INT REFERENCES customers(customer_id),
    order_date DATE

);

-- Table for order items
CREATE TABLE order_items(
    FOREIGN KEY order_id INT REFERENCES orders(order_id),
    FOREIGN KEY product_id INT REFERENCES Products(product_id),
    quantity INT,
    PRIMARY KEY(order_id, product_id)
)

-- Inserting data for products table
INSERT INTO products (product_name, product_price, stock_quantity) VALUES
('Table', 300.00, 5),
('Chair', 75.00, 10),
('Sofa', 600.00, 15),
('Coffee table', 200.00, 12),
('Rug', 35.00, 20);

-- Inserting data for customers table
INSERT INTO customers (first_name, last_name, email) VALUES
('John', 'Doe', 'jdoe@gmail.com'),
('Jane', 'Doe', 'janedoe@hotmial.com'),
('Sally', 'Smith', 'ssmith@gmail.com'),
('Luke', 'Metcalfe', 'ljmet@hotmail.com');

-- inserting data for orders table
INSERT INTO orders (customer_id, order_date) VALUES
(1, '2023-01-01'),
(1, '2023-01-02'),
(2, '2024-04-03'),
(3, '2024-09-06'),
(4, '2024-12-09');

-- inserting data for order_items table
INSERT INTO order_items (order_id, product_id, quantity) VALUES
(1, 1, 3),
(1, 2, 3),
(2, 4, 5),
(2, 5, 1),
(3, 3, 2),
(3, 1, 1),
(4, 5, 4),
(4, 3, 3),
(5, 2, 1),
(5, 1, 3);

-- Adding tasks
-- get all products and stock quantity
SELECT product_name, stock_quantity
FROM products;

-- get the product name and quantity for one order
SELECT products.product_name, order_items.quantity
FROM order_items
JOIN products ON order_items.product_id = products(product_id)
WHERE order_items.order_id = 3;

-- get all the orders placed by one customer
SELECT orders.order_id AS order_id, order_items.product_id, order_items.quantity
FROM orders
JOIN order_items ON orders.order_id = order_items.order_id
WHERE orders.customer_id = 4;

-- simulate stock reduction
UPDATE products
SET stock_quantity = stock_quantity - order_items.quantity
FROM order_items
WHERE products.product_id = order_items.product_id
AND order_items.order_id = 2;

-- delete an order and item
DELETE FROM order_items
WHERE order_id = 1;

Delete From orders
WHERE order_id = 1;
