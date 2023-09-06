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
	foreign key(uid) references  registration(uid) ON DELETE CASCADE
	);


	/* course table */
	create table course(
    course_id bigint primary key,
	start_date time,
	end_date time,
	batch varchar(20),
	course_name varchar(20)
		
	);



	/* class table */

 
	create table class(
		class_id bigint primary key,
		class_name varchar(20),
		teacher_id bigint ,
		course_id bigint,
		image varchar(50),
		start_time time,
		end_time time,
		foreign key(teacher_id) references registration(uid) ON DELETE CASCADE,
		foreign key (course_id) references course(course_id) ON DELETE CASCADE
		
	);

/* enrollment table */

create table enrollment(
    course_id bigint,
		teacher_id bigint,
		foreign key (course_id) references course(course_id),
		foreign key (teacher_id) references registration(uid)
	);
	
-- student enrollment table
create table studentenrollment(
	sn bigint auto_increment primary key,
	class_id bigint,
	student_id bigint,
	batch varchar(20),
	foreign key(class_id) references (class_id),
	foreign key(student_id) references registration (uid) on DELETE CASCADE  
);


/* DROP TABLE ATTENDANCE */

DROP TABLE ATTENDANCE;

/* NEW ATTENDANCE TABLE */
	CREATE TABLE Attendance (
    ID  int AUTO_INCREMENT PRIMARY KEY,
    Student_id bigint,
	teacher_id bigint,
    Date timestamp,
	present_days bigint,
	total_days bigint,
    Status ENUM('Present', 'Absent'),
	foreign key(student_id) references registration(uid),
	foreign key(teacher_id) references registration(uid)
);


-- to Drop the Tables
Drop TABLE admin;
DROP TABLE registration;
DROP Table attendance;
DROP Table course;
DROP Table class;
drop table enrollment;


