USE lab1
GO
CREATE PROC CountEmployers
	@Department INT
AS
	SELECT COUNT(*) AS "Number of Employers" FROM Employers
	WHERE Department=@Department
GO
EXEC CountEmployers 3
GO
DROP PROC CountEmployers
GO
DROP PROC Release
GO
CREATE PROC Release
	@ID INT,
	@ReleaseDate DATE
AS
	IF EXISTS (SELECT * FROM Employers WHERE IDRecord=@ID)
	BEGIN
	IF (@ReleaseDate > (SELECT EntryDate FROM Employers WHERE IDRecord=@ID))
	BEGIN
	UPDATE Employers 
	 SET ReleaseDate = @ReleaseDate 
	 WHERE IDRecord=@ID;
	 END
	ELSE
		RAISERROR('Дата звільнення повинна бути більшоою за дату прийняття ', 16, 1)
	 END
	ELSE
		RAISERROR('Даної особи немає в БД', 16, 1)
GO
use lab1
GO
EXEC Release 63, '2007-11-03' 