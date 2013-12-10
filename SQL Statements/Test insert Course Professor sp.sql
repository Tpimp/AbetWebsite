USE CSET_ABET_DB
GO
DECLARE	@Title			VARCHAR(128),
		@Number			INT,
		@LecH			INT,
		@LabH			INT,
		@Credits		INT,
		@Desc			VARCHAR(2048),
		@Goals			VARCHAR(2048),
		@Topics			VARCHAR(2048),
		@DeptID			INT,
		@CoordID		INT,
		@BuildID		INT, 
		@OfficeNumber	INT;
SET @OfficeNumber	= 116
SET @Title		= 'Intor Database'
SET @Number		= 324;
SET @LecH		= 3;
SET @LabH		= 3;
SET @Credits	= 3;
SET @Desc		= 'Learn to Database real good.';
SET @Goals		= 'Make me that in there Database.';
SET @Topics		= '*Ethics *Databases';
EXEC @DeptID	= sp_IorFDepartment 'Computer Systems Engineering Technology', 'CSET';
EXEC @BuildID	= sp_IorFBuilding 'Purvine', 'PV';
EXEC @CoordID	= sp_IorFProfessor 'Todd', 'Breadlove', @BuildID, @DeptID, @OfficeNumber;
EXEC sp_Add_Course @Title, @Number, @LecH, @LabH, @Credits, @Desc, @Goals, @Topics, @DeptID, @CoordID;
GO
Select *
FROM Course
GO