CREATE LOGIN vovchanovsky WITH PASSWORD ='1234'
USE lab1
GO
CREATE USER vovchanovsky FOR LOGIN vovchanovsky
SELECT HAS_DBACCESS('lab1');
GO
EXEC sp_addrolemember 'db_owner', 'vovchanovsky'
GO
CREATE LOGIN Bill WITH PASSWORD ='pass'
USE lab1
GO
CREATE USER Bill FOR LOGIN Bill
EXECUTE sp_addrolemember 'db_datawriter','Bill'
GRANT EXECUTE TO Bill
REVOKE ALL FROM Bill