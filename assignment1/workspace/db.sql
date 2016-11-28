-- create and select the database

DROP DATABASE IF EXISTS Schedule_DB;
CREATE DATABASE Schedule_DB;
USE Schedule_DB; -- MySQL command

-- create the tables

CREATE TABLE instructor (
  instructorID  INT(11)       NOT NULL   AUTO_INCREMENT,
  firstName     VARCHAR(45)   NOT NULL,
  lastName      VARCHAR(45)   NOT NULL,
  initial       VARCHAR(45)   NOT NULL,
  classTaught   INT(11) NOT NULL,
  PRIMARY KEY (instructorID)
);

CREATE TABLE schedule (
  ID                INT(11)       NOT NULL   AUTO_INCREMENT,
  startTime         VARCHAR(45)   NOT NULL,
  endTime           VARCHAR(45)   NOT NULL,
  days              VARCHAR(45)   NOT NULL,
  startDate         VARCHAR(45)   NOT NULL,
  endDate           VARCHAR(45)   NOT NULL,
  courseScheduleID  Int(11)       NOT NULL,
  PRIMARY KEY (ID)
);

CREATE TABLE room (
  roomNum       INT(11)      NOT NULL,
  building      VARCHAR(45)  NOT NULL,
  courseRoom    INT(11)      NOT NULL,
  PRIMARY KEY (roomNum)
);

CREATE TABLE course (
  CRN           INT(11)       NOT NULL,
  courseName    VARCHAR(45)   NOT NULL,
  description   VARCHAR(170)   NOT NULL,
  courseNum     INT(11)       NOT NULL,
  semester      VARCHAR(45)   NOT NULL,
  subject       VARCHAR(45)   NOT NULL,
  sectionID     INT(11)       NOT NULL,
  PRIMARY KEY (CRN)
);

-- insert data into the database

INSERT INTO instructor (firstName, lastName, initial, classTaught ) VALUES
('John', 'Doe', 'A', 3000),
('Dalton', 'Dudley', 'R', 3001),
('Ariala', 'Smith', 'R', 3002),
('Blake', 'Adams', 'R', 3003),
('Robert', 'Blue', 'C', 3004);

INSERT INTO schedule (ID, startTime, endTime, days, startDate, endDate, courseScheduleID) VALUES
(1, '3:00 pm', '4:15 pm', 'TR', '1/11', '5/02', 3005),
(2, '12:00 pm', '1:15 pm', 'MW', '8/11', '12/02', 2009),
(3, '9:00 am', '10:15 am', 'TR', '8/11', '12/02', 3565),
(4, '3:00 pm', '3:50 pm', 'MWF', '5/11', '7/02', 5678),
(5, '12:00 pm', '12:50 pm', 'MWF', '1/11', '5/02', 3437);

INSERT INTO room (roomNum, building, courseRoom) VALUES
(100, 'CCT', 3000),
(101, 'CCT', 3001),
(102, 'CCT', 3002),
(103, 'CCT', 3003),
(104, 'CCT', 3004);

INSERT INTO course (CRN, courseName, description, courseNum, semester, subject, sectionID) VALUES
(3005, 'Website Development', 'Student will make web pages. The student will learn html, javascript, and how to use css. After creating the web pages, they will make visual upgrades to it.', 3000, 'Spring', 'CPSC', 1),
(2009, 'Database Design', 'Student will make databases using SQL. After creating the database, they will create and alter the tables.', 3001, 'Fall', 'CPSC', 1),
(3565, 'Computer Science 1', 'Student will learn to program using the Python language. Also, they wil learn common programming practices.', 3002, 'Fall', 'CPSC', 1),
(5678, 'Algebra', 'Student will learn how to do algebra. Student will learn all the formulas.', 3003, 'Summer', 'MATH', 1),
(3437, 'Calculus', 'Student will learn how to do calculus.', 3004, 'Spring', 'MATH', 1);

-- create the users and grant priveleges to those users

GRANT SELECT, INSERT, DELETE, UPDATE
ON Schedule_DB.*
TO cpsc_user@localhost
IDENTIFIED BY 'pa55word';
