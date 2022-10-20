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
SELECT Employees.EmployeeID,LastName,FirstName,HireDate ,COUNT(OrderID) AS 'total order'
FROM dbo.Employees
JOIN dbo.Orders ON Orders.EmployeeID = Employees.EmployeeID
WHERE (MONTH(OrderDate) BETWEEN 1 AND 7) AND (YEAR(OrderDate) = '1998')
GROUP BY Employees.EmployeeID,LastName,FirstName,HireDate

--Ex12:
SELECT Employees.EmployeeID,LastName,FirstName,HireDate,HomePhone,COUNT(OrderID) AS 'Total order'
FROM dbo.Employees
JOIN dbo.Orders ON Orders.EmployeeID = Employees.EmployeeID
WHERE OrderDate BETWEEN '1997/1/1' AND '1997/6/30'
GROUP BY Employees.EmployeeID,LastName,FirstName,HireDate,HomePhone

--Ex21: 
SELECT Products.CategoryID,CategoryName,Products.ProductID,ProductName,DAY(OrderDate),MONTH(OrderDate),YEAR(OrderDate),(Quantity * [Order Details].UnitPrice) AS 'Revenue'
FROM dbo.Products
JOIN dbo.Categories ON Categories.CategoryID = Products.CategoryID
JOIN dbo.[Order Details] ON [Order Details].ProductID = Products.ProductID
JOIN dbo.Orders ON Orders.OrderID = [Order Details].OrderID
WHERE (DAY(OrderDate) BETWEEN 1 AND 5) AND MONTH(OrderDate) LIKE 7 AND YEAR(OrderDate) LIKE 1996

--Ex22:
SELECT DISTINCT  Employees.EmployeeID,LastName,FirstName,OrderID,OrderDate,RequiredDate,ShippedDate
FROM dbo.Employees
JOIN dbo.Orders ON Orders.EmployeeID = Employees.EmployeeID
WHERE ShippedDate -RequiredDate > 7
ORDER BY Employees.EmployeeID

--Ex23:

--Ex24:
SELECT CustomerID,CompanyName,ContactName,ContactTitle
FROM dbo.Customers
--WHERE INDEX_COL(10643)

--Ex32:
SELECT ProductID,ProductName,SupplierID,CategoryID,UnitsInStock 
FROM dbo.Products
WHERE UnitsInStock LIKE (SELECT MAX(UnitsInStock) FROM dbo.Products)

--Ex33:
SELECT ProductID,ProductName,SupplierID,CategoryID,UnitsInStock 
FROM dbo.Products
WHERE UnitsInStock LIKE (SELECT MIN(UnitsInStock) FROM dbo.Products)

--Ex34
SELECT ProductID,ProductName,SupplierID,CategoryID,UnitsOnOrder
FROM dbo.Products
WHERE UnitsOnOrder LIKE (SELECT MAX(UnitsOnOrder)FROM dbo.Products)

--EX35:
SELECT ProductID,ProductName,SupplierID,CategoryID,ReorderLevel
FROM dbo.Products
WHERE ReorderLevel LIKE (SELECT MAX(ReorderLevel) FROM dbo.Products)
