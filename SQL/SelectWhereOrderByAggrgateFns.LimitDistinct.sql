-- Find all employees
select * from employee;
-- Find all clients
select * from client;
-- Find all employees ordered by salary
select * from employee order by salary asc;
-- Find all employees ordered by sex then name
select * from employee order by sex , first_name;
-- Find the first 5 employees in the table
select * from employee limit 5;
-- Find the last 5 employees in the table
select * from employee order by emp_id desc limit 5;
-- Find the first and last names of all employees alias name "surname" for last_name
select first_name , last_name as surname from employee;
-- Find out all the different genders
select distinct sex from employee;
-- Find all male employees
select * from employee where sex= 'M';
-- Find all employees at branch 2
select * from employee where branch_id = 2;
-- Find all employee's id's and names who were born after 1969
select * from employee where birth_day >= '1970-01-01';
-- Find all female employees of branch_id = 2
select * from employee where branch_id = 2 and sex = 'F';
-- Find all employees who are female & born after 1969 or who make over 80000
select * from employee where (sex = 'F' and birth_day >= '1970-01-01') or salary > 80000;
-- Find all employees born between 1970 and 1975
select * from employee where birth_day between '1970-01-01' and '1975-12-31';
-- Find all employees named Jim, Michael, Josh or David
select * from employee where first_name in ('Jim', 'Michael', 'Josh' , 'David');
use prodapt1;
-- Find the number of employees
select count(emp_id) from employee;
-- Find the average salary of employee
select avg(salary) from employee;
-- Find the total of all employee's salaries
select sum(salary) from employee;








