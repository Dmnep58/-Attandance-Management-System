-- fetch all the data from the attendance
SELECT * FROM attendance


-- insertion of a record in the attendance table 
insert into attendance(student_id,teacher_id,date,present_days,total_days,Status) 
VALUES(1908,75823,'2023-09-06 10:00:00',1,2,'Present');

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
WHERE se.branch = 'YourBranchName'
AND a.Date = 'YYYY-MM-DD'; 




/* reporting present or abscent  */
SELECT Date, Status
FROM attendance
WHERE Student_id = ?
AND Date =?;
