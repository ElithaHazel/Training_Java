create database prodapt;
show databases;
-- drop database prodapt;
create table  student(
student_id int primary key,
name varchar(20)  not null unique,
major varchar(20));

show tables;
-- Modifying table -> add column
alter table student add gpa decimal(3,2);

-- Modifying table -> remove column
alter table student drop gpa;

-- alter table student add constraint name not null; 
-- Full Record insertion:
insert into student values(1,'Jack','Biology');

-- Partial Record insertion:
insert into student(student_id,name) values(3,'Charlie');

-- Read from table:
select * from student;

-- To add constraint to column
alter table student add constraint unique(major);
-- Violating the constraint. 
insert into student values(4,'Raj','Biology');
-- To drop constraint to column
alter table student drop constraint unique(major);
-- Default value: 
alter table student modify column major varchar(20) default 'CSE';
insert into student(student_id,name) values(5,'Preethi');

desc student;

-- truncate table student;
select *  from student;

-- Modyfying table -> modify column[DataType,default value,constraint]
alter table student modify column name varchar(20) unique not null;
alter table student modify column student_id int auto_increment;
-- auto increment will work for primary key. without giving the value it incremets 
-- according to previous value.

insert into student values (1,'Jack','Biology');
insert into student values (2,'Kate','Sociology');
insert into student values (3,'Raj','English');
insert into student values (4,'Philip','Biology');
insert into student values (5,'Mike','Comp Science');
-- by auto-increment 
insert into student(name) values ('Ramya');
insert into student(student_id,name) values (309,'Keerthi');
-- by auto-increment its takes the previous value
insert into student(name) values ('Raju');

update student set major='bio' where major='Biology';

-- you are using safe upadte mode and you try to upadte the table it throws error use this
SET SQL_SAFE_UPDATES=0;
update student set major='bio' where major='Biology';
update student set major='bio';

update student set major='AI and ML' where student_id=5;

-- applied changes in the table data
select * from student;

update student set major='IT' where major='Biology' or major='Sociology';

update student set major='Data Science' where student_id in (3,4);

update student set major='CSBS' where student_id=6 and major='Comp Science';

delete from student where student_id=309;




