/* 1. verification */
Select * from registration where uid = ? and password = ? ;

/* after verification */
Select * from registration where uid = ? ;

/* update registration password */
UPDATE registration
SET password = ? WHERE uid = ?;


/* update image */
UPDATE registration
SET image=? where uid=? ;