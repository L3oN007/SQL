--Ex2:
SELECT *
FROM dbo.Employees
WHERE Salary > 9000

--Ex3:
SELECT JobID,JobTitle,min_salary
FROM dbo.Jobs
WHERE min_salary > 5000 AND (RIGHT(JobID,3) LIKE 'MAN' OR RIGHT(JobID,3) LIKE 'MGR')
ORDER BY min_salary DESC

--Ex4:
SELECT EmployeeID,FirstName,LastName,Salary,DepartmentName,StateProvince,CountryID
FROM dbo.Employees
JOIN dbo.Departments ON Departments.DepartmentID = Employees.DepartmentID
JOIN dbo.Locations ON Locations.LocationID = Departments.LocationID
WHERE Salary > 3000 AND StateProvince LIKE 'Washington' AND CountryID LIKE 'US'

--Ex5:
SELECT Locations.LocationID,StreetAddress,City,StateProvince,CountryID,COUNT(DepartmentID) AS 'NumberOfDepartments'
FROM dbo.Locations
JOIN dbo.Departments ON Departments.LocationID = Locations.LocationID
GROUP BY Locations.LocationID,StreetAddress,City,StateProvince,CountryID
ORDER BY NumberOfDepartments DESC

--Ex6
SELECT TOP 1 Jobs.JobID,JobTitle,COUNT(EmployeeID) AS 'NumberOfEmployees'
FROM dbo.Jobs
JOIN dbo.Employees ON Employees.JobID = Jobs.JobID
GROUP BY Jobs.JobID,JobTitle
ORDER BY NumberOfEmployees DESC 

--Ex7:
SELECT EmployeeID,FirstName,LastName,Salary,Departments.DepartmentID,DepartmentName,Departments.DepartmentID AS 'NumberOfSubordinates'
FROM dbo.Employees
JOIN dbo.Departments ON Departments.DepartmentID = Employees.DepartmentID
GROUP BY EmployeeID,FirstName,LastName,Salary,Departments.DepartmentID,DepartmentName





