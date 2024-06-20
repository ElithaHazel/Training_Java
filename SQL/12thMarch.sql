use prodapt;
select * from student;
select name from student;

-- To show the column name according to our wish using 'as'
select name as fullname,major from student;

-- Order by clause for sorting: 
-- To arrange the name in ascending order(both 10 and 11 are same)
select name, major from student order by name;
select name, major from student order by name asc;

-- To arrange the name in decending order
select name, major from student order by name desc;

select * from student order by major,student_id;
select major,student_id,name from student order by major,student_id;

-- To Limit the records->gives top n records:
select major,student_id,name from student order by major,student_id limit 4;

-- where clause
select * from student where student_id>2;
select * from student where major='Data Science' and student_id in (3,5);

-- not equal to symbol : '<>' or '!=' 
select * from student where name <> 'Jack';
select * from student where name != 'Jack';

-- to eliminate the repetation use -> distinct keyword
select distinct major from student;

-- pattern matching : wild card characters 
-- ( % ) -> represents zero,one or multiple characters.
-- ( _ ) -> represents one single character.
select * from student where major like 'Data Science%';
select * from student where major like 'I_';

-- To get the last 4 records:
select * from student order by student_id desc limit 4;

-- between clause:
select * from student where student_id between 5 and 400;

-- Aggrigate Functions: 
-- use sakila;
select count(*) from sakila.payment;
select max(amount) from sakila.payment;
select min(amount) from sakila.payment;
select sum(amount) from sakila.payment;
select avg(amount) from sakila.payment;





