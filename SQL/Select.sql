select * from student2;

-- Read multiple columns . Order by clause for sorting
select name as fullname,major  from student2 order by name desc;
select name as fullname,major  from student2 order by name asc;


select * from student2 order by major, student_id;
select major, student_id , name  from student2 order by major, student_id;

-- Limit --top n records
select major, student_id , name  from student2 order by major, 
student_id limit 4;

-- where clause
select * from student2 where student_id >2;
select * from student2 where major = 'Data Science' 
and student_id in (3,5);

-- = >  <  >=  <=  <>  !=  
select * from student2 where name <> 'Jack';
select * from student2 where name != 'Jack';

-- keyword distinct remove duplicates
select  distinct major from student2;

-- wildcards
-- The percent sign (%) represents zero, one, or multiple characters
-- The underscore sign (_) represents one, single character
select * from student2 where major like 'Data Science%';
select * from student2 where major like 'Data Science_';

SELECT * FROM sakila.payment;

--  Aggregate Functions
select count(*) FROM sakila.payment;
select max(amount) FROM sakila.payment;
select min(amount) FROM sakila.payment;
select sum(amount) FROM sakila.payment;
select avg(amount) FROM sakila.payment;


-- between
select * from student2 where student_id between 3 and 6;





