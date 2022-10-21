
--CLuster Index
--Lưu trên ổ đĩa cứng, chỉ tạo đc duy nhất 1 cluster trong 1 bảng,đánh số trên đại chỉ vậy lý
CREATE CLUSTERED INDEX index1 ON Employees(EmployeeID)

-- tao bang teater de tao Cluster Index

CREATE TABLE Student
( 
	StudentID int,
	FName varchar(20),
	LName varchar(20),
)

CREATE INDEX index2 ON Student(StudentID)


--NONCLUSTERED INDEX
--Được lưu trên Buffer , có thể tạo nhiều NONCLUSTERED trong 1 bảng
CREATE NONCLUSTERED INDEX index3 ON Student(FName)
DROP INDEX index2

--view
--1. Che dau thong tin
--2. Don gian hoa nghiep vu cho user
--3. tang toc do
-- Tao view
IF OBJECT_ID('MrEmployees','v') IS NOT NULL
DROP VIEW MrEmployees
GO

--CREATE VIEW MrEmployees AS 
SELECT EmployeeID,FirstName,LastName,TitleOfCourtesy
FROM dbo.Employees
WHERE TitleOfCourtesy LIKE 'Mr.'

--tao view ten nhan vien Nam, kiem tra xem co chua?
--Ảnh hưởng tới bảng Real
INSERT INTO MrEmployees (FirstName,LastName,TitleOfCourtesy)
	VALUES('Anh','Nguyen','Mr')
INSERT INTO Employees (FirstName,LastName,TitleOfCourtesy)
	VALUES('Anh','Nguyen','Mr.')
--Chỉ liên quan đến bảng ảo view
INSERT INTO MrEmployees (FirstName,LastName,TitleOfCourtesy)
	VALUES('Test1','Nguyen','Mr.')
INSERT INTO Employees (FirstName,LastName,TitleOfCourtesy)
	VALUES('Test2','Nguyen','Mr.')
SELECT *
FROM MrEmployees

SELECT *
FROM dbo.Employees
WHERE FirstName LIKE 'Anh'


-- sau khi sua trong bang doc tu dong cap nhat tren view
UPDATE dbo.Employees
SET TitleOfCourtesy = 'Ms.'
WHERE EmployeeID = 15

UPDATE MrEmployees
SET TitleOfCourtesy = 'Ms.'
WHERE EmployeeID = 12

--tao View tenNV co tren 50 OrderID
IF OBJECT_ID('tenNV','v') IS NOT NULL
DROP VIEW tenNV
GO

CREATE VIEW tenNV AS 
SELECT FirstName,LastName,COUNT(OrderID) AS 'So don hang'
FROM dbo.Employees
JOIN dbo.Orders ON Orders.EmployeeID = Employees.EmployeeID
GROUP BY FirstName,LastName
HAVING COUNT(OrderID) > 50

SELECT *
FROM tenNV


--casewhen  TitleOfCourtesy là Mrs hoặc Ms là Female,
--Mr Dr là Male còn lại là No
--CASE bieuthuc_dauvao
--WHEN bieuthuc_1 THEN ketqua_1
--WHEN bieuthuc_2 THEN ketqua_2
--...
--WHEN bieuthuc_n THEN ketqua_n
--ELSE ketqua_khac
--END

--Bai tap


--BT1 Tạo 1 view với tên 'seafood' liệt kê những Product thuộc CategoryName là 'Seafood'
IF OBJECT_ID('seafood','v') IS NOT NULL
DROP VIEW seafood
GO

CREATE VIEW seafood AS
SELECT ProductName
FROM dbo.Products
JOIN dbo.Categories ON Categories.CategoryID = Products.CategoryID
WHERE CategoryName = 'Seafood'

SELECT *
FROM seafood

--BT2 Tạo 1 view với tên 'Supply_5_20' trong bảng table Supplier
--hiển thị các Record c--SupplierID từ 5 đến 20 và không 
--thuộc Counry 'Germany'
IF OBJECT_ID('Supply_5_20','v') IS NOT NULL
DROP VIEW Supply_5_20
GO

CREATE VIEW Supply_5_20 AS
SELECT SupplierID,Country
FROM dbo.Suppliers
WHERE SupplierID BETWEEN 5 AND 20 AND Country NOT LIKE  'Germany'

SELECT *
FROM Supply_5_20
--BT3 Tạo 1 view với tên 'Product1' hiển thị : ProductID, ProductName, QuantityPerUnit và UnitsInStock
--của những sản phẩm thuộc loại 'confections' và có QuantityPerUnit chứa chuỗi
--'boxes' hoặc 'bags'
IF OBJECT_ID('Product1','v') IS NOT NULL
DROP VIEW Product1
GO

CREATE VIEW Product1 AS
SELECT ProductID,ProductName,QuantityPerUnit,UnitsInStock
FROM dbo.Products
JOIN dbo.Categories ON Categories.CategoryID = Products.CategoryID
WHERE (QuantityPerUnit LIKE '%boxes$' or QuantityPerUnit LIKE '%bags%') AND CategoryName = 'Confections'

SELECT *
FROM Product1

--Northwind 1
--13 den 20 

--23 den 39

