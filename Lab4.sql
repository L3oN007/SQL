CREATE DATABASE Lab4;
USE Lab4;
--Create
CREATE TABLE Department
	(
		DeptID varchar(4) PRIMARY KEY,
		Name nvarchar(50),
		NoOfStudents int
	)

	CREATE TABLE Students
	(
		StudnetID varchar(4) PRIMARY KEY,
		LastName nvarchar(30),
		FirstName nvarchar(10),
		Sex varchar(1),
		DateOFBirth date,
		PlaceOfBirth nvarchar,
		DeptID varchar(4),
		Scholarship float,
		AverageScore Numeric(4,2)
	)

	CREATE TABLE Course
	(
		CourseID varchar(4) Primary key,
		Name nvarchar(35),
		Credits tinyint
	)

	CREATE TABLE Results
	(
		StudentID varchar(4)  ,
		CourseID varchar(4) ,
		Year int ,
		Semester int ,
		Mark float,
		Grade varchar(6),
		CONSTRAINT a primary key (StudentID,CourseID,Year,Semester) 
	)

--insert
INSERT INTO dbo.Department
(
    DeptID,
    Name,
    NoOfStudents
)
VALUES('IS','Information Systems',NULL),('NC',)