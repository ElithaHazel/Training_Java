-- Company DataBase 
use prodapt;
create table employee(
emp_id int primary key,
first_name varchar(40),
last_name varchar(40),
birth_day Date,
sex varchar(1),
salary int,
super_id int,
branch_id int);

create table branch(
branch_id int primary key,
branch_name varchar(40),
mgr_id int,
mgr_start_date Date,
foreign key(mgr_id) references employee(emp_id) on delete set null);

alter table employee add foreign key(branch_id) references branch(branch_id) on delete set null;
alter table employee add foreign key(super_id) references employee(emp_id) on delete set null;

create table client(
client_id int primary key,
client_name varchar(40),
branch_id int,
foreign key(branch_id) references branch(branch_id) on delete set null);

create table works_with(
emp_id int,
client_id int,
total_sales int,
primary key(emp_id,client_id),
foreign key(emp_id) references employee(emp_id) on delete cascade,
foreign key(client_id) references client(client_id) on delete cascade);

create table branch_supplier(
branch_id int,
supplier_name varchar(40),
supply_type varchar(40),
primary key(branch_id,supplier_name),
foreign key(branch_id) references branch(branch_id) on delete cascade);
-- id=100 
insert into employee values(100,'David','Wallace','1967-11-17','M',250000,NULL,NULL);
insert into branch values(1,'Corporate',100,'2006-02-09');
update employee set branch_id=1 where emp_id=100;
-- id=101
insert into employee values(101,'Jan','Levinson','1961-05-11','F',110000,100,1);
-- id=102
insert into employee values(102,'Michael','Scott','1964-03-15','M',75000,100,NULL);
insert into branch values(2,'Scranton',102,'1992-04-06');
update employee set branch_id=2 where emp_id=102;
-- id=103 to 105
insert into employee values(103,'Angela','Martin','1971-06-25','F',63000,102,2);
insert into employee values(104,'Kelly','Kapoor','1980-02-05','F',55000,102,2);
INSERT INTO employee VALUES(105, 'Stanley', 'Hudson', '1958-02-19', 'M', 69000, 102, 2); 
-- Stamford 
INSERT INTO employee VALUES(106, 'Josh', 'Porter', '1969-09-05', 'M', 78000, 100, NULL); 
INSERT INTO branch VALUES(3, 'Stamford', 106, '1998-02-13'); 
INSERT INTO branch VALUES(4,'IT', Null, Null); 
UPDATE employee SET branch_id = 3 WHERE emp_id = 106; 
INSERT INTO employee VALUES(107, 'Andy', 'Bernard', '1973-07-22','M', 65000, 106, 3); 
INSERT INTO employee VALUES(108, 'Jim', 'Halpert', '1978-10-01', 'M', 71000, 106, 3); 

-- CLIENT 
INSERT INTO client VALUES(400, 'Dunmore Highschool', 2); 
INSERT INTO client VALUES(401, 'Lackawana Country', 2); 
INSERT INTO client VALUES(402, 'FedEx', 3); 
INSERT INTO client VALUES(403, 'John Daly Law, LLC', 3); 
INSERT INTO client VALUES(404, 'Scranton Whitepages', 2); 
INSERT INTO client VALUES(405, 'Times Newspaper', 3); 
INSERT INTO client VALUES(406, 'FedEx', 2); 

-- WORKS_WITH 
INSERT INTO works_with VALUES(105, 400, 55000); 
INSERT INTO works_with VALUES(102, 401, 267000); 
INSERT INTO works_with VALUES(108, 402, 22500); 
INSERT INTO works_with VALUES(107, 403, 5000); 
INSERT INTO works_with VALUES(108, 403, 12000); 
INSERT INTO works_with VALUES(105, 404, 33000); 
INSERT INTO works_with VALUES(107, 405, 26000); 
INSERT INTO works_with VALUES(102, 406, 15000); 
INSERT INTO works_with VALUES(105, 406, 130000);

-- BRANCH SUPPLIER 
INSERT INTO branch_supplier VALUES(2, 'Hammer Mill', 'Paper'); 
INSERT INTO branch_supplier VALUES(2, 'Uni-ball', 'Writing Utensils'); 
INSERT INTO branch_supplier VALUES(3, 'Patriot Paper', 'Paper'); 
INSERT INTO branch_supplier VALUES(2, 'J.T. Forms & Labels', 'Custom Forms'); 
INSERT INTO branch_supplier VALUES(3, 'Uni-ball', 'Writing Utensils'); 
INSERT INTO branch_supplier VALUES(3, 'Hammer Mill', 'Paper'); 
INSERT INTO branch_supplier VALUES(3, 'Stamford Lables', 'Custom Forms'); 

select * from employee;
select * from branch;
select * from client;
select * from works_with;
select * from branch_supplier;

-- Problem statements for above tables:
select * from employee order by salary asc;

-- find all employees ordered by sex then name;
select * from employee order by sex,first_name;

-- find the first 5 employees in the table:
select * from employee limit 5; 

-- find the last 5 employees in the table:
select * from employee order by emp_id desc limit 5;

-- find first name and last name of all employees alias name "surname " for last name
select first_name,last_name as surname from employee;

-- find out all the differnt genders:
select distinct sex from employee;

-- find all male employees:
select * from employee where sex='M';

-- find all the employees at branch 2:
select * from employee where branch_id=2; 

-- find all the employee id and names who were born after 1969 :
select emp_id,first_name from employee where birth_day >= '1970-01-01';
select emp_id,first_name from employee where birth_day like '197%' or birth_day like '198%';

-- find all the female employees of Scranton branch i.e,branch_id=2 :
select * from employee where sex='F' and branch_id=2;

-- find all the employees who are female & born after 1969 or who make over 80000:
select * from employee where (sex='F' and birth_day > '1970-01-01') or salary>80000;

-- find all employees born b/w 1970 and 1975:
select * from employee where birth_day between '1970-01-01' and '1975-12-31';

-- find all employees named Jim,Michael,Josh or David: 
-- select * from employee where first_name='Jim' or first_name='Michael' or first_name='Josh' or first_name='David';
select * from employee where first_name in ('Jim','Michael','Josh','David');

-- 13th March --  
use prodapt;

-- find the number of employees:
select count(*) from employee ;

-- find the average salary of employees:
select avg(salary) from employee; 

-- find the total of all employee's salaries:
select sum(salary) from employee;

-- find out how many males and female employees are there:
-- select count(*) from employee where sex='M';
-- select count(*) from employee where sex='F';
select sex,count(*) from employee group by sex;

-- Group By Syntax:
-- SELECT column1,column2,aggregate_function(column) FROM 
-- table_name GROUP BY column1,column2 HAVING condition;
-- try group by
select super_id,count(*) from employee group by super_id;
select branch_id,count(*) from employee group by branch_id;

select super_id as SupervisorID,count(*) from employee where super_id>100 group by super_id ;
-- also by using having clause:
select super_id as SupervisorID,count(*) from employee group by super_id having super_id>100 ;
select super_id as SupervisorID,count(*) from employee group by super_id having count(*) >= 3 ;

-- no.of employees in each branch along with branch_id with alias name as totalEmployeesInThisBranch 
select branch_id,count(*)  as totalEmployeesInThisBranch from employee group by branch_id ;

-- find the total sales of each client 
select client_id,sum(total_sales) from works_with group by client_id;
-- to get data from other table also:
select client_id,(select client_name from client where client.client_id=works_with.client_id) 
as Client_Name,sum(total_sales) from works_with group by client_id;

-- find the total amount of money spent by each client: 
-- problem statement is different but ans is same i.e, same query 
select client_id,sum(total_sales) as TotalAmountSpentByClient from works_with group by client_id;

-- List all clients starting with 'FedEx':
select * from client where client_name like 'FedEx%'; 

-- List all the suppliers whose name has alphabets 'am':
select supplier_name from branch_supplier where supplier_name like '%am%';

-- Find the employees born on 5th day of the month:
select * from employee where birth_day like '%05';

-- General Date Format in SQL -> 'YYYY-MM-DD' :
-- Find the employees born on 10th month:
select * from employee where birth_day like '____-10-__';
-- other ways using 'month'
select * from employee where month(birth_day)=10;
-- using 'substring(column_name,start,length)=required_string' :
select * from employee where substring(birth_day,6,2)='10';

-- find any clients who are schools :
select * from client where client_name like '%school%' ;
select * from client where client_name like '%School%' ;
-- both School and school are same ie, sql is not case-sensitive  

-- UNION 
-- to combine the result sets of two or more select stmts into a single result set.
-- in union the no.of columns must be same 
-- UNION Opeatoe->it removes the duplications from the rows where as
-- UNION ALL Operator -> it retains duplicate rows too 
select first_name from employee union select branch_name from branch; 

-- find a list of all clients & branch supppliers names 
select client_name as thirdParties from client union select supplier_name from branch_supplier;

-- JOINS
-- Joins are used to combine rows from two or more 
select emp_id,first_name,last_name,branch_name from employee inner join 
branch on employee.branch_id=branch.branch_id;

-- Using sakila DB 
-- find the first_name,last_name,address of all the staff using sakila DB(staff,address table):
select address.address_id,first_name,last_name,address from staff join 
address on staff.address_id=address.address_id;
-- can also write as:
select a.address_id,first_name,last_name,address from staff as s join
address as a on s.address_id=a.address_id;

use prodapt;
-- get the details of the manager
select b.branch_id,e.emp_id,e.first_name,e.last_name,e.birth_day from employee as e join 
branch as b on e.emp_id=b.mgr_id;

-- get the branch detail of the client named 'Times newspaper' 
select b.* from branch as b join client as c on b.branch_id=c.branch_id 
where client_name='Times Newspaper';
select branch.*,client_name from branch join client on branch.branch_id=client.branch_id
where client_name like'Times Newspaper';
-- ( branch.* ) to get all details of only branch table!

-- ******************NOTE : Join and Inner Join are almost same!!**********************************

-- Left Join 
select branch.*,client.* from branch left join client on branch.branch_id=client.branch_id;

-- Right Join 
select branch.*,client.* from branch right join client on branch.branch_id=client.branch_id;

-- Cross Join ( X ) :
-- in cross join we don't give any condition of matching 1 column
-- Ex: if 1st table has 4 records & 2nd table has 2 records then cross join table has 4*2=8 RECORDS:
select branch.*,client.* from branch join client;

-- Find the firstname,lastname and address of the staff name Mike(sakila DB)
use sakila;
select s.first_name,s.last_name ,a.address from staff as s join address as a on 
s.address_id=a.address_id where first_name='Mike';

-- Find names of all employees who have sold over 50,000
-- select e.emp_id,e.first_name,e.last_name,w.total_sales from employee as e join 
-- works_with as w on e.emp_id=w.emp_id where total_sales>50000;

-- select e.*,w.total_sales from employee as e join 
-- works_with as w on e.emp_id=w.emp_id where total_sales>50000;
select emp_id,sum(total_sales) from works_with group by emp_id;

select emp_id,sum(total_sales) from works_with group by emp_id having sum(total_sales)>50000;

select * from employee where emp_id in(select emp_id from works_with
group by emp_id having sum(total_sales)>50000);

-- ans
select emp_id from works_with where total_sales>50000;
select * from employee where emp_id in(select emp_id from works_with where total_sales>50000);

-- Subqueries in select stmt
-- Select col-1,( Select max(col-2) from table-2) AS max_val from table-1;

-- find all clients who are handled by the branch that Michael Scott manages
select branch_id from employee where first_name='Michael';
select * from client where branch_id in(select branch_id from employee where first_name='Michael');

-- find the names of employees who work with clients handled by the Scranton branch:
select branch_id from  branch where branch_name='Scranton';

select client_id,branch_id from client where branch_id=
(select branch_id from  branch where branch_name='Scranton');

select emp_id from works_with where client_id in (select client_id from client where branch_id=
(select branch_id from  branch where branch_name='Scranton'));

select emp_id,first_name,last_name from employee where emp_id in
(select emp_id from works_with where client_id in 
(select client_id from client where branch_id=
(select branch_id from  branch where branch_name='Scranton')));

-- ON DELETE SET NULL:
-- when data is deleted from parent table the related data in
-- child table is automatically set to null!!
-- deleted 102 id from employee table so all the data is set to null in branch table!
DELETE FROM prodapt.employee WHERE (`emp_id` = '102');
SELECT * FROM prodapt.branch;
SELECT * FROM prodapt.employee;

-- ON DELETE CASCADE: 
-- If data is deleted from parent table automatically data is deleted from child table also!
-- Deleting client_id=400 details from client table then the related data is 
-- also deleted from works_with table.
DELETE FROM prodapt.client WHERE (`client_id` = '400');
SELECT * FROM prodapt.client;
SELECT * FROM prodapt.works_with;

--  ON DELETE RESTRICT:
-- If the child table data is present and try to delete the parent data then it throws error!
-- It's default one!


-- Triggers:
create table orders(
order_id int auto_increment primary key,
customer_id int,
order_date date,
total_amount decimal(10,2)
);
create table order_logs(
log_id int auto_increment primary key,
order_id int,
log_message varchar(255),
log_date timestamp default current_timestamp
);
-- create the trigger
delimiter //
create trigger after_insert_order 
after insert on orders
for each row
begin
insert into order_logs(order_id,log_message)
values(new.order_id,concat('New order created with ID: ',
new.order_id));
end;
//
insert into orders(customer_id,order_date,total_amount) values (1,'2024-03-18',100.00);

-- just tried:
delimiter @
create trigger before_insert_order 
before insert on orders
for each row
begin
insert into order_logs(order_id,log_message)
values(new.order_id,concat('New order created with ID: ',
new.order_id));
end;
@
insert into orders(customer_id,order_date,total_amount) values (2,'2024-03-18',200.00);
-- droping the trigger: 
USE `prodapt`;
DELIMITER $$
USE `prodapt`$$
DROP TRIGGER IF EXISTS `prodapt`.`before_insert_order` $$
DELIMITER ;
-- deleting the changes done:
delete from orders where order_id=2;
delete from order_logs where log_id in (2,3);

-- Creating  a trigger  for employee table after inserting the values!
SELECT * FROM prodapt.employee;

create table employee_log(
id int auto_increment primary key,
emp_id int,log_message varchar(200),
log_date timestamp default current_timestamp
);

delimiter &
create trigger after_insert_emp_details
after insert on employee
for each row
begin
insert into employee_log(emp_id,log_message)
values(new.emp_id,concat('New Employee created with first name: ',
new.first_name));
end;
&

insert into employee values(109,'Liza','Kenny','1975-12-05','F',85000,100,3);
insert into employee values(110,'Daniel','Joshua','1977-01-29','M',80000,106,3);
insert into employee values(111,'Anushka','Iytha','1976-03-30','F',78000,100,1);

update employee set branch_id=1 where emp_id=109;

select * from employee_log;
