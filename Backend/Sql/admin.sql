/* login to the admin */

/* 1. verification */
Select * from admin where admin_id = ? and admin_password = ? ;

/* after verification */
Select * from admin where admin_id = ? ;

/* update admin password */
UPDATE admin
SET admin_password = ? WHERE admin_id = ?;


/* update image */
UPDATE admin
SET admin_image=? where admin_id=? ;