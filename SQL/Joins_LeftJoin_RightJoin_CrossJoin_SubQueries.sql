--  Join
select branch.* , client.*
from branch  cross join client ; 

-- JOIN(or INNER Join): Returns rows when there is at least 
-- one match in both tables.
-- SELECT *
-- FROM table1
-- INNER JOIN table2 ON table1.column_name = table2.column_name;


-- LEFT JOIN (or LEFT OUTER JOIN): Returns all rows 
-- from the left table, and the matched rows from the 
-- right table. If there is no match, the result is NULL 
-- on the right side.
-- SELECT *
-- FROM table1
-- LEFT JOIN table2 ON table1.column_name = table2.column_name;


-- RIGHT JOIN (or RIGHT OUTER JOIN): Returns all rows from 
-- the right table, and the matched rows from the left table. 
-- If there is no match, the result is NULL on the left side.
-- SELECT *
-- FROM table1
-- RIGHT JOIN table2 ON table1.column_name = table2.column_name;


-- CROSS JOIN: Returns the Cartesian product of the two tables, 
-- meaning it returns all possible combinations of rows from the two tables.[no condition]
-- SELECT *
-- FROM table1
-- CROSS JOIN table2;
-- Example products in table1 and size defintion in table2

-- 	Find the firstname , lastname and address of the 
-- staff name Mike --->use sakila database(staff, address table)

select staff.first_name, last_name, address from staff join 
address on address.address_id = staff.address_id where 
staff.first_name = "Mike";

-- Subqueries
-- Subqueries, also known as nested queries or 
-- inner queries, are queries nested within another SQL query. 
-- They can be used in various parts of a SQL statement such 
-- as SELECT, FROM, WHERE, HAVING, and so on. Subqueries are 
-- enclosed within parentheses and can return a single value, 
-- a single row, multiple rows, or a result set.

-- Approach towards subqueries understand problem statment . 
-- break into small small requirements . Frame sql\query for 
-- each requirement.substitute query in the place of values. 

-- Subqueries in SELECT statements
-- SELECT column1, (SELECT MAX(column2) FROM table2) AS max_value
-- FROM table1;

-- Subqueries in FROM clauses:
-- SELECT *
-- FROM (SELECT column1, column2 FROM table1) AS subquery_result
-- WHERE column1 > 10;

-- Subqueries in WHERE clauses:
-- SELECT *
-- FROM table1
-- WHERE column1 IN (SELECT column2 FROM table2 WHERE condition);

-- Subqueries in INSERT statements:
-- INSERT INTO table1 (column1, column2)
-- SELECT column3, column4 FROM table2 WHERE condition;

-- Subqueries in UPDATE statements:
-- UPDATE table1
-- SET column1 = (SELECT column2 FROM table2 WHERE condition)
-- WHERE condition;

-- Subqueries in HAVING clauses
-- SELECT column1, COUNT(*) AS count
-- FROM table1
-- GROUP BY column1
-- HAVING count > (SELECT AVG(count) FROM (SELECT COUNT(*) AS count FROM table1 GROUP BY column1) AS subquery);

-- Find names of all employees who have sold over 50,000
-- select emp_id from works_with where total_sales> 50000  --105,102
-- select * from employee where emp_id in (102,105)
-- frame subquery 
select * from employee where emp_id in 
(select emp_id from works_with where total_sales> 50000);

-- Find all clients who are handles by the branch that Michael Scott manages
-- Assume you know Michael's ID (102)
-- select branch_id from employee where emp_id =102; --2
-- select * from client where branch_id =2 
-- frame subquery 
select * from client where branch_id = 
(select branch_id from employee where emp_id = 102);

-- Find the names of employees who work with clients handled by the scranton branch
-- branch_id of scranton branch(branch table)
-- client_id based on branch_id(client table)
-- emp_id based on the clientid(works_with table)
-- first_name, last_name based on empid(employee table)

-- select branch_id from branch where branch_name = 'scranton'; -- 2
-- select client_id from client where branch_id = 2;-- 400,401,404,406,407
-- select emp_id from works_with where client_id in (400,401,404,406,407);-- 105,102
-- select first_name , last_name from employee where emp_id in (105,102);
-- frame subquery 
select first_name , last_name from employee where emp_id in 
(select emp_id from works_with where client_id in 
(select client_id from client where branch_id = 
(select branch_id from branch where branch_name = 'scranton')));


 

















