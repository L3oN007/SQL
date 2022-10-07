
--https://www.techonthenet.com/sql/index.php
--1.TAO DATABASE=> Giống như việc tạo ra 1 cái phòng, trong phòng chứa nhiều tủ, 
-- mỗi tủ là 1 table(relation)
CREATE DATABASE employeeManagement;
USE employeeManagement;
--CREATE DATABASE dbname;


--2. TAO TABLE => tạo ra tủ đựng đồ mà mỗi attribute là 1 ngăn tủ
--CREATE TABLE tableName
--   ( fieldname1 datatype [integrity_constraints],
--     fieldname2 datatype [integrity_constraints],
--    ….)
CREATE TABLE employee
(
	empoy_ID char(10),
	lastName nvarchar(20),
	firstName nvarchar(20),
	phone char(12),
	Addr nvarchar(30),
	DOB datetime

)

--3. THEM GIA TRI VAO TABLE => đặt quần áo vào tủ
--INSERT INTO tableName(<listOfFields>)
--VALUES  (<value 1>, ... <value m>)
insert into employee values ('EM0001',N'Vũ',N'Minh Nhật','09123456','no123','2000-5-10')
insert into employee values ('EM0002',N'Nguyễn',N'Văn A','0971414','no924142','1999-5-10')
insert into employee (empoy_ID,lastName,firstName,phone) values ('EM0002',N'Nguyễn',N'Văn A','0971414')
--4. ADD CAC CONSTRAINS
--ALTER TABLE tablename 
--ADD CONSTRAINT constraintName PRIMARY KEY (<attribute list>);
CREATE TABLE employee1
(
	empoy_ID char(10) PRIMARY KEY,
	lastName nvarchar(20) not null,
	firstName nvarchar(20) not null,
	phone char(12) unique,
	Addr nvarchar(30) default N'Hồ Chí Minh',
	DOB datetime check (year(getdate()) - year(DOB) >=18)
)

select * from employee1
insert into employee1 values ('EM0001',N'Vũ',N'Minh Nhật','09123456',N'Hà Nội','2000-5-10')
insert into employee1 values ('EM0002',N'Vũ',N'Minh Nhi','09127689',N'Hải Phòng','2000-5-10')
insert into employee1 values ('EM0003',N'Nguyễn',N'Minh B','09876543',N'Hải Phòng','2000-5-10',null)


--ALTER TABLE tablename 
--ADD CONSTRAINT constraintName FOREIGN KEY (<attribute list>)
--REFERENCES parentTableName (<attribute list>);
--Thêm cột thuộc tính
select *
from employee1

ALTER TABLE employee1
add sex nvarchar(10)
update employee1
set sex = N'Nam'
--ALTER TABLE tablename 
--ADD CONSTRAINT constraintName CHECK (expressionChecking)





--6. THEM XOA ATRRIBUTE TRONG BANG
--ALTER TABLE tableName
--ADD columnName datatype [constraint]

--ALTER TABLE tableName
--DROP columnName datatype [constraint]

--ALTER TABLE tableName
--ALTER columnName datatype [constraint]


--8. FOREIGN KEY
--	Attribute datatype FOREIGN KEY REFERENCES tablename(Attribute)

	



--9.UPDATE 
--UPDATE tableName
--SET columnName = newValue
--[WHERE condition]


--10.DELETE
--DELETE FROM tableName
--[WHERE condition] 
delete from employee1
where empoy_ID like 'EM0003'

