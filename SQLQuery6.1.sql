USE lab1
GO
CREATE VIEW EmployersView
AS
SELECT NameDepartment, IDRecord, Surname,Firstname, Patronic, BirthDate
    FROM Departments LEFT OUTER JOIN Employers
	ON Employers.Department=Departments.IDDepartment
GO
SELECT * FROM EmployersView
GO
CREATE VIEW StaffView
AS
SELECT NameStaff, IDRecord, Surname,Firstname, Patronic, BirthDate
	FROM Staff LEFT OUTER JOIN Occupations
	ON Staff.IDStaff=Occupations.Staff
	LEFT OUTER JOIN Employers ON Employers.Occupation=Occupations.IDOccupation
GO
SELECT * FROM StaffView