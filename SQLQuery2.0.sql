use lab1

ALTER TABLE Employers
	DROP CONSTRAINT StaffCHK;
ALTER TABLE Employers
	DROP COLUMN Staff;
ALTER TABLE Occupations
	ADD Staff INT NOT NULL;
ALTER TABLE Occupations
	ADD CONSTRAINT StaffCHK FOREIGN KEY (Staff) REFERENCES Staff (IDStaff) ON DELETE CASCADE;

ALTER TABLE Employers
	DROP CONSTRAINT BirthCHK;

ALTER TABLE Employers
	ADD CONSTRAINT BirtCHK CHECK (BirthDate BETWEEN '1900.01.01' AND GETDATE());