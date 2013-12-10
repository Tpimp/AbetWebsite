USE CSET_ABET_DB;
CREATE USER admin WITH PASSWORD = 'admin';
GO--what good is a role with no permissions?
EXEC sp_addrolemember 'SystemAdmin', 'admin';
GO--do you even sql?