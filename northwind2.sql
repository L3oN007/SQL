-- Bai tap  not between,  like, not like , right, left, mid, len, is not null, is null, max, min , avg, count, tich(product), orderby, Group by, having
SELECT SupplierID, AVG(UnitsInStock) AS avgUnit
FROM dbo.Products
GROUP BY SupplierID
HAVING AVG(UnitsInStock) >= 50


--vidu1: Hien thi bang OrderDetail sap xep theo UnitPrice giam dan
SELECT *
FROM dbo.[Order Details]
ORDER BY UnitPrice DESC
--vidu2: Hien thi bang OrderDetail sap xep theo UnitPrice giam dan, neu cung UnitPrice thi Quantity tang dan
SELECT *
FROM dbo.[Order Details]
ORDER BY UnitPrice DESC, Quantity ASC

--vidu3: Hien thi 2 bo co UnitPrice cao nhat
SELECT TOP (2) *
FROM dbo.[Order Details]
ORDER BY UnitPrice DESC

--vidu4:  Dem so don hang cua tung khach hang
SELECT COUNT(CustomerID)
FROM dbo.Orders

--vidu5: Dem so don hang cua tung khach hang, chi thong ke khach hang co tu 4 don hang tro len
SELECT CustomerID, COUNT(CustomerID) AS soluong
FROM dbo.Orders
GROUP BY CustomerID
HAVING COUNT(CustomerID) >= 4

--vidu6: Lay OrderID, ProductID, Quantity  trong bang Order Details co Unitprice giua 50 vaf 100 va quantity la 20
SELECT OrderID,ProductID,Quantity
FROM dbo.[Order Details]
WHERE (UnitPrice BETWEEN 50 AND 100) AND Quantity = 20

--vidu7": Lay gia trung binh cua tat ca cac mat hang (Unitprice trong bang Order Details)
SELECT AVG(UnitPrice)
FROM dbo.[Order Details]

--vidu8: Lay thong tin OrderID, CustomerID, Orderdate trong thang 7 nam 1996 
SELECT OrderID,CustomerID,OrderDate
FROM dbo.Orders
WHERE MONTH(OrderDate) = 7 AND YEAR(OrderDate) = 1996

--1.Hien thi cac cot: CategoryId, CategoryName và Description trong table Categories theo chieu giam dan cua CategoryName
SELECT CategoryID,CategoryName,Description
FROM dbo.Categories
ORDER BY CategoryName DESC

--2. Hay liet ke ten cac thanh pho (City) trong bang Customers voi thong tin khong trung lap (su dung DISTINCT)
SELECT DISTINCT City 
FROM dbo.Customers

--3. Trong table Products, hay hien thi 3 cot ProductName, UnitPrice va UnitsInStock dong thoi sap xep 2 cot nay theo chieu giam dan
SELECT ProductName,UnitPrice,UnitsInStock
FROM dbo.Products
ORDER BY UnitPrice DESC,UnitsInStock DESC

--4. Trong table Orders chi hien thi nhung record co cot Freight duoi 50
SELECT *
FROM dbo.Orders
WHERE Freight < 50
--5. Hay hien thi nhung nhan vien (employee) thuoc thanh pho "London" trong bang Employees
SELECT *
FROM dbo.Employees
WHERE City = 'London'

--6. Hay hien thi nhung nhan vien (employee) co FirstName bat dau bang ky tu "A" trong bang Employees
SELECT *
FROM dbo.Employees
WHERE FirstName LIKE 'A%'

--7. Trong table Employees, hay liet le nhung nhan vien co nam sinh trong khoang tu 1950 den 1960
SELECT*
FROM dbo.Employees
WHERE YEAR(BirthDate) BETWEEN 1950 AND 1960

--8. Trong table Shippers hay liet ke cac CompanyName va so Phone voi dieu kien Phone khong hien thi ma vung(lay 7 so cuoi)
SELECT CompanyName,RIGHT(Phone,8)
FROM dbo.Shippers

--9. Hay tim nhan vien co HOmephone ma 4 so cuoi la 4444
SELECT *
FROM dbo.Employees
WHERE RIGHT(HomePhone,4) = '4444'
 
--10. Hay tim nhung nhan vien o thanh pho 'Tacoma' hoac Seattle'
SELECT *
FROM dbo.Employees
WHERE City = 'Tacoma' OR City = 'Seattle'
--11. Hay hien thi nhung nhan vien co TitleOfCourtesy la 'Mr' hoac 'Ms'
SELECT *
FROM dbo.Employees
WHERE TitleOfCourtesy = 'Mr.' OR TitleOfCourtesy = 'Ms.'

--12. Trong table Suppliers, hay hien thi nhung record cos so Fax (khong null) va co SupplierID tu 5 toi 20
SELECT *
FROM dbo.Suppliers
WHERE Fax IS NOT NULL AND SupplierID BETWEEN 5 AND 20

--13. Hay hien thi cac Supplier co Country la Germany hoac Australia hoac Denmark
SELECT *
FROM dbo.Suppliers
WHERE Country = 'Germany' OR Country = 'Australia' OR Country = 'Denamrk'

--14. Trong table Suppliers, hay hien thi cac record co SupplierID tu 5 den 20 va khong thuoc Country 'Brazil'
SELECT *
FROM dbo.Suppliers
WHERE (SupplierID BETWEEN 5 AND 20 ) AND Country NOT LIKE 'Germany'

--15. Hien thi thong tin trong table Suppliers tru nhung SupplierID tu 10 den 20
SELECT*
FROM dbo.Suppliers
WHERE SupplierID NOT BETWEEN 10 AND 20

--16. Dung table Products de dua ra nhung san pham co UnitPrice <20 va UnitInStock>30
SELECT *
FROM dbo.Products
WHERE UnitPrice < 20 AND UnitsInStock > 30

--17. Hien thi tat ca cac san pham trong table Products thuoc CategoryID la '1' va tru san pham co ten la 'Chang'
SELECT *
FROM dbo.Products
WHERE CategoryID = '1' AND ProductName NOT LIKE 'Chang'

--18. Liet ke nhung Product thuoc CategoryName la 'Seafood'
SELECT *
FROM dbo.Products
INNER JOIN dbo.Categories ON Categories.CategoryID = Products.CategoryID
WHERE CategoryName = 'Seafood'


--19. Hien thi: ProductID, ProductName, QuantityPerUnit vaf UnitsInStock cua nuhng san pham thuoc loai 'Confections' va co QunatityPerUnit chua chuoi 'boxes' hoac bags
SELECT ProductID,ProductName,QuantityPerUnit,UnitsInStock,CategoryName
FROM dbo.Products
INNER JOIN dbo.Categories ON Categories.CategoryID = Products.CategoryID
WHERE CategoryName = 'confections' AND (QuantityPerUnit LIKE '%boxes%' OR QuantityPerUnit LIKE '%bags%')

--20 Hay tim nhung ten san pham chua chuoi 'Chef' trong table Products
SELECT *
FROM dbo.Products
WHERE ProductName LIKE '%Chef%'

--21. Tim san pham co ten bat dau la 'Queso' va ket thuc la chuoi 'Pastora' trong table Products
SELECT *
FROM dbo.Products
WHERE ProductName LIKE 'Queso%' AND ProductName LIKE '%Pastora'

--22. Hay dem co bao nhieu Territory thuoc tung Region
--SELECT Region.RegionID,COUNT(TerritoryID) AS '123'
--FROM dbo.Region
--GROUP BY RegionID
--INNER JOIN dbo.Territories ON Territories.RegionID = Region.RegionID

--23. Trong table Customers hay cho biet co bao nhieu customers khong co so fax
SELECT CustomerID,COUNT(Fax) AS soluong
FROM dbo.Customers
GROUP BY CustomerID
HAVING COUNT(Fax) NOT LIKE 0



--24. Tim trong table Customers nhung CompanyName co chieu dai duoi 10 ki tu
SELECT *
FROM dbo.Customers
WHERE LEN(CompanyName) < 10

--25. Trong table Order Details, hay thong ke UnitPrice lon nhat va Quantity lon nhat
SELECT MAX(UnitPrice) AS 'Max_UnitPrice',  MAX(Quantity) AS 'Max_Quantity'
FROM dbo.[Order Details]

--26. Trong table Order Details, hay thong ke UnitPrice lon nhat va Quantity theo tung ProducID
SELECT ProductID, MAX(UnitPrice) AS 'Max_UnitPrice',  MAX(Quantity) AS 'Max_Quantity'
FROM dbo.[Order Details]
GROUP BY ProductID



--27. Tinh gia tri trung binh cua cot UnitPrice trong table Order Details
SELECT ProductID,AVG(UnitPrice) AS 'Average_UnitPrice'
FROM dbo.[Order Details]
GROUP BY ProductID

--28. Tim nhung Quantity cao nhat trong table Order Details tren ProductName
SELECT ProductName, MAX(Quantity) AS 'Max_Quantity'
FROM dbo.[Order Details]
INNER JOIN dbo.Products ON Products.ProductID = [Order Details].ProductID

--29. Hien thi cot CategoryID va UnitsInStock cua nhung UnitsInstock nho nhat trong table Products
SELECT CategoryID,UnitsInStock,MIN(UnitsInStock)
FROM dbo.Products
GROUP BY UnitsInStock

--30. Hay hien thi nhung gia tri trung binh cua UnitPrice theo CategoryID va chi hien thi nhung gia tri trung binh trong khoang tu 20 den 30



