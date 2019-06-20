use lab1

ALTER TABLE Employers
	NOCHECK CONSTRAINT BirtCHK;

INSERT INTO Employers(Surname, Firstname, Patronic, Sex, BirthDate, Registrtation, Department, Occupation, EntryDate)
	VALUES ('Звінський', 'Тарас', 'Сергійович', 'M', '12.04.2022', 'Kyiv', '4', '2', '05.09.2015') 
ALTER TABLE Employers WITH CHECK
	CHECK	CONSTRAINT	BirtCHK;
DELETE FROM Employers WHERE Surname='Звінський';
ALTER TABLE Employers WITH CHECK
	CHECK	CONSTRAINT	BirtCHK;


ALTER TABLE Employers
	ADD Single VARCHAR(3)
		DEFAULT 'так';

SELECT * FROM Employers;
ALTER TABLE Employers
	DROP COLUMN Single;

EXEC SP_RENAME  'Departments','Renamed';
EXEC SP_RENAME  'Renamed','Departments';
