-- view all details in registration table
SELECT * FROM registration;


--truncate the table
TRUNCATE table registration;    

-- data insetion in the table
INSERT into registration values(? ,? , ? , ? , ? , ? , ? , ?);


-- fetch data according to role
SELECT * FROM registration where role = 'Teacher';
SELECT * FROM registration where role = 'student';

-- fetch no of people on the basis of the role
select count(*) from registration where role='student';
select count(*) from registration where role='Teacher';

/* 1. verification */
Select * from registration where uid = ? and password = ? ;

/* after verification */
Select * from registration where uid = ? ;

-- insertion of data 
insert into registration values()
/* update registration password */
UPDATE registration
SET password = ? WHERE uid = ?;


-- update columns
alter table registration rename column roll to role;

/* update image */
UPDATE registration
SET image=? where uid=? ;


/* deleting rows from registration id */
DELETE from registration where uid=? ;

---updating teacher password

update registration
set password=?
where role='teacher';


