USE CSET_ABET_DB;
GO

BEGIN
DECLARE @returnVal INT,  @Title VARCHAR (128), @Number INT, @LectH INT, @LabH INT, @Credits INT, @Desc VARCHAR(128), @Goals VARCHAR(2048), @Topics VARCHAR(2048), @Dept INT, @Coordinator INT;
SET @Title = 'Beginning Programming'; 
SET @Number = 116;
SET @LectH = 3; 
SET @LabH = 3; 
SET @Credits = 3;
SET @Desc = 'Learn to program c++'; 
SET @Goals = '*Program c++'; 
SET @Topics = 'Streams Cout and Cin. Binary and Unary operators. Bitwise Operators'; 
EXEC @Dept = sp_IorFDepartment 'Computer system', 'CSET';
DECLARE @Build INT;
EXEC @Build = sp_IorFBuilding 'Purvine', 'PV'
EXEC @Coordinator = sp_IorFProfessor 'Todd', 'Breedlove', @Dept, @Build, 116;
EXEC @returnval = sp_IorFCourse @Title, @Number, @LectH, @LabH, @Credits, @Desc, @Goals, @Topics, @Dept, @Coordinator;
PRINT @returnval;
END;

Select *
FROM Course
GO
USE master