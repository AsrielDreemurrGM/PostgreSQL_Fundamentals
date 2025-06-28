-- Create a table named tb_person with id, name, and age columns
create table tb_person(
	id bigint,
	name varchar(50),
	age integer
);

-- Add a new column 'gender' of type boolean to tb_person
alter table tb_person
add column gender boolean;

-- Add a column 'name_m' to tb_person, to be renamed later
alter table tb_person
add column name_m varchar(50);

-- Rename column 'name_m' to 'mother_name'
alter table tb_person
rename column name_m to mother_name;

-- Change 'mother_name' column type to varchar(30)
alter table tb_person
alter column mother_name type varchar(30);

-- Change 'mother_name' column type to character
alter table tb_person
alter column mother_name type character;

-- Set default value for 'mother_name' column
alter table tb_person
alter column mother_name
set default 'Mother';

-- Drop the default value from 'mother_name' column
alter table tb_person
alter column mother_name
drop default;

-- Set 'mother_name' column as NOT NULL
alter table tb_person
alter column mother_name
set not null;

-- Drop NOT NULL constraint from 'mother_name'
alter table tb_person
alter column mother_name
drop not null;

-- Rename the table tb_person to tb_person_1
alter table tb_person
rename to tb_person_1;

-- Drop 'mother_name' column from tb_person_1
alter table tb_person_1
drop column mother_name;

-- Remove all data from tb_person_1, keeping the structure
truncate table tb_person_1;

-- Drop the table tb_person_1 from the database
drop table tb_person_1;
