USE CSET_ABET_DB
Go
INSERT INTO Department(DepartmentAbbr, DepartmentName) VALUES
('CSET', 'Computer Systems Emgineering Technology')
GO
UPDATE Department
SET DepartmentAbbr = 'abbr', DepartmentName = 'name'
GO
SELECT DepartmentID, DepartmentAbbr, DepartmentName
FROM Department