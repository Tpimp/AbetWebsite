USE CSET_ABET_DB;
GO

BEGIN
DECLARE @coursenumber INT;
DECLARE @deptName  VARCHAR(100);
DECLARE @deptAbbr  VARCHAR(5);
DECLARE @reqtype   VARCHAR(64);
DECLARE @reqcomment VARCHAR(256);
DECLARE @requisiteID INT;

SET @coursenumber = 116;
SET @deptName  = 'Computer Systems Engineering Technology';
SET @deptAbbr = 'CST';
SET @reqtype  = 'CST 116 C++ Programming II2e,';
SET @reqcomment = 'with a grade “C” or better';


DECLARE @returnVal INT;
EXEC @returnval = sp_IOrFReqType @type = @reqtype, @courselink = NULL;
PRINT @returnval;
END;