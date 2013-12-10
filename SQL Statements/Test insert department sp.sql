USE CSET_ABET_DB;
GO

BEGIN
DECLARE @coursenumber INT;
DECLARE @deptName  VARCHAR(100);
DECLARE @deptAbbr  VARCHAR(5);
DECLARE @reqtype   VARCHAR(64);
DECLARE @reqcomment VARCHAR(256);
DECLARE @requisiteID INT;

SET @coursenumber = 211;
SET @deptName  = 'Computer Systems Engineering Technology';
SET @deptAbbr = 'CST';
SET @reqtype  = 'CST 136 C++ OOP';
SET @reqcomment = 'with a grade “C” or better';

DECLARE @returnVal INT;
EXEC @returnval =  sp_IorFDepartment @deptName, @deptAbbr;
PRINT @returnval;

SELECT Department.DepartmentID, Department.DepartmentName, Department.DepartmentAbbr
FROM Department
WHERE DepartmentName = @deptName AND DepartmentAbbr = @deptAbbr;

END;