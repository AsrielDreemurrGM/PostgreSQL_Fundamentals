-- Create a table named tb_person with columns id, name, age, and gender
CREATE TABLE tb_person (
	id bigint,
	name varchar(50),
	age integer,
	gender boolean
);

-- Select all rows from tb_person (should be empty initially)
SELECT * FROM tb_person;

-- Insert a new record into tb_person with id=1, name='Eduardo', age=19, gender=true
INSERT INTO tb_person (id, name, age, gender)
VALUES (1, 'Eduardo', 19, true);

-- Remove all data from tb_person but keep the table structure
TRUNCATE TABLE tb_person;

-- Select all rows from tb_person (should be empty after truncate)
SELECT * FROM tb_person;

-- Drop the column 'gender' from tb_person table
ALTER TABLE tb_person
DROP COLUMN gender;

-- Select all rows from tb_person to confirm column drop
SELECT * FROM tb_person;

-- Add a new column 'gender' back as varchar(1) type
ALTER TABLE tb_person
ADD COLUMN gender varchar(1);

-- Select all rows from tb_person to confirm column addition
SELECT * FROM tb_person;

-- Insert a record with gender as a character ('M')
INSERT INTO tb_person (id, name, age, gender)
VALUES (1, 'Eduardo', 19, 'M');

-- Select all rows from tb_person
SELECT * FROM tb_person;

-- Insert another record with id=2 and same data
INSERT INTO tb_person (id, name, age, gender)
VALUES (2, 'Eduardo', 19, 'M');

-- Select all rows from tb_person
SELECT * FROM tb_person;

-- Update all records, setting name to 'Maria'
UPDATE tb_person SET name = 'Maria';

-- Select all rows from tb_person to see updated names
SELECT * FROM tb_person;

-- Update record with id=1, set name back to 'Eduardo'
UPDATE tb_person SET name = 'Eduardo' WHERE id = 1;

-- Select all rows from tb_person
SELECT * FROM tb_person;

-- Update record with id=1, set name to 'Eduardo Augusto' and age to 20
UPDATE tb_person SET name = 'Eduardo Augusto', age = 20 WHERE id = 1;

-- Select all rows from tb_person
SELECT * FROM tb_person;

-- DELETE FROM tb_person; -- This would delete all records (commented out as a warning)

-- Delete the record with id=2 only
DELETE FROM tb_person WHERE id = 2;

-- Final select to show remaining rows
SELECT * FROM tb_person;

-- Delete table
DROP TABLE tb_person;
