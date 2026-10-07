-- If there have same name table then drop this table  
drop table if exists teacherTwo;

-- create table
create table teacherTwo (

id serial primary key,
teacher_name varchar(100) not null,
course_name varchar(150) not null,
duration_month int not null,
seat int not null,
created_at timestamptz default now() 
);

-- insert data into table 
insert into teacherTwo(teacher_name,course_name,duration_month,seat)

values 
('shahadat','english',24,55),
('hossain','bangla',24,55),
('gazi','math',24,55),
('fake','fake',24,55);

-- update table data
update teacherTwo 
set course_name = 'ict'
where id =2;

-- delete table data
delete from teacherTwo
where id=7;

-- see full table
select * from teacherTwo

----------------------------
----------------------------

-- create another table
create table student (

student_id serial primary key ,
name varchar (50),
age int,
course varchar (100),
gpa numeric(3,2)
);

-- insert data
insert into student(name,age,course,gpa)
values
('ridi',10,'ml'),
('raha',14,'dl',3.75),
('marium',8,'data analysis',3.95),
('afnan',17,'agentic ai',3.80),
('zum',18,'django',3.95),
('risty',19,'ds'),
('rojina',16,'django',3.60),
('roji',16,'django',3.60),
('raita',12,'python',3.90);

-- where (if want to check any spefic thing using conditation)
select *from student where gpa >3.50;

-- order by ASC (sorted in acending order)
select *from student order by age asc;

-- order by DESC (sorted in desending order)
select *from student order by age desc;

-- Distinct (show only one time if avliable multiple times)
select distinct course from student;

-- limit (only show two row)
select *from student limit 2; 

-- like (starting with r name only)
select *from student where name like 'r%' ;


-- see table 
select * from student ;

-------------------------------
--Relational
-------------------------------

-- equal 

select *from student 
where course = 'django';

-- Grater Then

select *from student 
where age > 10;

-- Grater Then equal

select *from student 
where age >= 10;

-- less Then

select *from student 
where age < 10;

-- less Then

select *from student 
where age <= 10;

-------------------------------
--logical operation
-------------------------------

-- and
select *from student 
where name = 'roji' 
and age = 16

-- or
select *from student 
where name = 'roji' 
or age >=10

-- not
select *from student 
where not name = 'roji'

-------------------------------
--special operator
-------------------------------

-- between
select *from student 
where age between 10 and 12

-- in
select *from student 
where course in ('django','ml')

-- null
select *from student 
where gpa is null

-- not null 
select *from student 
where gpa is not null 

-- sum
select sum(age) as sum_age from student

-- count
select count(*) as total_student from student 

-- avg
select avg(age) as avg_age from student

-- max
select max(age) as max_age from student

-- min
select min(age) as min_age from student

-- round
select round(avg(age),3) from student

-- group by
select course,count(*)as student_count, round(avg(gpa),2) as avg_gpa
from student
group by course 

-- having
select course,count(*) as student_cont, round(avg(gpa),2)
from student group by course
having avg(gpa) >=3.80

---------------------------------
---------------------------------

-- concat
select concat(name, ' cgpa is ',gpa) as student_gpa
from student

-- upper and lower
select name,
upper(name) as upper_name,
lower(name) as lower_name
from student

-- LENGTH
select name , course ,
length (name) as student_name_length,
length(course) as course_length
from student

-- substring
select name ,
substring (name,1,3) as first3_charctare
from student

-- replace
select name ,
replace (course, 'django','django master')
from student
where course = 'django'

-- trim
select

'   shahdat   ' as main_name,
trim('   shahdat   ') as middle_name,
ltrim('   shahdat   ') as left_trim,
rtrim('   shahdat   ') as right_trim

------------------------------------------------
------------------------------------------------

-- calumn add
alter table student 
 add column email varchar(100)
 
 select * from student

-- drop column 
alter table student
drop column email

-- rename column 

alter table student
rename column name to full_name
-- aggin back to real name 
alter table student
rename column full_name to name

 select * from student


 -- rename table
alter table student
rename to stu 
-- aggin back to real name 
alter table stu
rename to student


 -- check constraint

 alter table student
 add constraint chk_age
 check (age>=5 and age<=25)

 alter table student
 add constraint chk_cgpa
 check (gpa>=0 and gpa<=4.00)

 ---------------------------------------
 -- Relational Data Base
 ---------------------------------------
 
CREATE TABLE student_info (
    name VARCHAR(50),
    course VARCHAR(50),
    teacher VARCHAR(50)
);

-- Data insert
INSERT INTO student_info VALUES
('Roji', 'Django', 'Mr. Noman'),
('Raita', 'Django', 'Mr. Noman'),
('Ridi', 'Django', 'Mr. Noman'),
('Marium', 'Python', 'Azizul'),
('Afnan', 'Python', 'Azizul');

-- data read
SELECT * FROM student_info;

-------------------------------------------------------------------------------------------
-- Courses table
CREATE TABLE courses (
    course_id SERIAL PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    teacher VARCHAR(50) NOT NULL
);

-- Courses insert data
INSERT INTO courses (course_name, teacher) VALUES
('Django', 'Mr. Noman'),
('Python', 'Azizul');

-- Data
SELECT * FROM courses;

----------------------------
-- another table
----------------------------

-- Students table
CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    course_id INT,
  foreign key (course_id) references courses(course_id) -- foregin key
);

INSERT INTO students (name, course_id) VALUES
('Roji', 1),    -- Django course
('Raita', 1),   -- Django course
('Ridi', 1),    -- Django course
('Marium', 2),  -- Python course
('Afnan', 2);   -- Python course

-- Data
SELECT * FROM students;

----------------------------
-- one to one relationship 
----------------------------

--parent table
create table student_1to1(
student_id serial primary key,
name varchar (100) not null,
email varchar(100)
);

insert into student_1to1 (name,email)
values
('roji','roji@gmail.com'),
('raita','raita@gmail.com'),
('marium','mairum@gmail.com')

select * from student_1to1

--child table
create table student_p(

profile_id serial primary key,
student_id int unique not null,
bio text,
linkedine varchar (100),
github varchar (100),
foreign key (student_id) references student_1to1(student_id) on delete cascade
)

-- Profiles insert
INSERT INTO student_p (student_id, bio, linkedine, github) VALUES
(1, 'Django enthusiast, loves backend development', 'linkedin.com/in/roji', 'github.com/roji'),
(2, 'Python developer, data science lover', 'linkedin.com/in/raita', 'github.com/raita'),
(3, 'ML engineer, working on AI projects', 'linkedin.com/in/marium', 'github.com/marium');

-- Data
SELECT * FROM student_p;


----------------------------
-- one to many relationship 
----------------------------

select * from courses

select * from students where course_id = 1
 
-------------------------------
-- many to many  relationship 
-------------------------------

create table student_course (

student_id int,
course_id int
);

insert into student_course values (1,1);
insert into student_course values(1,2);
insert into student_course values (2,1);

select *from student_course where student_id =1 
-----------------------------------------------------------------------------------------
-- Courses table
CREATE TABLE courses (
    course_id SERIAL PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    teacher VARCHAR(50) NOT NULL
);

-- Courses insert data
INSERT INTO courses (course_name, teacher) VALUES
('ml','shahadat'),
('Django', 'Mr. Noman'),
('Python', 'Azizul');

-- Data
SELECT * FROM courses;

----
-- Students table
CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    course_id INT,
    FOREIGN KEY (course_id) REFERENCES courses(course_id) -- FK constraint
);

INSERT INTO students (name, course_id) VALUES
('gazi','null' ), 
('Roji', 1),    -- Django course
('Raita', 1),   -- Django course
('Ridi', 1),    -- Django course
('Marium', 2),  -- Python course
('Afnan', 2);   -- Python course

-- Data
SELECT * FROM students;

----------------------------------
-- inner join
----------------------------------
select s.name,c.course_name,c.teacher
from students s
inner join courses c
on s.course_id=c.course_id

----------------------------------
-- left join
----------------------------------

select s.name,c.course_name
from students s
left join courses c
on s.course_id=c.course_id

----------------------------------
-- right join
----------------------------------

select s.name,c.course_name
from students s
right join courses c
on s.course_id=c.course_id

----------------------------------
-- outer join
----------------------------------

 select s.name as studnet_name, c. course_name
 from students s
 full outer join courses c
 on s.course_id=c.course_id
 where c.course_id is null or s.student_id is null

----------------------------------
-- self join
----------------------------------

-- create a new table for self join
create table employees (

emp_id serial primary key,
emp_name varchar(50),
manager_id int
)

insert into employees (emp_id,emp_name,manager_id)
values
(1,'abdur rahim',null),
(2,'abdul karim',1),
(3,'marium',1),
(4,'afnan',2)

select * from employees

select e.emp_name, em.emp_name as manager
from employees e
left join employees em
on e.manager_id = em. emp_id

----------------------------------
-- cross join
----------------------------------

insert into students (name,course_id)
values
('rifaida',null)

select c.course_name,s.name as student_name
from courses c
cross join students s
order by c.course_name,s.name

--for check cross join is working or not 
select 
(select count (*) from courses) as total_courses,
(select count (*) from students) as total_students,
(select count (*) from courses) * (select count (*) from students) as expected_rows

----------------------------------
-- multiple table join
----------------------------------

-- create a new table 
CREATE TABLE student_course (
    student_id INT REFERENCES students(student_id) ON DELETE CASCADE,
    course_id INT REFERENCES courses(course_id) ON DELETE CASCADE,
    PRIMARY KEY (student_id, course_id)
);


INSERT INTO student_course (student_id, course_id) VALUES
(1, 1), 
(1, 2),
(2, 2), 
(3, 3); 

select * from student_course 

select 
s.name as student_name,
c.course_name,
c.teacher

from students s
join student_course sc
on s.student_id=sc.student_id
join courses c
on c.course_id=sc.course_id
order by s.name,c.course_name

--count how many courses each student is enrolled in
select 
s.name,
count (c.course_id) as total_courses
from students s
join student_course sc 
on s.student_id=sc.student_id
join courses c 
on sc.course_id = c.course_id
group by s.name
order by total_courses desc
