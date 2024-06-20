-- The GROUP BY statement groups rows that have the same values into summary rows, 
-- used with aggregate functions

-- HAVING: This clause is used to filter the groups that result from the 
-- GROUP BY clause based on specific conditions. It's similar to the WHERE clause, 
-- but whereas WHERE filters individual rows, HAVING filters groups of rows.

-- Syntax 
-- SELECT column1, column2, aggregate_function(column)
-- FROM table_name
-- GROUP BY column1, column2
-- HAVING condition;
-- Find out the no of male and female emplpyees
select count(*) from employee group by sex;

-- No of employee under each supervisor where the supervisor id is greater than 100
select super_id as SupervisorID, count(*) from employee group by super_id 
having super_id>100;
select super_id as SupervisorID, count(*) from employee 
where super_id>100 group by super_id;
-- No of employee under each supervisor and the minmum no of employee should be 3 
select super_id as SupervisorID, count(*) from employee 
group by super_id having count(*) >=3;

-- no of employees in each branch along with branchid 
-- with alias name as totalEmployeesInThisBranch
select branch_id, count(branch_id) 
as totalEmployeesInThisBranch from employee group by branch_id;

-- Find the total sales of each client
select client_id , sum(total_sales) from works_with group by client_id;

-- Find the total amount of money spent by each client
select client_id , sum(total_sales) from works_with group by client_id;

-- List all clients starting with 'Fedex'
select client_name from client where client_name like 'Fedex%';

-- list all supplier whose name as alphabets 'am' 
select supplier_name from branch_supplier where supplier_name like '%am%';

-- Find any employee born on the 10th month
select * from employee where birth_day like '____-10-__';
-- month()
select * from employee where month(birth_day)  = 10;
-- substring(colname, start,length)
select * from employee where substring(birth_day,6,2) ='10';

-- Find any clients who are schools
select * from client where client_name like '%school%';


-- UNION
-- To combine the result sets of two or more SELECT statements into a single result set. 
-- The UNION operator removes duplicate rows between the various SELECT statements whereas 
-- the UNION ALL operator retain duplicate rows too
select first_name from employee union select branch_name from branch;

-- Find a list of all clients & branch suppliers' names with alias 
select client_name as thirdParties from client 
union select supplier_name from branch_supplier;

-- Joins
-- joins are used to combine rows from two or more tables based on a related column between them. 
-- INNER JOIN\JOIN: Returns rows when there is at least one match in both tables.
select emp_id , first_name, last_name, branch_name from employee inner join branch 
on employee.branch_id = branch.branch_id;

-- Find the firstname , lastname and address of all the staff 
-- using sakila database (staff, address table)
use sakila;
select  a.address_id ,first_name, last_name , address  from staff as s
join address as a on s.address_id = a.address_id;

use prodapt1;
-- get the details of the manager
select e.emp_id,e.first_name, e.last_name , e.birth_day from employee e 
join branch b on e.emp_id = b.mgr_id;

-- get branch details of the client named "Times Newspaper"











