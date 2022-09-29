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

--Ex9
SELECT Employees.EmployeeID,LastName,FirstName,Title,YEAR(OrderDate) AS 'Year',COUNT(OrderID) AS 'total order'
FROM dbo.Employees
JOIN dbo.Orders ON Orders.EmployeeID = Employees.EmployeeID
GROUP BY Employees.EmployeeID,LastName,FirstName,Title,YEAR(OrderDate)
HAVING YEAR(OrderDate) = '1996'

--Ex10:
SELECT Employees.EmployeeID,LastName,FirstName,Title,YEAR(OrderDate) AS 'Year',COUNT(OrderID) AS 'total order'
FROM dbo.Employees
JOIN dbo.Orders ON Orders.EmployeeID = Employees.EmployeeID
GROUP BY Employees.EmployeeID,LastName,FirstName,Title,YEAR(OrderDate)
HAVING YEAR(OrderDate) = '1998'
--Ex11:
SELECT Employees.EmployeeID,LastName,FirstName,HireDate --,COUNT(OrderID) AS 'total order'
FROM dbo.Employees
JOIN dbo.Orders ON Orders.EmployeeID = Employees.EmployeeID
GROUP BY Employees.EmployeeID,LastName,FirstName,HireDate
HAVING (MONTH(HireDate) BETWEEN 1 AND 7) AND (YEAR(HireDate) = '1998')
--Ex13:

--Ex9:
--SELECT EmployeeID,LastName,FirstName,Title,BirthDate AS year
--FROM dbo.Employees 
--INNER JOIN dbo.Orders 
