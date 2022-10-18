CREATE DATABASE Lab4;
USE Lab4;
--Q1:
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
		FirstName nvarchar(25),
		Sex varchar(1),
		DateOFBirth date,
		PlaceOfBirth NVARCHAR(30),
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
) values 
('IS','Information Systems',null),
('NC','Network and Communication',null),
('SE','Software Engineering',null),
('CE','Computer Engineering',null),
('CS','Computer Science',null)

insert into dbo.Course
(
    CourseID,
    Name,
    Credits
)
VALUES
('DS01','Database Systems',3),
('AI01','Artificial Intelligence ',3),
('CN01','Computer Network ',3),
('CG01','Computer Graphics ',4),
('DSA1','Data Structures and Algorithms ',4)

INSERT INTO dbo.Results
(
    StudentID,
    CourseID,
    Year,
    Semester,
    Mark,
    Grade
)
VALUES
('S001','DS01',2017,1,3,NULL),
('S001','DS01',2017,2,6,NULL),
('S001','AI01',2017,1,4.5,NULL),
('S001','AI01',2017,2,6,NULL),
('S001','CN01',2017,3,5,NULL),
('S002','DS01',2016,1,4.5,NULL),
('S002','DS01',2017,1,7,NULL),
('S002','CN01',2016,3,10,NULL),
('S002','DSA1',2016,3,9,NULL),
('S003','DS01',2017,1,2,NULL),
('S003','DS01',2017,3,5,NULL),
('S003','CN01',2017,2,2.5,NULL),
('S003','CN01',2017,3,4,NULL),
('S004','DS01',2017,3,4.5,NULL),
('S004','DSA1',2018,1,10,NULL),
('S005','DS01',2017,2,7,NULL),
('S005','CN01',2017,2,2.5,NULL),
('S005','CN01',2018,1,5,NULL),
('S006','AI01',2018,1,6,NULL),
('S006','CN01',2018,2,10,NULL)


    
INSERT INTO dbo.Students
(
    StudnetID,
    LastName,
    FirstName,
    Sex,
    DateOFBirth,
    PlaceOfBirth,
    DeptID,
    Scholarship,
    AverageScore
)
VALUES
('S001',N'Lê',N'Kim Lan','F','1990/2/23',N'Hà Nội','IS','130000',NULL),
('S002',N'Trần',N'Minh Chánh','M','1992/12/24',N'Bình Định','NC','150000',NULL),
('S003',N'Lê',N'An Tuyết','F','1991/2/21',N'Hải Phòng','IS','170000',NULL),
('S004',N'Trần',N'Anh Tuấn','M','1993/12/20',N'TpHCM','NC','80000',NULL),
('S005',N'Trần',N'Thị Mai','F','1991/8/12',N'TpHCM','SE','0',NULL),
('S006',N'Lê',N'Thị Thu Thủy','F','1991/1/2',N'An Giang','IS','0',NULL),
('S007',N'Nguyễn',N'Kim Thư','F','1990/2/2',N'Hà Nội','SE','180000',NULL),
('S008',N'Lê',N'Văn Long','M','1992/12/08',N'TpHCM','IS','190000',NULL)

--Q2:
