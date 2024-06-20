-- ***********************ON DELETE SET NULL*******************************
-- ON DELETE SET NULL
-- If you made the child table (referencing table) ON DELETE SET NULL this means if a record 
-- in the parent table (referenced table) is deleted then the corresponding entry or values in the 
-- child table (referencing table) will be set to NULL.
-- CREATE TABLE branch (
--   branch_id INT PRIMARY KEY,
--   branch_name VARCHAR(40),
--   mgr_id INT,
--   mgr_start_date DATE,
--   FOREIGN KEY(mgr_id) REFERENCES employee(emp_id) ON DELETE SET NULL
-- );

-- Delete a record (with emp_id : 106) from employee(parent\referenced) table
-- check for record (with mgr_id:106) in branch(child\referencing) table . It would 
-- have automatically set to null


-- ***********************On DELETE CASCADE*******************************
-- On DELETE CASCADE
-- Use the ON DELETE CASCADE option to specify whether you want rows deleted in a child table 
-- when corresponding rows are deleted in the parent table.
-- CREATE TABLE works_with (
--   emp_id INT,
--   client_id INT,
--   total_sales INT,
--   PRIMARY KEY(emp_id, client_id),
--   FOREIGN KEY(emp_id) REFERENCES employee(emp_id) ON DELETE CASCADE,
--   FOREIGN KEY(client_id) REFERENCES client(client_id) ON DELETE CASCADE
-- );

-- Delete a rows\records (with client_id : 403) from client(parent\referenced) table
-- check for rows\records (with client_id:403) in works_with(child\referencing) table . Sql Engine would 
-- have automatically deleted all rows\records involving client_id =403

-- ***********************ON DELETE RESTRICT*******************************
-- ON DELETE RESTRICT. Specifies that the row in the parent table cannot be deleted if there are 
-- other rows(child table) depends on it. 
-- CREATE TABLE Parent (
--     id INT PRIMARY KEY
-- );

-- CREATE TABLE Child (
--     id INT PRIMARY KEY,
--     parent_id INT,
--     FOREIGN KEY (parent_id) REFERENCES Parent(id) ON DELETE RESTRICT
-- );
-- In this scenario, if you try to delete a row from the Parent table that still has associated rows 
-- in the Child table, the deletion will be restricted and an error will be thrown.So rows in child table 
-- should be deleted first and then the corresponding rows in the parent table.

-- Try Deleting a record  from parent(parent\referenced) table
-- SQL engine will not allow to delete row\records in parent table as there are dependent rows\records in child table.

-- ***************************Triggers ***************************************
-- Triggers

-- A trigger in MySQL is a set of SQL statements that automatically 
-- "fires" or executes when a certain event occurs on a table. 
-- These events can be INSERT, UPDATE, or DELETE operations on the 
-- table. Triggers are often used to enforce business rules, 
-- maintain data integrity, or automate tasks based on changes to the 
-- data.

-- Delimiters
-- In MySQL, delimiters are used to specify the boundary\end between different SQL statements
--  By default, MySQL uses the semicolon (;) as delimiter 
-- To handle this, MySQL allows you to temporarily change the statement delimiter using the 
-- DELIMITER command. This allows you to use semicolons within your triggers without causing 
-- syntax errors.

-- New 
-- In MySQL triggers, the NEW keyword is used to refer to the newly inserted or updated row in 
-- the table for which the trigger is activated. It allows you to access the values of columns in 
-- the row being affected by the trigger.
--  Additionally, in DELETE triggers, you can use OLD instead of NEW to refer to the row being deleted.

-- syntax 
-- CREATE TRIGGER trigger_name
-- {BEFORE | AFTER} {INSERT | UPDATE | DELETE} ON table_name
-- FOR EACH ROW
-- BEGIN
--    -- trigger body
-- 	  -- this code is applied to every
-- 	  -- inserted/updated/deleted row

-- END;

CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10, 2)
);

CREATE TABLE order_logs (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    log_message VARCHAR(255),
    log_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create the trigger
DELIMITER //
CREATE TRIGGER after_insert_order3
AFTER INSERT ON orders
FOR EACH ROW
BEGIN
    INSERT INTO order_logs (order_id, log_message)
    VALUES (NEW.order_id, CONCAT('New order created with ID: ', 
    NEW.order_id));
END;
//
DELIMITER ;


INSERT INTO orders (customer_id, order_date, total_amount)
VALUES (200, '2024-03-18', 100.00);

-- ***************************** Trigger Assignment *****************
-- Create a trigger on employee table(existing table from company database) 
-- after new record(insert) such that employee_log table has new records
-- Employee_log(id, emp_id, log_message,log_date)
-- Where id is auto_increment field  and 
-- log_message  format :  New Employee created with firstname: xxxxxx
-- log_date DEFAULT CURRENT_TIMESTAMP


CREATE TABLE employee_logs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    emp_id INT,
    log_message VARCHAR(255),
    log_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create the trigger
DELIMITER //
CREATE TRIGGER after_insert_employee
AFTER INSERT ON employee
FOR EACH ROW
BEGIN
    INSERT INTO employee_logs (id, emp_id , log_message)
    VALUES (NEW.emp_id, CONCAT('New Employee created with id: ', 
    NEW.emp_id));
END;
//
DELIMITER ;

INSERT INTO prodapt1.employee2(emp_id,first_name,last_name) 
VALUES(1, "Prodapt","solutions");
























