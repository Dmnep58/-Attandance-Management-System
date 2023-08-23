/*  admin table*/

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
	regno integer unique not null,
	phnno integer  unique not null,
	name varchar(20) not null,
	email varchar(50) not null,
	address varchar(50) not null,
	image varchar(50),
	primary key(uid)
);

/* attendance table */
create table  registration(
    uid  bigint  ,
	regno integer unique not null,
	phnno integer  unique not null,
	name varchar(20) not null,
	email varchar(50) not null,
	address varchar(50) not null,
	image varchar(50),
	primary key(uid)
);
