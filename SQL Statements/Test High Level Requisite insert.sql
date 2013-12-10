-- Test adding Requisite top level

USE CSET_ABET_DB;
GO

DECLARE @coursenumber INT;
DECLARE @deptName  VARCHAR(100);
DECLARE @deptAbbr  VARCHAR(5);
DECLARE @reqtype   VARCHAR(64);
DECLARE @reqcomment VARCHAR(256);
DECLARE @requisiteID INT;
SET @coursenumber = 126;
SET @deptName  = 'Computer Systems Engineering Technology';
SET @deptAbbr = 'CST';
SET @reqtype  = 'CST 116 Beginning Programming I';
SET @reqcomment = 'with a grade “C” or better';

EXEC @requisiteID = sp_IOrFRequisite @deptName, @deptAbbr, @coursenumber, @reqtype, @reqcomment;

PRINT @requisiteID;
