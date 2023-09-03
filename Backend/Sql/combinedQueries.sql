
-- inner join the table course and enrollment to find required fields.

SELECT
    course.course_name,
    enrollment.teacher_id   
FROM
    course
INNER JOIN
    enrollment
ON
    course.course_id = enrollment.course_id;