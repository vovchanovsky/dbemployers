USE lab1
GO
CREATE VIEW EmployersView
AS
SELECT IDRecord, Surname,Firstname, Patronic, BirthDate, NameDepartment, NameOccupation, NameStaff
    FROM Employers INNER JOIN Departments 
	ON Department=IDDepartment
	INNER JOIN Occupations ON Occupation=IDOccupation
	INNER JOIN Staff ON Staff=IDStaff
GO
SELECT * FROM EmployersView