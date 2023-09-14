/* displaying all record */
select * from facultyenrollment;

select * from studentenrollment;

-- describe the tables
DESCRIBE facultyenrollment;
DESCRIBE studentenrollment;

-- Insert into student and faculty enrollment table
Insert into studentenrollment VALUES(? , ? , ?);
Insert into studentenrollment(course_id,student_id,batch) values (1002,4,'1-1002');

Insert into facultyerollment VALUES(? , ? , ?);
Insert into facultyenrollment(class_id,student_id,batch) values (1,1908,'Java1');

--insert into facultyenrollment
INSERT into facultyenrollment VALUES(1,51124);

--Total number of teacher enrolled in batch
<<<<<<< HEAD
select count(distinct(batch)) from facultyenrollment  where teacher_id=?
=======
select count(distinct(batch)) from facultyenrollment where teacher_id=20051958;
>>>>>>> f0ee58e9371e6aa829f57a77a2a7fa705a1771fa

--total number of students enrolled till now
select count(*) from registration where role='student'

--Fetch number of courses enrolled by the teacher
<<<<<<< HEAD
select count(distinct(course_id)) from facultyenrollment  where teacher_id=?

--fetch number of courses teacher enrolled in
select count(distinct(*)) from facultyenrollment where teacher_id = ?;
select count(distinct(*)) from facultyenrollment where teacher_id = 20051958;
=======
select count(distinct(course_id)) from facultyenrollment  where teacher_id=20051958;
>>>>>>> f0ee58e9371e6aa829f57a77a2a7fa705a1771fa
