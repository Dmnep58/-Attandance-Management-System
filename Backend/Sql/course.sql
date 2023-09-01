-- view all details in course table
SELECT * FROM course;


--truncate the table
TRUNCATE table course;

-- data insertion in the table
INSERT into course values(1 ,1 , 21 , 8 , 9 , 'Math' );


-- fetch data according to course_name
SELECT * FROM course where course_name = ?;


-- fetch no of people on the basis of the course_name
select count(*) from course where course_name=?;



/* update course name  */
UPDATE course
SET course_name = ? WHERE course_id = ?;






/* deleting rows from course id */
DELETE from course where course_id=? ;
