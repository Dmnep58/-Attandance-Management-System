/* admin table */
create table admin(
admin_id BIGINT,
admin_password varchar(20) not null,
	admin_email varchar(50)not null,
	admin_address varchar(50) not null,
	admin_image varchar(50) not null,
	
	primary key(admin_id)
);

/* registration table */
create table  registration(
    uid  bigint  ,
    password varchar(20),
	regno BIGINT unique not null,
	phnno BIGINT  unique not null,
	name varchar(20) not null,
	email varchar(50) not null,
	address varchar(50) not null,
	image varchar(50),
	roll varchar(20),
	primary key(uid)
);

/* attendance table */
create table attendance(
	attendance_date date,
	uid Bigint,
	present Bigint,
	absent Bigint,
	teacher_name varchar(100) ,
	foreign key(uid) references  registration(uid)
	);


-- to Drop the Tables
Drop TABLE admin;
DROP TABLE registration;
DROP Table attendance;