
--top 3 course
SELECT course_id, COUNT(student_id) AS student_count
FROM studentenrollment
GROUP BY course_id
ORDER BY student_count DESC
LIMIT 3;


--top 3 batch
SELECT batch, COUNT(student_id) AS student_count
FROM studentenrollment
GROUP BY batch
ORDER BY student_count DESC
LIMIT 3;
