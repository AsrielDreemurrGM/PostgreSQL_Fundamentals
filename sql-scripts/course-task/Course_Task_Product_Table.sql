/*
This SQL script covers a course task on DDL and DML.
Tasks include:
- Create a 'product' table with several columns;
- Alter the table by adding a new column;
- Drop the table;
- Recreate the table to continue exercises;
- Insert sample data into the table;
- Update existing data in the table;
- Delete a specific row from the table;
*/

-- Creating the product table
CREATE TABLE product (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    price NUMERIC(10, 2) NOT NULL,
    quantity INTEGER NOT NULL
);

SELECT * FROM product;

-- Altering the product table by adding a new column 'category'
ALTER TABLE product
ADD COLUMN category VARCHAR(50);

SELECT * FROM product;

-- Droping the product table
DROP TABLE product;

-- Recreating the product table again (to continue the exercise)
CREATE TABLE product (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    price NUMERIC(10, 2) NOT NULL,
    quantity INTEGER NOT NULL,
    category VARCHAR(50)
);

SELECT * FROM product;

-- Inserting some rows into the product table
INSERT INTO product (name, price, quantity, category)
VALUES ('Laptop', 3500.00, 5, 'Electronics');

INSERT INTO product (name, price, quantity, category)
VALUES ('Desk Chair', 850.50, 10, 'Furniture');

SELECT * FROM product;

-- Updating some data in the product table
UPDATE product
SET price = 3200.00
WHERE name = 'Laptop';

SELECT * FROM product;

-- Deleting a row from the product table
DELETE FROM product
WHERE name = 'Desk Chair';

SELECT * FROM product;
