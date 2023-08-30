/* login to the admin */

-- fetch all data from admin
SELECT * from admin;


-- insert into table
insert into admin values(12,'p1','prahtamsharma12@gmail.com','ktm Nepal','admin2.png');

-- update table to insert column name
alter table admin add column phnno BIGINT;

-- insertion of names in the fields required
UPDATE  admin set phnno=9151172841 where admin_id=1234;

/* verification */
Select * from admin where admin_id = ? and admin_password = ? ;

/* after verification */
Select * from admin where admin_id = ? ;

/* update admin password */
UPDATE admin
SET admin_password = ? WHERE admin_id = ?;


/* update image */
UPDATE admin
SET admin_image=? where admin_id=? ;