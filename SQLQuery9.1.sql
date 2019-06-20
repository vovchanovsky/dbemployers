USE master;
GO
SELECT *
FROM sys.symmetric_keys
WHERE name = '##MS_ServiceMasterKey##';
GO
USE lab1;
GO
CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'Password123';
GO
USE lab1;
GO
CREATE CERTIFICATE Certificate1
WITH SUBJECT = 'Protect Data';
GO
USE lab1;
GO
CREATE SYMMETRIC KEY SymmetricKey1 
 WITH ALGORITHM = AES_128 
 ENCRYPTION BY CERTIFICATE Certificate1;
GO
USE lab1;
GO
ALTER TABLE Employers
ADD Registrtation_encrypt varbinary(MAX) NULL
GO
USE lab1;
GO
-- Opens the symmetric key for use
OPEN SYMMETRIC KEY SymmetricKey1
DECRYPTION BY CERTIFICATE Certificate1;
GO
UPDATE Employers
SET Registrtation_encrypt = EncryptByKey (Key_GUID('SymmetricKey1'),Registrtation)
FROM dbo.Employers;
GO
-- Closes the symmetric key
CLOSE SYMMETRIC KEY SymmetricKey1;
GO
USE lab1;
GO
OPEN SYMMETRIC KEY SymmetricKey1
DECRYPTION BY CERTIFICATE Certificate1;
GO
-- Читання розшифрованих даних 
SELECT 
IDRecord, Registrtation_encrypt AS 'Encrypted Registration',
CONVERT(varchar, DecryptByKey(Registrtation_encrypt)) 
AS 'Decrypted Registration'
FROM dbo.Employers;
 
CLOSE SYMMETRIC KEY SymmetricKey1;