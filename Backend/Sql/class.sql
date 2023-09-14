-- view all details in class table
SELECT * FROM class;


--truncate the table
TRUNCATE table class;

-- data insetion in the table
INSERT into class values(? ,? , ? , ? , ? , ? , ? , ?, ?);

--add row in class
INSERT into class values(1,'Java',51124,2,'1.png','09:00:00','10:00:00');


-- fetch data according to class name
SELECT * FROM class where class_name = ?;


-- fetch no of people from class 
select count(*) from class;



/* update class name */
UPDATE class
SET class_name = ? WHERE class_id = ?;


-- update columns
alter table class rename column name to class_name;




/* deleting rows from class id */
DELETE from class where class_id=? ;
