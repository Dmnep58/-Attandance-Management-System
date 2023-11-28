-- view all details in course table
SELECT * FROM course;

-- truncate the table
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



-- teacher id with course

select course_name from course 
inner join facultyenrollment on facultyenrollment.course_id = course.course_id
where facultyenrollment.teacher_id=2023;

--total active and inactive course
SELECT
    SUM(CASE WHEN CURRENT_DATE BETWEEN start_date AND end_date THEN 1 ELSE 0 END) AS active_courses,
    SUM(CASE WHEN CURRENT_DATE NOT BETWEEN start_date AND end_date THEN 1 ELSE 0 END) AS inactive_courses
FROM
    course;


    --total  active inactive and upcoming course
    WITH ActiveCourses AS (
    SELECT
        course_id,
        course_name,
        start_date,
        end_date
    FROM
        course
    WHERE
        start_date <= CURRENT_DATE
        AND end_date >= CURRENT_DATE
),
InactiveCourses AS (
    SELECT
        course_id,
        course_name,
        start_date,
        end_date
    FROM
        course
    WHERE
        end_date < CURRENT_DATE
),
UpcomingCourses AS (
    SELECT
        course_id,
        course_name,
        start_date,
        end_date
    FROM
        course
    WHERE
        start_date > CURRENT_DATE
)
SELECT
    (SELECT COUNT(*) FROM ActiveCourses) AS active_course_count,
    (SELECT COUNT(*) FROM InactiveCourses) AS inactive_course_count,
    (SELECT COUNT(*) FROM UpcomingCourses) AS upcoming_course_count;



-- fetch no of students in each course
SELECT course.course_name, COUNT(studentenrollment.student_id) FROM course JOIN studentenrollment  ON course.course_id = studentenrollment.course_id group by course.course_id;


-- fetch attendes
SELECT DISTINCT a.* FROM attendance a INNER JOIN studentenrollment se ON a.student_id = se.student_id INNER JOIN facultyenrollment fe ON se.batch = fe.batch WHERE a.teacher_id = 1 AND fe.batch = 'CS1';
