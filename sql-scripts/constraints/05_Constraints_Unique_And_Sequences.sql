/*
This script demonstrates the use of:
- Primary and foreign keys;
- Constraints (CHECK, UNIQUE);
- Deleting data respecting referential integrity;
- Sequences for auto-incrementing IDs;
- Observing how sequences behave when insertions fail.

The script creates and populates two related tables:
- tb_state: Holds states;
- tb_person: Holds people, with constraints and foreign key to tb_state.
*/

-- Create the tb_state table with a primary key
CREATE TABLE tb_state (
	state_id bigint NOT NULL,
	state_name varchar(50) NOT NULL,
	state_initials varchar(2) NOT NULL,
	CONSTRAINT pk_state_id PRIMARY KEY(state_id)
);

-- Insert sample states into tb_state
INSERT INTO tb_state (state_id, state_name, state_initials)
VALUES 
	(1, 'São Paulo', 'SP'),
	(2, 'Minas Gerais', 'MG'),
	(3, 'Rio de Janeiro', 'RJ');

-- View all records in tb_state
SELECT * FROM tb_state;

-- Create the tb_person table with various constraints
CREATE TABLE tb_person (
	person_id bigint NOT NULL,
	name varchar(50) NOT NULL,
	age integer,
	gender varchar(1),
	state_id bigint,
	cpf bigint,
	-- Age must be between 1 and 120
	CONSTRAINT check_person_age CHECK (age > 0 AND age <= 120),
	-- Gender must be 'M' or 'F'
	CONSTRAINT check_person_gender CHECK (gender = 'M' OR gender = 'F'),
	-- CPF must be unique
	CONSTRAINT unique_person_cpf UNIQUE (cpf),
	-- Primary key on person_id
	CONSTRAINT pk_person_id PRIMARY KEY (person_id),
	-- Foreign key referencing tb_state
	CONSTRAINT fk_person_state_id FOREIGN KEY (state_id) REFERENCES tb_state(state_id)
);

-- Insert valid people into tb_person
INSERT INTO tb_person (person_id, name, age, state_id, gender, cpf)
VALUES 
    (101, 'Eduardo', 25, 1, 'M', 12345678900),
    (102, 'Maria', 32, 2, 'F', 98765432100),
    (103, 'João', 45, 1, 'M', 45678912300),
    (104, 'Ana', 28, 3, 'F', 78912345600);

-- View all records in tb_person
SELECT * FROM tb_person;

-- This will fail due to unique constraint violation on CPF and ID
INSERT INTO tb_person (person_id, name, age, state_id, gender, cpf)
VALUES (101, 'Eduardo', 25, 1, 'M', 12345678900);

-- Attempt to delete all states (will fail due to foreign key constraint)
DELETE FROM tb_state;

-- Delete all persons first to free up the foreign key
DELETE FROM tb_person;

-- Now deletion from tb_state works
DELETE FROM tb_state;

-- Create sequences for state_id and person_id to simulate auto-increment
CREATE SEQUENCE sq_state
START 1
INCREMENT 1
OWNED BY tb_state.state_id;

CREATE SEQUENCE sq_person
START 1
INCREMENT 1
OWNED BY tb_person.person_id;

-- Insert new state using nextval() from sequence
INSERT INTO tb_state (state_id, state_name, state_initials)
VALUES (nextval('sq_state'), 'São Paulo', 'SP');

-- View state table
SELECT * FROM tb_state;

-- Insert a person using nextval() for person_id
INSERT INTO tb_person (person_id, name, age, state_id, gender, cpf)
VALUES (nextval('sq_person'), 'Eduardo A', 25, 1, 'M', 123456789);

-- View person table
SELECT * FROM tb_person;

-- This will fail due to duplicate CPF (violates unique constraint)
-- Sequence will still increment, even if insert fails
INSERT INTO tb_person (person_id, name, age, state_id, gender, cpf)
VALUES (nextval('sq_person'), 'Maria', 20, 1, 'F', 123456789);

-- This insert will succeed, and ID will be 3 due to skipped value
INSERT INTO tb_person (person_id, name, age, state_id, gender, cpf)
VALUES (nextval('sq_person'), 'Eduardo', 28, 1, 'M', 987654321);

-- Final state of tb_person
SELECT * FROM tb_person;
