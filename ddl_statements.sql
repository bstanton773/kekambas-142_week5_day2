-- Data Definition Language (DDL)

-- Create Table
-- Syntax:
-- CREATE TABLE table_name (col_name_1 DATATYPE, col_name_2 DATATYPE, etc)
-- table_name -> all lower case and singular

-- Create a table for our blog user
CREATE TABLE IF NOT EXISTS blog_user (
	-- Column Name DataType <Constraints>
	user_id SERIAL PRIMARY KEY, -- PRIMARY KEY makes sure COLUMN IS BOTH UNIQUE AND NOT NULL 
	username VARCHAR(25) NOT NULL UNIQUE,
	pw_hash VARCHAR NOT NULL,
	first_name VARCHAR(50), --* WITHOUT specifying, can be NULL OR NOT UNIQUE 
	last_name VARCHAR(50),
	email VARCHAR(50) NOT NULL 
);

SELECT *
FROM blog_user;


-- To make any changes to a table after its creation, use the ALTER command

-- Rename a Column
-- ALTER TABLE table_name RENAME COLUMN current_column_name TO new_column_name
ALTER TABLE blog_user
RENAME COLUMN email TO email_address;

-- Add a column:
-- ALTER TABLE table_name ADD COLUMN new_column_name DATATYPE
ALTER TABLE blog_user
ADD COLUMN IF NOT EXISTS middle_name VARCHAR;

SELECT *
FROM blog_user;

-- Change a Column's Datatype:
-- ALTER TABLE table_name ALTER COLUMN col_name TYPE new_datatype;
ALTER TABLE blog_user
ALTER COLUMN email_address TYPE VARCHAR(30);

SELECT *
FROM blog_user;


-- Create Post table with a FK to Blog User Table
CREATE TABLE IF NOT EXISTS post (
	post_id SERIAL PRIMARY KEY,
	title VARCHAR(50) NOT NULL,
	body VARCHAR NOT NULL,
	date_created TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	-- Step 1: Create the column alone
	user_id INTEGER NOT NULL,
	-- Step 2: Add Foreign Key to the new column
	-- Syntax: FOREIGN KEY(col_in_domestic_table) REFERENCES foreign_table_name(col_in_foreign_table)
	FOREIGN KEY(user_id) REFERENCES blog_user(user_id)
);


SELECT *
FROM post;


-- Create the Post-Category Table
CREATE TABLE IF NOT EXISTS post_category (
	post_id INTEGER NOT NULL,
	FOREIGN KEY(post_id) REFERENCES post(post_id),
	category_id INTEGER NOT NULL
--	FOREIGN KEY(category_id) REFERENCES category(category_id) -- Cannot reference a TABLE that does NOT exist!
);

SELECT *
FROM post_category;

-- Create the Category table
CREATE TABLE IF NOT EXISTS category (
	category_id SERIAL PRIMARY KEY,
	category_name VARCHAR(25) NOT NULL,
	description VARCHAR NOT NULL
);

-- Now that the Category table is created, we can add the FK from post_category
-- ALTER TABLE table_name
-- ADD FOREIGN KEY(col_in_domestic_table) REFERENCES foreign_table_name(col_in_foreign_table)
ALTER TABLE post_category
ADD FOREIGN KEY(category_id) REFERENCES category(category_id);


-- Add Comment table
CREATE TABLE post_comment (
	comment_id SERIAL PRIMARY KEY,
	body VARCHAR NOT NULL,
	date_created TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	user_id INTEGER NOT NULL,
	FOREIGN KEY(user_id) REFERENCES blog_user(user_id),
	post_id INTEGER NOT NULL,
	FOREIGN KEY(post_id) REFERENCES post(post_id)
);


-- Create a table to eventually be deleted
CREATE TABLE delete_me(
	test_id SERIAL PRIMARY KEY,
	col_1 INTEGER,
	col_2 BOOLEAN
);

SELECT *
FROM delete_me;

-- Remove a column from a table
-- Syntax: ALTER TABLE table_name DROP COLUMN col_name;
ALTER TABLE delete_me
DROP COLUMN col_1;


-- Remove a table completely, use DROP table_name
DROP TABLE IF EXISTS delete_me;


