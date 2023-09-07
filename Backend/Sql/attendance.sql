-- fetch all the data from the attendance
SELECT * FROM attendance


-- insertion of a record in the attendance table 
insert into attendance(student_id,teacher_id,present_days,total_days,Status,date) 
VALUES(1908,75823,1,2,'Present','2023-09-06');

-- Fetch Attendance data according date 
SELECT * from attendance where date=?;


--Fetch Attendence data according batch
SELECT a.*, se.batch 
FROM attendance 
INNER JOIN studentenrollment se ON a.student_id = se.student_id 
WHERE se.batch = ?;


-- Fetch Attendance data according to batch and date
SELECT a.*, se.batch
FROM attendance a
INNER JOIN studentenrollment se ON a.student_id = se.student_id
WHERE se.batch = 'java1'
AND a.Date = 2023-09-22;




/* reporting present or abscent  */
SELECT Date, Status
FROM attendance
WHERE Student_id = ?
AND Date =?;
