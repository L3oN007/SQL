--Ex sample:
--Danh sach: EmployeeID,Fullname,country
SELECT EmployeeID, LastName + ' ' + FirstName AS [Full name] , Country , YEAR(GETDATE()) - YEAR((BirthDate)) AS Age
FROM dbo.Employees
WHERE YEAR(GETDATE()) - YEAR((BirthDate)) >= 60 AND Country = 'USA'
ORDER BY YEAR(GETDATE()) - YEAR((BirthDate)) DESC

--Ex1:
SELECT LOWER(LastName + ' ' + FirstName)  AS [Full name],TitleOfCourtesy
FROM dbo.Employees

--Ex2:
SELECT UPPER(LastName + ' ' + FirstName)  AS [Full name] 
FROM dbo.Employees

--Ex3:
SELECT LastName,FirstName,Title,City,Country
FROM dbo.Employees
WHERE Country = 'USA'

--Ex4:
SELECT CustomerID,CompanyName,ContactName,ContactTitle,Country
FROM dbo.Customers
WHERE Country = 'UK'

--Ex5:
SELECT CustomerID,CompanyName,Address,City,Country
FROM dbo.Customers
WHERE Country = 'Mexico'

--Ex6:
SELECT CustomerID,CompanyName,Phone,Address,City,Country
FROM dbo.Customers
WHERE Country = 'Sweden'

--Ex7:
SELECT ProductID,ProductName,UnitPrice,UnitsInStock
FROM dbo.Products
WHERE UnitsInStock BETWEEN 5 AND 10

--Ex8:
SELECT ProductID,ProductName,UnitPrice,ReorderLevel,UnitsOnOrder
FROM dbo.Products
WHERE UnitsOnOrder BETWEEN 60 AND 100

--Ex9:
--SELECT EmployeeID,LastName,FirstName,Title,BirthDate AS year
--FROM dbo.Employees 
--INNER JOIN dbo.Orders 
