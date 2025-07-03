/*
This script simulates a basic sales system using three related tables:
- client: stores customer data;
- product: stores product catalog with price and stock;
- sale: records transactions linking clients and products.

It includes:
- Primary and foreign key constraints;
- Sample insertions for realistic sales scenarios;
- SELECT queries to verify the data and generate documentation screenshots.
*/

-- Create the client table
CREATE TABLE tb_client (
    client_id SERIAL PRIMARY KEY,
    client_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15)
);

-- Create the product table
CREATE TABLE tb_product (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    price NUMERIC(10, 2) NOT NULL,
    stock_quantity INTEGER NOT NULL
);

-- Create the sale table (like a receipt or invoice)
CREATE TABLE tb_sale (
    sale_id SERIAL PRIMARY KEY,
    client_id INTEGER NOT NULL,
    product_id INTEGER NOT NULL,
    quantity INTEGER NOT NULL,
    sale_date DATE DEFAULT CURRENT_DATE,
    total NUMERIC(10, 2),

    CONSTRAINT fk_client FOREIGN KEY (client_id) REFERENCES tb_client(client_id),
    CONSTRAINT fk_product FOREIGN KEY (product_id) REFERENCES tb_product(product_id)
);

-- Insert data into client table
INSERT INTO tb_client (client_name, email, phone) VALUES
    ('Eduardo Augusto', 'eduardo@email.com', '11999998888'),
    ('Maria Silva', 'maria@email.com', '11888887777');

-- Insert data into product table
INSERT INTO tb_product (product_name, price, stock_quantity) VALUES
    ('Laptop', 3500.00, 10),
    ('Wireless Mouse', 150.00, 50),
    ('Office Chair', 899.99, 15);

-- Insert data into sale table (simulate a purchase)
-- Eduardo bought 1 Laptop and 2 Mice
INSERT INTO tb_sale (client_id, product_id, quantity, total) VALUES
    (1, 1, 1, 3500.00),
    (1, 2, 2, 300.00);

-- Maria bought 1 Chair
INSERT INTO tb_sale (client_id, product_id, quantity, total) VALUES
    (2, 3, 1, 899.99);

-- View tables
SELECT * FROM tb_client;

SELECT * FROM tb_product;

SELECT * FROM tb_sale;

-- Join to show readable sales (client name + product name)
SELECT 
    s.sale_id,
    c.client_name,
    p.product_name,
    s.quantity,
    s.sale_date,
    s.total
FROM tb_sale s
JOIN tb_client c ON s.client_id = c.client_id
JOIN tb_product p ON s.product_id = p.product_id;
