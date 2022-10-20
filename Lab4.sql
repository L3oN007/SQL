CREATE DATABASE LAB4;
USE LAB4
CREATE TABLE Department
(
	DeptID varchar(4) PRIMARY KEY,
	Name Nvarchar(50) not null,
	NoOfStudent int
)

CREATE TABLE Students
(
	StudentID varchar(4) PRIMARY KEY,
	LastName Nvarchar(30),
	FirstName Nvarchar(15),
	Sex varchar(1) check( Sex = 'F' or Sex = 'M'),
	DateOfBirth Date,
	PlaceOfBirth Nvarchar(30),
	DeptID varchar(4) FOREIGN KEY REFERENCES Department(DeptID),
	Scholarship float,
	AverageScore Numeric(4,2)
)

CREATE TABLE Courses
(
	CourseID varchar(4) PRIMARY KEY,
	Name Nvarchar(35),
	Credits tinyint
)

CREATE TABLE Results
(
	StudentID varchar(4) REFERENCES Students(StudentID) ,
	CourseID varchar(4) REFERENCES Courses(CourseID),
	Year int,
	Semester int,
	Mark float,
	Grade varchar(6),
	CONSTRAINT result PRIMARY KEY(StudentID,CourseID,Year,Semester)
)
SELECT * FROM Students

INSERT INTO Department (DeptID,Name) VALUES ('IS','Information Systems')
INSERT INTO Department(DeptID,Name) VALUES ('NC','Network and Communication')
INSERT INTO Department (DeptID,Name) VALUES ('SE','Software Engineering')
INSERT INTO Department (DeptID,Name) VALUES ('CE','Computer Engineering')
INSERT INTO Department (DeptID,Name)VALUES ('CS','Computer Science')

INSERT INTO Students (StudentID, LastName, FirstName, Sex, DateOfBirth, PlaceOfBirth, DeptID, Scholarship, AverageScore) VALUES ('S001','Le','Kim Lan','F','1990-02-23','Ha noi','IS','130000',null)
INSERT INTO Students (StudentID, LastName, FirstName, Sex, DateOfBirth, PlaceOfBirth, DeptID, Scholarship, AverageScore) VALUES ('S002','Tran','Minh Chanh','M','1992-12-24','Binh Đinh','NC','150000',null)
INSERT INTO Students (StudentID, LastName, FirstName, Sex, DateOfBirth, PlaceOfBirth, DeptID, Scholarship, AverageScore) VALUES ('S003','Le', 'An Tuyet','F','1991-02-21','Hai phong','IS','170000',null)
INSERT INTO Students (StudentID, LastName, FirstName, Sex, DateOfBirth, PlaceOfBirth, DeptID, Scholarship, AverageScore) VALUES ('S004','Tran','Anh Tuan','M','1993-12-20','TpHCM','NC','80000',null)
INSERT INTO Students (StudentID, LastName, FirstName, Sex, DateOfBirth, PlaceOfBirth, DeptID, Scholarship, AverageScore) VALUES ('S005','Tran','Thi Mai','F','1991-08-12','TpHCM','SE',0,null)
INSERT INTO Students (StudentID, LastName, FirstName, Sex, DateOfBirth, PlaceOfBirth, DeptID, Scholarship, AverageScore) VALUES ('S006','Le','Thi Thu Thuy','F','1991-01-02','An Giang','IS',0,null)
INSERT INTO Students (StudentID, LastName, FirstName, Sex, DateOfBirth, PlaceOfBirth, DeptID, Scholarship, AverageScore) VALUES ('S007','Nguyen','Kim Thu','F','1990-02-02','Ha Noi','SE','180000',null)
INSERT INTO Students (StudentID, LastName, FirstName, Sex, DateOfBirth, PlaceOfBirth, DeptID, Scholarship, AverageScore) VALUES ('S008','Le','Van Long','M','1992-12-08','TpHCM','IS','190000',null)

INSERT INTO Courses (CourseID, Name, Credits) VALUES ('DS01','Database Systems','3')
INSERT INTO Courses (CourseID, Name, Credits) VALUES ('AI01','Artificial Intelligence','3')
INSERT INTO Courses (CourseID, Name, Credits) VALUES ('CN01','Computer Network','3')
INSERT INTO Courses (CourseID, Name, Credits) VALUES ('CG01','Computer Graphics','4')
INSERT INTO Courses (CourseID, Name, Credits) VALUES ('DSA1','Data Structures and Algorithms','4')

INSERT INTO Results (StudentID,CourseID,Year,Semester,Mark,Grade) VALUES
('S001','DS01','2017','1','3', null),
('S001','DS01','2017','2','6',null),
('S001','AI01','2017','1','4.5', null),
('S001','AI01','2017','2','6', null),
('S001','CN01','2017','3','5', null),
('S002','DS01','2016','1','4.5', null),
('S002','DS01','2017','1','7', null),
('S002','CN01','2016','3','10', null), 
('S002','DSA1','2016','3','9', null),
('S003','DS01','2017','1','2', null),
('S003','DS01','2017','3','5', null),
('S003','CN01','2017','2','2.5', null), 
('S003','CN01','2017','3','4', null),
('S004','DS01','2017','3','4.5', null), 
('S004','DSA1','2018','1','10', null),
('S005','DS01','2017','2','7', null),
('S005','CN01','2017','2','2.5', null),
('S005','CN01','2018','1','5', null),
('S006','AI01','2018','1','6', null),
('S006','CN01','2018','2','10', null)

--Q2
UPDATE Department 
SET NoOfStudent = ( SELECT COUNT(DeptID) FROM Students WHERE Students.DeptID = Department.DeptID)
SELECT * FROM Department


--Q3
UPDATE Students 
SET  AverageScore = (SELECT AVG(Mark) FROM Results GROUP BY StudentID HAVING Results.StudentID = Students.StudentID)
SELECT * FROM Students

--Q4
UPDATE Results
SET Grade =
CASE 
WHEN Mark <= 10 AND Mark >=5 THEN 'Passed' 
WHEN Mark < 5 AND Mark >= 0 THEN 'Failed' 
END
FROM Results
SELECT * FROM Results

--Q5
SELECT StudentID, LastName+' '+FirstName AS [Fullname], DateOfBirth, PlaceOfBirth, DeptID, Scholarship
FROM Students
WHERE Scholarship <= 160000 
ORDER BY Scholarship DESC

--Q6
SELECT d.DeptID, d.Name AS [DepartmentName]
FROM Department d 
WHERE d.NoOfStudent =0

--Q7
SELECT  Students.StudentID,Students.LastName, Students.FirstName, NumberOfCourses = (SELECT COUNT(*) FROM Results WHERE Results.StudentID = Students.StudentID)
FROM Students 
ORDER BY NumberOfCourses ASC

--Q8
SELECT DeptID, Name AS [DepartmentName], NumberOfFemaleStudents = (SELECT COUNT(*) FROM Students WHERE Sex = 'F' AND Students.DeptID = Department.DeptID), NumberOfMaleStudents = (SELECT COUNT(*) FROM Students WHERE Sex = 'M' AND Students.DeptID = Department.DeptID)
FROM Department 

--Q9
SELECT s.StudentID, s.LastName +' '+s.FirstName AS [FullName], r.Mark
FROM Students s JOIN Department d ON s.DeptID = d.DeptID JOIN Results r ON r.StudentID = s.StudentID JOIN Courses c ON c.CourseID = r.CourseID 
WHERE d.Name NOT LIKE 'Information Systems' AND c.Name LIKE 'Database Systems' AND  r.Mark > ANY 
(SELECT r1.Mark 
FROM Students s1 JOIN Department d1 ON s1.DeptID = d1.DeptID JOIN Results r1 ON r1.StudentID = s1.StudentID JOIN Courses c1 ON c1.CourseID = r1.CourseID
WHERE d1.Name LIKE 'Information Systems')

--Q10
WITH t AS (SELECT CourseID, MAX(mark) AS [MArk]
FROM Results
GROUP BY CourseID
)
SELECT r.CourseID, c.Name AS [CourseName], s.LastName +' '+ s.FirstName AS [BestStudentFullName] 
FROM Students s JOIN Results r ON s.StudentID = r.StudentID JOIN Courses c ON c.CourseID = r.CourseID INNER JOIN t ON t.CourseID = r.CourseID
WHERE t.MArk = r.Mark AND t.CourseID = r.CourseID
GROUP BY r.CourseID, c.Name , s.LastName +' '+ s.FirstName
