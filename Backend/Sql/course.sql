-- view all details in course table
SELECT * FROM course;

--truncate the table
TRUNCATE table course;

-- data insertion in the table
INSERT into course values(?,?,?,?);


-- fetch data according to course_name
SELECT * FROM course where course_id = ?;


/* update course name  */
UPDATE course
SET course_name = ?, start_date=? , end_date=? WHERE course_id = ?;


---count no of course
SELECT COUNT(*) FROM course;


/* deleting rows from course id */
DELETE from course where course_id=? ;

-- Fetech all the batches
select batch from course;



----teacher id with course

select course_name from course 
inner join facultyenrollment on facultyenrollment.course_id = course.course_id
where facultyenrollment.teacher_id=2023;

--total active and inactive course
SELECT
    SUM(CASE WHEN CURRENT_DATE BETWEEN start_date AND end_date THEN 1 ELSE 0 END) AS active_courses,
    SUM(CASE WHEN CURRENT_DATE NOT BETWEEN start_date AND end_date THEN 1 ELSE 0 END) AS inactive_courses
FROM
    course;
