/*  admin table*/
create table admin(
admin_id BIGINT,
admin_password varchar(20) not null,
	admin_email varchar(50)not null,
	admin_address varchar(50) not null,
	admin_image varchar(50) not null,
	
	primary key(admin_id)
);
/* login to the admin */

/* 1. verification */
Select * from admin where admin_id = ? and admin_password = ? ;

/* after verification */
Select * from admin where admin_id = ? ;


/* update admin password */
alter table admin
set password=? where admin_id=? ;

/* update image */
alter table admin
update image=? where admin_id=? ;
/*  */



/*  to add student from admin panel */


/* to add teacher from the admin panel */





/* Student login */




/* Teacher Login */








