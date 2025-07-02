/*
This script demonstrates JOIN operations using two tables:
- tb_state (state info)
- tb_person (person info with foreign key to tb_state)

It covers:
- Basic SELECTs and INSERTs;
- INNER JOIN (implicit and explicit);
- LEFT JOIN, RIGHT JOIN, FULL JOIN;
- CROSS JOIN behavior;
*/

-- Create the tb_state table
CREATE TABLE tb_state (
	state_id bigint NOT NULL,
	state_name varchar(50) NOT NULL,
	state_initials varchar(2) NOT NULL,
	CONSTRAINT pk_state_id PRIMARY KEY(state_id)
);

-- Insert sample data into tb_state
INSERT INTO tb_state (state_id, state_name, state_initials)
VALUES 
	(1, 'São Paulo', 'SP'),
	(2, 'Minas Gerais', 'MG'),
	(3, 'Rio de Janeiro', 'RJ');

-- View all states
SELECT * FROM tb_state;

-- Create the tb_person table with constraints and foreign key
CREATE TABLE tb_person (
	person_id bigint NOT NULL,
	name varchar(50) NOT NULL,
	age integer,
	gender varchar(1),
	state_id bigint,
	cpf bigint,
	CONSTRAINT check_person_age CHECK (age > 0 AND age <= 120),
	CONSTRAINT check_person_gender CHECK (gender = 'M' OR gender = 'F'),
	CONSTRAINT unique_person_cpf UNIQUE (cpf),
	CONSTRAINT pk_person_id PRIMARY KEY (person_id),
	CONSTRAINT fk_person_state_id FOREIGN KEY (state_id) REFERENCES tb_state(state_id)
);

-- Insert people with valid state IDs
INSERT INTO tb_person (person_id, name, age, state_id, gender, cpf)
VALUES 
    (101, 'Eduardo', 25, 1, 'M', 12345678900),
    (102, 'Maria', 32, 2, 'F', 98765432100),
    (103, 'João', 45, 1, 'M', 45678912300);

-- Insert one person without a state (state_id = NULL)
INSERT INTO tb_person (person_id, name, age, state_id, gender, cpf)
VALUES (104, 'Ana', 28, NULL, 'F', 78912345600);

-- View all people
SELECT * FROM tb_person;

-- Implicit INNER JOIN (all matching rows from both tables)
SELECT *
FROM tb_person p, tb_state e
WHERE p.state_id = e.state_id;

-- INNER JOIN with selected columns only
SELECT p.name, e.state_name
FROM tb_person p, tb_state e
WHERE p.state_id = e.state_id;

-- INNER JOIN with column aliases and renamed output columns
SELECT p.name as person_name, e.state_name as state_name_e
FROM tb_person as p, tb_state as e
WHERE p.state_id = e.state_id;

-- Explicit INNER JOIN using JOIN syntax
SELECT p.name, e.state_name
FROM tb_person as p
INNER JOIN tb_state as e ON p.state_id = e.state_id;

-- LEFT JOIN: returns all rows from tb_person, with matching tb_state data or NULLs
-- Unmatched values appear as NULL on the RIGHT (state)
SELECT p.name, e.state_name
FROM tb_person as p
LEFT JOIN tb_state as e ON p.state_id = e.state_id;

-- RIGHT JOIN: returns all rows from tb_state, with matching tb_person data or NULLs
-- Unmatched values appear as NULL on the LEFT (person)
SELECT p.name, e.state_name
FROM tb_person as p
RIGHT JOIN tb_state as e ON p.state_id = e.state_id;

-- FULL JOIN: returns all rows from both tables, matched where possible, NULL otherwise
SELECT p.name, e.state_name
FROM tb_person as p
FULL JOIN tb_state as e ON p.state_id = e.state_id;

-- CROSS JOIN: returns the Cartesian product (every person with every state)
SELECT p.name, e.state_name
FROM tb_person as p
CROSS JOIN tb_state as e;
/*
This script demonstrates JOIN operations using two tables:
- tb_state (state info)
- tb_person (person info with foreign key to tb_state)

It covers:
- Basic SELECTs and INSERTs;
- INNER JOIN (implicit and explicit);
- LEFT JOIN, RIGHT JOIN, FULL JOIN;
- CROSS JOIN behavior;
*/

-- Create the tb_state table
CREATE TABLE tb_state (
	state_id bigint NOT NULL,
	state_name varchar(50) NOT NULL,
	state_initials varchar(2) NOT NULL,
	CONSTRAINT pk_state_id PRIMARY KEY(state_id)
);

-- Insert sample data into tb_state
INSERT INTO tb_state (state_id, state_name, state_initials)
VALUES 
	(1, 'São Paulo', 'SP'),
	(2, 'Minas Gerais', 'MG'),
	(3, 'Rio de Janeiro', 'RJ');

-- View all states
SELECT * FROM tb_state;

-- Create the tb_person table with constraints and foreign key
CREATE TABLE tb_person (
	person_id bigint NOT NULL,
	name varchar(50) NOT NULL,
	age integer,
	gender varchar(1),
	state_id bigint,
	cpf bigint,
	CONSTRAINT check_person_age CHECK (age > 0 AND age <= 120),
	CONSTRAINT check_person_gender CHECK (gender = 'M' OR gender = 'F'),
	CONSTRAINT unique_person_cpf UNIQUE (cpf),
	CONSTRAINT pk_person_id PRIMARY KEY (person_id),
	CONSTRAINT fk_person_state_id FOREIGN KEY (state_id) REFERENCES tb_state(state_id)
);

-- Insert people with valid state IDs
INSERT INTO tb_person (person_id, name, age, state_id, gender, cpf)
VALUES 
    (101, 'Eduardo', 25, 1, 'M', 12345678900),
    (102, 'Maria', 32, 2, 'F', 98765432100),
    (103, 'João', 45, 1, 'M', 45678912300);

-- Insert one person without a state (state_id = NULL)
INSERT INTO tb_person (person_id, name, age, state_id, gender, cpf)
VALUES (104, 'Ana', 28, NULL, 'F', 78912345600);

-- View all people
SELECT * FROM tb_person;

-- Implicit INNER JOIN (all matching rows from both tables)
SELECT *
FROM tb_person p, tb_state e
WHERE p.state_id = e.state_id;

-- INNER JOIN with selected columns only
SELECT p.name, e.state_name
FROM tb_person p, tb_state e
WHERE p.state_id = e.state_id;

-- INNER JOIN with column aliases and renamed output columns
SELECT p.name as person_name, e.state_name as state_name_e
FROM tb_person as p, tb_state as e
WHERE p.state_id = e.state_id;

-- Explicit INNER JOIN using JOIN syntax
SELECT p.name, e.state_name
FROM tb_person as p
INNER JOIN tb_state as e ON p.state_id = e.state_id;

-- LEFT JOIN: returns all rows from tb_person, with matching tb_state data or NULLs
-- Unmatched values appear as NULL on the RIGHT (state)
SELECT p.name, e.state_name
FROM tb_person as p
LEFT JOIN tb_state as e ON p.state_id = e.state_id;

-- RIGHT JOIN: returns all rows from tb_state, with matching tb_person data or NULLs
-- Unmatched values appear as NULL on the LEFT (person)
SELECT p.name, e.state_name
FROM tb_person as p
RIGHT JOIN tb_state as e ON p.state_id = e.state_id;

-- FULL JOIN: returns all rows from both tables, matched where possible, NULL otherwise
SELECT p.name, e.state_name
FROM tb_person as p
FULL JOIN tb_state as e ON p.state_id = e.state_id;

-- CROSS JOIN: returns every person with every state (Cartesian product)
SELECT p.name, e.state_name
FROM tb_person as p
CROSS JOIN tb_state as e;
