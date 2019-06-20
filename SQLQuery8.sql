USE lab1
GO
DROP VIEW ReleaseEmployers
GO
CREATE VIEW ReleaseEmployers
AS
SELECT IDRecord, Surname, Firstname, Patronic, NameOccupation, Department, ReleaseDate
	FROM Employers LEFT OUTER JOIN Occupations
		ON Employers.Occupation=Occupations.IDOccupation
WHERE ReleaseDate IS NOT NULL
GO
CREATE TRIGGER RefreshView
ON Employers
FOR INSERT, UPDATE, DELETE
AS
EXEC sp_refreshview ReleaseEmployers
GO
CREATE TRIGGER UniqueEmployers
ON Employers
FOR INSERT, UPDATE
AS
IF 2 = (SELECT COUNT(E.IDRecord)
        FROM Employers E, INSERTED I
        WHERE E.Surname=I.Surname
        AND E.Firstname=I.Firstname
		AND E.Patronic=I.Patronic
		AND E.BirthDate=I.BirthDate)
        BEGIN
            ROLLBACK TRAN
            RAISERROR('Картка цієї особи вже була раніше створена!', 16, 1)
        END