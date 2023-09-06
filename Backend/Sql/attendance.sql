
/* insert in to table attendance  */
INSERT INTO Attendance (Student_id, Date, Status)
VALUES (?,?,?,?,?,?); 



/* reporting present or abscent  */
SELECT Date, Status
FROM Attendance
WHERE Student_id = ?
AND Date =?;
