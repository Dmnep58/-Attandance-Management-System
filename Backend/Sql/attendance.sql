-- fetch all the data from the attendance
SELECT * FROM attendance

/* insert in to table attendance  */
INSERT INTO attendance
VALUES (?,?,?,?,?,?); 

-- insertion of a record in the attendance table 
insert into attendance(student_id,teacher_id,data,present_days,total_days,Status) 
VALUES();



/* reporting present or abscent  */
SELECT Date, Status
FROM attendance
WHERE Student_id = ?
AND Date =?;
