
/* insert in to table attendance  */
INSERT INTO Attendance (Student_id, Date, Status)
VALUES (?,?,?); -- values(1,date,'present or abscent')



/* reporting present or abscent  */
SELECT Date, Status
FROM Attendance
WHERE Student_id = ?
AND Date BETWEEN start_date AND end_date;
