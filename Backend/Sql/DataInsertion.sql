-- Insertion of 5 teachers in registration table
INSERT INTO registration (uid, password, regno, phnno, name, email, address, image, role)
VALUES
    (2023, 'password1', 10001, 8347573458, 'John Teacher', 'john.teacher@example.com', '123 Main St', 'john.jpg', 'Teacher'),
    (2024, 'password2', 10002, 9876543210, 'Jane Teacher', 'jane.teacher@example.com', '456 Elm St', 'jane.jpg', 'Teacher'),
    (2025, 'password3', 10003, 5555555555, 'Tom Teacher', 'tom.teacher@example.com', '789 Oak St', 'tom.jpg', 'Teacher'),
    (2026, 'password4', 10004, 7777777777, 'Alice Teacher', 'alice.teacher@example.com', '101 Pine St', 'alice.jpg', 'Teacher'),
    (2027, 'password5', 10005, 9999999999, 'Bob Teacher', 'bob.teacher@example.com', '202 Cedar St', 'bob.jpg', 'Teacher');

-- Insertion of 50 students in registration table
INSERT INTO registration (uid, password, regno, phnno, name, email, address, image, role) VALUES
(21, 'password1', 1001, 1234567890, 'John Smith', 'john.smith@example.com', '123 Main St', 'image1.jpg', 'student'),
(22, 'password2', 1002, 2345678901, 'Jane Doe', 'jane.doe@example.com', '456 Elm St', 'image2.jpg', 'student'),
(23, 'password3', 1003, 3456789012, 'Bob Johnson', 'bob.johnson@example.com', '789 Oak St', 'image3.jpg', 'student'),
(24, 'password4', 1004, 4567890123, 'Alice Brown', 'alice.brown@example.com', '101 Pine St', 'image4.jpg', 'student'),
(25, 'password5', 1005, 5678901234, 'Eva Davis', 'eva.davis@example.com', '202 Cedar St', 'image5.jpg', 'student'),
(26, 'password6', 1006, 6789012345, 'Mike Wilson', 'mike.wilson@example.com', '303 Maple St', 'image6.jpg', 'student'),
(27, 'password7', 1007, 7890123456, 'Sara Lee', 'sara.lee@example.com', '404 Birch St', 'image7.jpg', 'student'),
(28, 'password8', 1008, 8901234567, 'David Taylor', 'david.taylor@example.com', '505 Redwood St', 'image8.jpg', 'student'),
(29, 'password9', 1009, 9012345678, 'Emily White', 'emily.white@example.com', '606 Cedar St', 'image9.jpg', 'student'),
(30, 'password10', 1010, 10001, 'Peter Anderson', 'peter.anderson@example.com', '707 Oak St', 'image10.jpg', 'student'),
(31, 'password11', 1011, 10002, 'Laura Clark', 'laura.clark@example.com', '808 Elm St', 'image11.jpg', 'student'),
(32, 'password12', 1012, 10003, 'Daniel Allen', 'daniel.allen@example.com', '909 Oak St', 'image12.jpg', 'student'),
(33, 'password13', 1013, 10004, 'Sophia Evans', 'sophia.evans@example.com', '111 Pine St', 'image13.jpg', 'student'),
(34, 'password14', 1014, 10005, 'William Turner', 'william.turner@example.com', '222 Cedar St', 'image14.jpg', 'student'),
(35, 'password15', 1015, 10006, 'Mia Martinez', 'mia.martinez@example.com', '333 Maple St', 'image15.jpg', 'student'),
(36, 'password16', 1016, 10007, 'James Baker', 'james.baker@example.com', '444 Birch St', 'image16.jpg', 'student'),
(37, 'password17', 1017, 10008, 'Lily Foster', 'lily.foster@example.com', '555 Redwood St', 'image17.jpg', 'student'),
(38, 'password18', 1018, 10009, 'Aiden King', 'aiden.king@example.com', '666 Cedar St', 'image18.jpg', 'student'),
(39, 'password19', 1019, 10010, 'Oliver Wright', 'oliver.wright@example.com', '777 Oak St', 'image19.jpg', 'student'),
(40, 'password20', 1020, 10011, 'Sophie Adams', 'sophie.adams@example.com', '888 Elm St', 'image20.jpg', 'student'),
(41, 'password21', 1021, 10012, 'Benjamin Ross', 'benjamin.ross@example.com', '999 Main St', 'image21.jpg', 'student'),
(42, 'password22', 1022, 10013, 'Ava Howard', 'ava.howard@example.com', '112 Pine St', 'image22.jpg', 'student'),
(43, 'password23', 1023, 10014, 'Henry Cooper', 'henry.cooper@example.com', '223 Cedar St', 'image23.jpg', 'student'),
(44, 'password24', 1024, 10015, 'Chloe Nelson', 'chloe.nelson@example.com', '334 Maple St', 'image24.jpg', 'student'),
(45, 'password25', 1025, 10016, 'Ethan Murphy', 'ethan.murphy@example.com', '445 Birch St', 'image25.jpg', 'student'),
(46, 'password26', 1026, 10017, 'Madison Diaz', 'madison.diaz@example.com', '556 Redwood St', 'image26.jpg', 'student'),
(47, 'password27', 1027, 10018, 'Liam Hayes', 'liam.hayes@example.com', '667 Cedar St', 'image27.jpg', 'student'),
(48, 'password28', 1028, 10019, 'Zoe Wright', 'zoe.wright@example.com', '778 Oak St', 'image28.jpg', 'student'),
(49, 'password29', 1029, 10020, 'Mason Bell', 'mason.bell@example.com', '889 Elm St', 'image29.jpg', 'student'),
(50, 'password30', 1030, 10021, 'Harper Wood', 'harper.wood@example.com', '991 Main St', 'image30.jpg', 'student'),
(51, 'password31', 1031, 10022, 'Jackson Hayes', 'jackson.hayes@example.com', '113 Pine St', 'image31.jpg', 'student'),
(52, 'password32', 1032, 10023, 'Scarlett Foster', 'scarlett.foster@example.com', '224 Cedar St', 'image32.jpg', 'student'),
(53, 'password33', 1033, 10024, 'Liam Martin', 'liam.martin@example.com', '335 Maple St', 'image33.jpg', 'student'),
(54, 'password34', 1034, 10025, 'Grace Brooks', 'grace.brooks@example.com', '446 Birch St', 'image34.jpg', 'student'),
(55, 'password35', 1035, 10026, 'Aiden Ross', 'aiden.ross@example.com', '557 Redwood St', 'image35.jpg', 'student'),
(56, 'password36', 1036, 10027, 'Lily Parker', 'lily.parker@example.com', '668 Cedar St', 'image36.jpg', 'student'),
(57, 'password37', 1037, 10028, 'Henry Young', 'henry.young@example.com', '779 Oak St', 'image37.jpg', 'student'),
(58, 'password38', 1038, 10029, 'Sophie Murphy', 'sophie.murphy@example.com', '880 Elm St', 'image38.jpg', 'student'),
(59, 'password39', 1039, 10030, 'Ethan Smith', 'ethan.smith@example.com', '992 Main St', 'image39.jpg', 'student'),
(60, 'password40', 1040, 10031, 'Olivia Turner', 'olivia.turner@example.com', '114 Pine St', 'image40.jpg', 'student'),
(61, 'password41', 1041, 10032, 'Noah Carter', 'noah.carter@example.com', '225 Cedar St', 'image41.jpg', 'student'),
(62, 'password42', 1042, 10033, 'Ava Perez', 'ava.perez@example.com', '336 Maple St', 'image42.jpg', 'student'),
(63, 'password43', 1043, 10034, 'Liam Evans', 'liam.evans@example.com', '447 Birch St', 'image43.jpg', 'student'),
(64, 'password44', 1044, 10035, 'Emma Foster', 'emma.foster@example.com', '558 Redwood St', 'image44.jpg', 'student'),
(65, 'password45', 1045, 10036, 'Mason Taylor', 'mason.taylor@example.com', '669 Cedar St', 'image45.jpg', 'student'),
(66, 'password46', 1046, 10037, 'Olivia King', 'olivia.king@example.com', '780 Oak St', 'image46.jpg', 'student'),
(67, 'password47', 1047, 10038, 'Aiden Jackson', 'aiden.jackson@example.com', '881 Elm St', 'image47.jpg', 'student'),
(68, 'password48', 1048, 10039, 'Sophia White', 'sophia.white@example.com', '993 Main St', 'image48.jpg', 'student'),
(69, 'password49', 1049, 10040, 'William Smith', 'william.smith@example.com', '115 Pine St', 'image49.jpg', 'student'),
(70, 'password50', 1050, 10041, 'Olivia Green', 'olivia.green@example.com', '909 Pine St', 'image50.jpg', 'student');


-- insertion of 10 course 
INSERT INTO course (course_id, start_date, end_date, course_name)
VALUES
    (1, '2023-09-14', '2023-09-30', 'Introduction to Computer Science'),
    (2, '2023-09-15', '2023-09-28', 'Data Structures and Algorithms'),
    (3, '2023-09-16', '2023-09-29', 'Database Management Systems'),
    (4, '2023-09-17', '2023-09-25', 'Computer Networks'),
    (5, '2023-09-18', '2023-09-26', 'Operating Systems'),
    (6, '2023-09-19', '2023-09-27', 'Web Development Fundamentals'),
    (7, '2023-09-20', '2023-09-24', 'Artificial Intelligence and Machine Learning'),
    (8, '2023-09-21', '2023-09-23', 'Software Engineering Principles'),
    (9, '2023-09-22', '2023-09-22', 'Cybersecurity Fundamentals'),
    (10, '2023-09-23', '2023-09-30', 'Computer Graphics and Visualization');




-- faculty enrollment in courses

-- John Teacher (uid: 2023)
INSERT INTO facultyenrollment (course_id, teacher_id, batch)
SELECT course_id, 2023, 'CS101' FROM course WHERE course_id IN (1, 2, 3);

-- Jane Teacher (uid: 2024)
INSERT INTO facultyenrollment (course_id, teacher_id, batch)
SELECT course_id, 2024, 'CS102' FROM course WHERE course_id IN (4, 5, 6);

--  Tom Teacher (uid: 2025)
INSERT INTO facultyenrollment (course_id, teacher_id, batch)
SELECT course_id, 2025, 'CS103' FROM course WHERE course_id IN (7, 8, 9);

--  Alice Teacher (uid: 2026)
INSERT INTO facultyenrollment (course_id, teacher_id, batch)
SELECT course_id, 2026, 'CS104' FROM course WHERE course_id IN (10, 1, 2);

--  Bob Teacher (uid: 2027)
INSERT INTO facultyenrollment (course_id, teacher_id, batch)
SELECT course_id, 2027, 'CS105' FROM course WHERE course_id IN (3, 4, 5);





-- student enrollment in course




