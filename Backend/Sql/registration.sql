-- view all details in registration table
SELECT * FROM registration;

-- data insetion in the table
INSERT into registration values(? ,? , ? , ? , ? , ? , ? , ?);

/* 1. verification */
Select * from registration where uid = ? and password = ? ;

/* after verification */
Select * from registration where uid = ? ;

-- insertion of data 
insert into registration values()
/* update registration password */
UPDATE registration
SET password = ? WHERE uid = ?;


/* update image */
UPDATE registration
SET image=? where uid=? ;