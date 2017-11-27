-- Support: SQL Server & Azure Database

-- Get Logins
SELECT * FROM sys.sql_logins


-- Get Users
SELECT * FROM sys.sysusers WHERE name = 'user.name'


-- Add/Drop a role to/from a user
EXEC sp_addrolemember 'loginmanager', 'user.name';
EXEC sp_addrolemember 'dbmanager', 'user.name';

EXEC sp_droprolemember 'loginmanager', 'user.name';
EXEC sp_droprolemember 'dbmanager', 'user.name';