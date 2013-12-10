USE CSET_ABET_DB
Go
INSERT INTO Professor (FName, LName, DepartmentID, BuildingID, OfficeNumber) VALUES
('First', 'Last', 1,1,111)
GO
UPDATE Professor
SET FName = 'First', LName = 'Last', DepartmentID = 1, BuildingID = 1, OfficeNumber = 111
Where ProfessorID = 1
GO

CREATE PROCEDURE sp_InsertProfessor 
					@ProfFname varchar(32), 
					@ProfLName varchar(32),
					@OfficeNumber int, 
					@BuildingAbbr varchar(2), 
					@DeptName VARCHAR(128)
AS
DECLARE @building TABLE
(
	BuildingID int,
	BuildingAbbr varchar(2),
	BuildingName varchar(32)
)

SELECT FName, LName, P.OfficeNumber, DepartmentAbbr 
FROM Professor AS P
JOIN Department AS D
ON P.DepartmentID = P.ProfessorID
JOIN Building AS B
ON B.BuildingID = P.BuildingID