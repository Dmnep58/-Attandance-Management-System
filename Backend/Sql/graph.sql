
--top 3 course
SELECT c.course_name, COUNT(se.student_id) AS student_count
FROM course c
JOIN studentenrollment se ON c.course_id = se.course_id
GROUP BY c.course_name
ORDER BY student_count DESC
LIMIT 3;



--top 3 batch
SELECT batch, COUNT(student_id) AS student_count
FROM studentenrollment
GROUP BY batch
ORDER BY student_count DESC
LIMIT 3;
