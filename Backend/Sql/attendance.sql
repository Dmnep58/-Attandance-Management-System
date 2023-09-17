-- fetch all the data from the attendance
SELECT * FROM attendance


-- insertion of a record in the attendance table 
insert into attendance(student_id,teacher_id,present_days,total_days,Status,date) 
VALUES(1908,75823,1,2,'Present','2023-09-06');

-- Fetch Attendance data according date 
SELECT * from attendance where date=?;

--Fetch attendance data according faculty id
select * from attendance where teacher_id = ?

--Fetch Attendence data according faculty and batch 
SELECT DISTINCT a.*
FROM attendance a
INNER JOIN studentenrollment se ON a.student_id = se.student_id
INNER JOIN facultyenrollment fe ON se.batch = fe.batch
WHERE a.teacher_id = 2023 AND fe.batch = 'DBMS1';


/* reporting present or abscent  */
SELECT Date, Status
FROM attendance
WHERE Student_id = ?
AND Date =?;
