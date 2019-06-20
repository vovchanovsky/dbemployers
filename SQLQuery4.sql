use lab1

SELECT NameDepartment, IDRecord, Surname,Firstname, Patronic, BirthDate
    FROM Departments LEFT OUTER JOIN Employers
	ON Employers.Department=Departments.IDDepartment

SELECT NameDepartment, IDRecord, Surname,Firstname, Patronic, BirthDate
    FROM Departments LEFT OUTER JOIN Employers
	ON Employers.Department=Departments.IDDepartment
	WHERE NameDepartment='Фізико-технічний інститут'

SELECT NameDepartment, AVG(CONVERT(int, ROUND(DATEDIFF(DAY, BirthDate, GETDATE())/365.25, 0))) as "Середній вік"
	FROM Departments LEFT OUTER JOIN Employers
	ON Employers.Department=Departments.IDDepartment
	GROUP BY NameDepartment

SELECT NameStaff, IDRecord, Surname,Firstname, Patronic, BirthDate
	FROM Staff LEFT OUTER JOIN Occupations
	ON Staff.IDStaff=Occupations.Staff
	LEFT OUTER JOIN Employers ON Employers.Occupation=Occupations.IDOccupation

SELECT NameOccupation, COUNT(DISTINCT IDRecord)
	FROM Occupations LEFT OUTER JOIN Employers
	ON Employers.Occupation=Occupations.Staff
	GROUP BY NameOccupation