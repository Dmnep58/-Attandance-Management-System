/* displaying all record */
select * from facultyenrollment;

select * from studentenrollment;

-- describe the tables
DESCRIBE facultyenrollment;
DESCRIBE studentenrollment;

-- Insert into student and faculty enrollment table
Insert into studentenrollment VALUES(? , ? , ?);
Insert into studentenrollment(class_id,student_id,batch) values (1,1908,'Java1');

Insert into facultyerollment VALUES(? , ? , ?);
Insert into facultyenrollment(class_id,student_id,batch) values (1,1908,'Java1');

--insert into facultyenrollment
INSERT into facultyenrollment VALUES(1,51124);