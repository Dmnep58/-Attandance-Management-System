-- fetch all the data from the attendance
SELECT * FROM attendance


-- insertion of a record in the attendance table 
insert into attendance(student_id,teacher_id,date,present_days,total_days,Status) 
VALUES(1908,75823,'2023-09-06 10:00:00',0,0,'Present');

-- Fetch Attendance data according date 
SELECT * from attendance where date=?;

-- Fetch Attendance data according to batch


/* reporting present or abscent  */
SELECT Date, Status
FROM attendance
WHERE Student_id = ?
AND Date =?;
