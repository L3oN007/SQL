--joins, products
SELECT Customers.CustomerID
FROM dbo.Customers
JOIN dbo.Orders ON Orders.CustomerID = Customers.CustomerID

--vidu 1. Lay ten Khach hang va orderID cua khach hang do
SELECT Orders.CustomerID,ContactName,OrderID
FROM dbo.Customers
JOIN dbo.Orders ON Orders.CustomerID = Customers.CustomerID
-----------------------------------------------------------
SELECT Orders.CustomerID,CompanyName,OrderID
FROM dbo.Customers,dbo.Orders
WHERE dbo.Customers.CustomerID = dbo.Orders.CustomerID

--vidu 2. Lay ten cong ty khach hang  va tong soDH cua moi khach hang 
SELECT CompanyName,COUNT(OrderID) AS 'tong soDH'
FROM dbo.Customers
JOIN dbo.Orders ON Orders.CustomerID = Customers.CustomerID
GROUP BY CompanyName

--vidu 3. Hay lay thong tin tat ca khach hang va don hang cua khach hang neu co
SELECT *
FROM dbo.Customers
JOIN dbo.Orders ON Orders.CustomerID = Customers.CustomerID

--vidu 4. It returns  ProductName, Companyname and categoryname for each product.
SELECT ProductName,CompanyName,CategoryName
FROM dbo.Products p,dbo.Categories c,dbo.Suppliers s
WHERE p.ProductName = c.CategoryID AND p.SupplierID = s.SupplierID

---------------------------------------------------------------------
SELECT ProductName,CompanyName,CategoryName
FROM dbo.Products
JOIN dbo.Categories ON Categories.CategoryID = Products.CategoryID
JOIN dbo.Suppliers ON Suppliers.SupplierID = Products.SupplierID

--1 Lay ten san pham, so luong da dat cua tung san pham
SELECT ProductName,COUNT(OrderID) AS 'soluong'
FROM dbo.Products
JOIN dbo.[Order Details] ON [Order Details].ProductID = Products.ProductID
GROUP BY ProductName
--2 Lay thong tin Don hang cua cac khach hang dang song tai Torino
SELECT *
FROM dbo.Orders
JOIN dbo.Customers ON Customers.CustomerID = Orders.CustomerID
WHERE City = 'Torino'
--3. Lay ten KH, ten SP ma khach hang da mua tren 2 lan
SELECT ContactName ,ProductName
FROM dbo.Customers
JOIN dbo.Orders ON Orders.CustomerID = Customers.CustomerID
JOIN dbo.[Order Details] ON [Order Details].OrderID = Orders.OrderID
JOIN dbo.Products ON Products.ProductID = [Order Details].ProductID
WHERE Quantity > 2

--9. Write a SELECT query to display total orders of every employee in 1996 as following:
SELECT Employees.EmployeeID,YEAR(OrderDate) AS 'Year',COUNT(OrderID) AS 'Total order'
FROM dbo.Employees
JOIN dbo.Orders ON Orders.EmployeeID = Employees.EmployeeID
GROUP BY Employees.EmployeeID,YEAR(OrderDate)
HAVING YEAR(OrderDate) = '1996'

--10. Write a SELECT query to display total orders of every employee in 1998 as following:
SELECT Employees.EmployeeID,LastName,FirstName,Title,YEAR(OrderDate) AS 'Year',COUNT(OrderID) AS 'total order'
FROM dbo.Employees
JOIN dbo.Orders ON Orders.EmployeeID = Employees.EmployeeID
GROUP BY Employees.EmployeeID,LastName,FirstName,Title,YEAR(OrderDate)
HAVING YEAR(OrderDate) = '1996'

--11. Write a SELECT query to display total orders of every employee from 1/1/1998 to 31/7/1998 as following:
SELECT Employees.EmployeeID,LastName,FirstName,Title,OrderDate,COUNT(OrderID) AS 'Total order'
FROM dbo.Employees
JOIN dbo.Orders ON Orders.EmployeeID = Employees.EmployeeID
GROUP BY Employees.EmployeeID,LastName,FirstName,Title,OrderDate
HAVING OrderDate BETWEEN ('1998-1-1') AND ('1998-7-31')
ORDER BY Employees.EmployeeID ASC

--12. Write a SELECT query to display total orders of every employee from 1/1/1997 to 30/6/1997 as following:
SELECT Employees.EmployeeID,LastName,FirstName,Title,OrderDate,COUNT(OrderID) AS 'Total order'
FROM dbo.Employees
JOIN dbo.Orders ON Orders.EmployeeID = Employees.EmployeeID
GROUP BY Employees.EmployeeID,LastName,FirstName,Title,OrderDate
HAVING OrderDate BETWEEN ('1997-1-1') AND ('1997-6-30')
ORDER BY Employees.EmployeeID ASC


--18. Liet ke ProductID, ProductName, CategoryName nhung Product thuoc CategoryName la 'Seafood'
SELECT ProductID,ProductName,CategoryName
FROM dbo.Products
JOIN dbo.Categories ON Categories.CategoryID = Products.CategoryID
WHERE CategoryName LIKE 'Seafood'

--28. Tim nhung Quantity cao nhat trong table Order Details tren ProductName
SELECT ProductName,Quantity
FROM dbo.[Order Details]
JOIN dbo.Products ON Products.ProductID = [Order Details].ProductID
WHERE Quantity = (SELECT MAX(Quantity) FROM dbo.[Order Details])




