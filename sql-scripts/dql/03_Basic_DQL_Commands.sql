-- Create a table named tb_person with basic columns
CREATE TABLE tb_person (
	id bigint,
	name varchar(50),
	age integer,
	gender varchar(1)
);

-- Add a CHECK constraint to ensure age is between 1 and 120
ALTER TABLE tb_person
ADD CONSTRAINT check_age
CHECK (
	age > 0
	and age < 121
);

-- Insert valid records into the table
INSERT INTO tb_person (id, name, age, gender)
VALUES (1, 'Eduardo', 19, 'M');
INSERT INTO tb_person (id, name, age, gender)
VALUES (2, 'Maria', 21, 'F');

-- Display all records
SELECT * FROM tb_person;

-- This insert will fail due to the age constraint (age = 0)
INSERT INTO tb_person (id, name, age, gender)
VALUES (3, 'John', 0, 'M');

-- Drop the table to redefine it with inline constraints
DROP TABLE tb_person;

-- Recreate the table with inline NOT NULL and CHECK constraints
CREATE TABLE tb_person (
	id bigint NOT NULL,
	name varchar(50) NOT NULL,
	age integer CONSTRAINT check_age CHECK (age > 0 and age < 120),
	gender varchar(1) NOT NULL
);

-- Insert valid records again
INSERT INTO tb_person (id, name, age, gender)
VALUES (1, 'Eduardo', 18, 'M');
INSERT INTO tb_person (id, name, age, gender)
VALUES (2, 'Maria', 21, 'F');
INSERT INTO tb_person (id, name, age, gender)
VALUES (3, 'Eduardo Augusto', 19, 'M');

-- Show all records
SELECT * FROM tb_person;

-- These inserts will fail due to constraint violations
INSERT INTO tb_person (id, name, age, gender)
VALUES (3, 'Dante', 0, 'M'); -- Invalid age
INSERT INTO tb_person (id, name, age, gender)
VALUES (4, 'Carl Johnson', 130, 'M'); -- Invalid age
INSERT INTO tb_person (id, name, age, gender)
VALUES (5, 'Kirby', 200, null); -- Null gender not allowed

-- Filtering records by pattern using LIKE
SELECT * FROM tb_person WHERE name LIKE('Eduardo');
SELECT * FROM tb_person WHERE name LIKE('E%'); -- Starts with E
SELECT * FROM tb_person WHERE name LIKE('%a'); -- Ends with a
SELECT * FROM tb_person WHERE name LIKE('%ardo%'); -- Contains 'ardo'
SELECT * FROM tb_person WHERE name LIKE('__r%'); -- 3rd character is 'r'
SELECT * FROM tb_person WHERE name NOT LIKE('M%'); -- Does not start with M

-- Return only the name column
SELECT name FROM tb_person;

-- Return uppercase versions of names
SELECT UPPER(name) FROM tb_person;

-- Filter with AND/OR logical conditions
SELECT * FROM tb_person WHERE age > 19 AND age <= 21;
SELECT * FROM tb_person WHERE age >= 19 OR name LIKE('Maria');

-- Ordering results alphabetically and by age
SELECT * FROM tb_person ORDER BY name;
SELECT * FROM tb_person ORDER BY name DESC;
SELECT * FROM tb_person ORDER BY name ASC;
SELECT * FROM tb_person ORDER BY age DESC;
SELECT * FROM tb_person ORDER BY age ASC;

-- Add a duplicate name to test DISTINCT
INSERT INTO tb_person (id, name, age, gender)
VALUES (4, 'Maria', 22, 'F');

-- Show all records
SELECT * FROM tb_person;

-- Select only unique names
SELECT DISTINCT(name) FROM tb_person;

-- Add another similar name for testing IN and BETWEEN
INSERT INTO tb_person (id, name, age, gender)
VALUES (5, 'Maria2', 23, 'F');

-- Show all records
SELECT * FROM tb_person;

-- Filter using IN operator
SELECT * FROM tb_person WHERE name IN('Maria', 'Maria2');

-- Filter using BETWEEN for age ranges
SELECT * FROM tb_person WHERE age BETWEEN 18 AND 20;
SELECT * FROM tb_person WHERE age BETWEEN 18 AND 21;

-- Delete table
DROP TABLE tb_person;
