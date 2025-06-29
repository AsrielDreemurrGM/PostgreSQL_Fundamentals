/*
This script demonstrates the use of primary and foreign keys
between two tables: tb_state and tb_person.

It includes:
- Table creation with constraints;
- Inserting valid data respecting foreign key relationships;
- Simple select queries to confirm data insertion.
*/

-- Create the tb_state table with a primary key
CREATE TABLE tb_state (
	state_id bigint NOT NULL,
	state_name varchar(50) NOT NULL,
	state_initials varchar(2) NOT NULL,
	CONSTRAINT pk_state_id PRIMARY KEY(state_id)
);

-- Create the tb_person table with a foreign key referencing tb_state
CREATE TABLE tb_person (
	person_id bigint NOT NULL,
	person_name varchar(50) NOT NULL,
	age integer NOT NULL CONSTRAINT check_age CHECK (age > 0 AND age <= 120),
	state_id bigint, -- Foreign key that links to tb_state
	gender varchar(1) NOT NULL CHECK (gender IN ('M', 'F')),
	cpf bigint NOT NULL,
	CONSTRAINT pk_person_id PRIMARY KEY(person_id),
	CONSTRAINT fk_state_id_person FOREIGN KEY(state_id) REFERENCES tb_state(state_id)
);

-- Insert sample data into tb_state (parent table)
INSERT INTO tb_state (state_id, state_name, state_initials)
VALUES 
	(1, 'São Paulo', 'SP'),
	(2, 'Minas Gerais', 'MG'),
	(3, 'Rio de Janeiro', 'RJ');

-- View all state records
SELECT * FROM tb_state;

-- Insert valid data into tb_person (child table) referencing tb_state
INSERT INTO tb_person (person_id, person_name, age, state_id, gender, cpf)
VALUES 
    (101, 'Eduardo', 25, 1, 'M', 12345678900),
    (102, 'Maria', 32, 2, 'F', 98765432100),
    (103, 'João', 45, 1, 'M', 45678912300),
    (104, 'Ana', 28, 3, 'F', 78912345600);

-- View all person records
SELECT * FROM tb_person;
