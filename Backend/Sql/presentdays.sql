/* select the data where studentid,teacherid and batch relates to update presentdays*/

-- SELECT * FROM attendance AS a
-- INNER JOIN facultyenrollment AS f ON a.teacher_id = f.teacher_id
-- WHERE a.student_id = ? AND a.teacher_id = ? AND f.batch = ?;


-- -- updating present and total
-- UPDATE ATTENDANCE AS a
-- INNER JOIN facultyenrollment AS f ON a.teacher_id = f.teacher_id
-- SET a.present = ?, a.totaldays = ?
-- WHERE a.student_id = ? AND a.teacher_id = ? AND f.batch = ?;

-- Update totaldays for all rows where teacher_id and batch match
UPDATE ATTENDANCE AS a
INNER JOIN facultyenrollment AS f ON a.teacher_id = f.teacher_id
SET a.totaldays = a.totaldays + 1
WHERE a.teacher_id = ? AND f.batch = ?;


-- Update present days for the given student_id, teacher_id, and batch
UPDATE ATTENDANCE AS a
INNER JOIN facultyenrollment AS f ON a.teacher_id = f.teacher_id
SET a.present = a.present + 1
WHERE a.student_id = ? AND a.teacher_id = ? AND f.batch = ?;



