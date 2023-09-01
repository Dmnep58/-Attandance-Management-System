-- view all details in class table
SELECT * FROM class;


--truncate the table
TRUNCATE table class;

-- data insetion in the table
INSERT into class values(? ,? , ? , ? , ? , ? , ? , ?,?);


-- fetch data according to class name
SELECT * FROM class where class_name = ?;


-- fetch no of people on the basis of the class_name
select count(*) from class where class_name= ? ;



/* update class name */
UPDATE class
SET class_name = ? WHERE class_id = ?;


-- update columns
alter table class rename column name to class_name;




/* deleting rows from class id */
DELETE from class where class_id=? ;
