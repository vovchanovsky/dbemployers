use lab1

SELECT *, DATEDIFF(MONTH, EntryDate, GETDATE()) as "Стаж(місяців)" FROM Employers
WHERE DATEDIFF(MONTH, EntryDate, GETDATE()) > (SELECT AVG(DATEDIFF(MONTH, EntryDate, GETDATE())) FROM Employers)

SELECT *, DATEDIFF(MONTH, EntryDate, GETDATE()) as "Стаж(місяців)" FROM Employers
WHERE DATEDIFF(MONTH, EntryDate, GETDATE()) = (SELECT MAX(DATEDIFF(MONTH, EntryDate, GETDATE())) FROM Employers)

SELECT *, DATEDIFF(MONTH, EntryDate, GETDATE()) as "Стаж(місяців)" FROM Employers
WHERE DATEDIFF(MONTH, EntryDate, GETDATE()) = (SELECT MIN(DATEDIFF(MONTH, EntryDate, GETDATE())) FROM Employers)


SELECT NameDepartment, COUNT(IDRecord)
	FROM Departments LEFT OUTER JOIN Employers ON Employers.Department=Departments.IDDepartment
	GROUP BY NameDepartment

SELECT NameDepartment
FROM
(
    SELECT NameDepartment, COUNT(IDRecord) AS 'CountEmp'
    FROM Departments LEFT OUTER JOIN Employers ON Employers.Department=Departments.IDDepartment
   GROUP BY NameDepartment
) X 
WHERE CountEmp=(SELECT MAX(CountEmp)
FROM
(
    SELECT NameDepartment, COUNT(IDRecord) AS 'CountEmp'
    FROM Departments LEFT OUTER JOIN Employers ON Employers.Department=Departments.IDDepartment
   GROUP BY NameDepartment
) X )
