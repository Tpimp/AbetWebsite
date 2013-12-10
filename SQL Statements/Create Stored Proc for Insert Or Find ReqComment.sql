USE CSET_ABET_DB
GO-- IN THIS FILE YOU WILL FIND ALL THE CREATE STATEMENTS FOR THE STORED PROCEDURES (INSERT)

--IorF Stands for Insert or Find. This means each stored procedure will first check if the item is in the db,
-- then only if not found it will be added into the db. All scenarios will RETURN the PRIMARY KEY of the inserted
-- or found ROW.

--** CHECK FOR EXISTING PROCS AND DELETE THEM BEFORE CREATING NEW ONES
IF OBJECT_ID('sp_IorFReqComment') IS NOT NULL
	DROP PROC sp_IorFReqComment;
GO

IF OBJECT_ID('fnGetCourseLink') IS NOT NULL
	DROP FUNCTION fnGetCourseLink;
GO


IF OBJECT_ID('sp_IorFReqType') IS NOT NULL
	DROP PROC sp_IorFReqType;
GO

IF OBJECT_ID('sp_IorFDegree') IS NOT NULL
	DROP PROC sp_IorFDegree;
GO


IF OBJECT_ID('sp_IorFDepartment') IS NOT NULL
	DROP PROC sp_IorFDepartment;
GO

IF OBJECT_ID('sp_IorFRequisite') IS NOT NULL
	DROP PROC sp_IorFRequisite;
GO

IF OBJECT_ID('sp_IorFAuthor') IS NOT NULL
	DROP PROC sp_IorFAuthor;
GO

IF OBJECT_ID('sp_IorFPublisher') IS NOT NULL
	DROP PROC sp_IorFPublisher;
GO

IF OBJECT_ID('sp_IorFBuilding') IS NOT NULL
	DROP PROC sp_IorFBuilding
GO

IF OBJECT_ID('sp_IorFTextbook_Author') IS NOT NULL
	DROP PROC sp_IorFTextbook_Author
GO

IF OBJECT_ID('sp_IorFTextbook') IS NOT NULL
	DROP PROC sp_IorFTextbook
GO

IF OBJECT_ID('sp_Link_Textbook_Author') IS NOT NULL
	DROP PROC sp_Link_Textbook_Author
GO
IF OBJECT_ID('sp_Link_Course_Professor') IS NOT NULL
	DROP PROC sp_Link_Course_Professor
GO

IF OBJECT_ID('sp_IorFCourse') IS NOT NULL
	DROP PROC sp_IorFCourse
GO

IF OBJECT_ID('sp_IorFProfessor') IS NOT NULL
	DROP PROC sp_IorFProfessor
GO

IF OBJECT_ID('sp_IorFDegreeLevel') IS NOT NULL
	DROP PROC sp_IorFDegreeLevel
GO

IF OBJECT_ID('sp_IorF_SLODesctription') IS NOT NULL
	DROP PROC sp_IorF_SLODesctription
GO

IF OBJECT_ID('sp_IorFCourse_Textbook') IS NOT NULL
	DROP PROC sp_IorFCourse_Textbook
GO

IF OBJECT_ID('sp_IorFSLO') IS NOT NULL
	DROP PROC sp_IorFSLO
GO
--********************************************************************************************
--************* TEXT BOOK RELATED STORED PROCS ***********************************************
--********************************************************************************************

CREATE PROC sp_IorFCourse
(
	@Title		VARCHAR(128),
	@Number		INT,
	@LecH		INT,
	@LabH		INT,
	@Credits	INT,
	@Desc		VARCHAR(2048),
	@Goals		VARCHAR(2048),
	@Topics		VARCHAR(2048),
	@deptID		INT,
	@CoordID	INT
)
AS
BEGIN
	CREATE TABLE #output 
	(
		CourseID INT
	);
	DECLARE @CourseID INT; 
	(SELECT @CourseID = CourseID FROM Course WHERE DepartmentID = @deptID AND CoordinatorID = @CoordID AND Number = @Number);
	IF @CourseID IS NULL OR @CourseID <= 0
	BEGIN
		INSERT INTO [CSET_ABET_DB]..[Course]
		([Title], [Number], [Lecture Hours], [Lab Hours], [Credits], [Description], [Goals], [Topics], [DepartmentID], [CoordinatorID])
		OUTPUT inserted.CourseID INTO #output
		VALUES(@Title, @Number, @LecH, @LabH, @Credits, @Desc, @Goals, @Topics, @deptID, @CoordID);
		Select @CourseID = CourseID FROM #output;
	END
	RETURN @CourseID
END;
GO

CREATE PROC sp_Link_Textbook_Author
(
	@AuthorID		INT,
	@TextbookID		INT 
)
AS 
BEGIN
	CREATE TABLE #output 
	(
		Textbook_AuthorID INT
	);
	DECLARE @Textbook_AuthorID	INT,
			@Author				INT,
			@Textbook			INT;

	(SELECT TOP 1 @Textbook_AuthorID = TextbookAuthorID FROM Textbook_Author WHERE AuthorID = @AuthorID AND TextbookID = @TextbookID);
	IF (@Textbook_AuthorID <= 0 OR @Textbook_AuthorID IS NULL)
	BEGIN
		INSERT INTO [CSET_ABET_DB]..[Textbook_Author]
		(AuthorID, TextbookID)
		OUTPUT inserted.TextbookAuthorID INTO #output
		VALUES(@AuthorID, @TextbookID);
		SELECT TOP 1 @Textbook_AuthorID = Textbook_AuthorID FROM #output;
	END
	DROP TABLE #output;
	RETURN @Textbook_AuthorID;
END;
GO
-- insert or find publisherID with publisher name
CREATE PROC sp_IorFPublisher
(
	@PublisherName VARCHAR(128)
)
AS 
BEGIN
	CREATE TABLE #output 
	(
		PublisherID INT
	);
	DECLARE @PublisherID INT;
	SELECT TOP 1 @PublisherID = PublisherID FROM [CSET_ABET_DB]..[Publisher] WHERE PublisherName = @PublisherName;
	IF (@PublisherID IS NULL OR @PublisherID <= 0)
	BEGIN
		INSERT INTO [CSET_ABET_DB]..[Publisher]
		(PublisherName)
		OUTPUT inserted.PublisherID INTO #output
		VALUES(@PublisherName);
		SELECT @PublisherID = PublisherID FROM #output;
	END
	DROP TABLE #output;
	RETURN @PublisherID;
END;
GO
--insert or find Textbook
CREATE PROC sp_IorFTextbook
(
	@PublisherName	VARCHAR(128),
	@Title			VARCHAR(128),
	@ISBN			VARCHAR(20),
	@PublishDate	DATE
)
AS 
BEGIN
	DECLARE @PubID INT;
	EXEC @PubID = sp_IorFPublisher @PublisherName;
	CREATE TABLE #output 
	(
		TextbookID INT
	);
	DECLARE @TextbookID INT;
	SET @TextbookID = NULL;
	
	SELECT TOP 1 @TextbookID = TextbookID FROM [CSET_ABET_DB]..[Textbook] WHERE Title = @Title AND PublisherID = @PubID;
	IF (@TextbookID IS NULL OR @TextbookID <= 0)
	BEGIN
		INSERT INTO [CSET_ABET_DB]..[Textbook]
		(PublisherID, Title, ISBN, PublishDate)
		OUTPUT inserted.TextbookID INTO #output
		VALUES(@PubID, @Title, @ISBN, @PublishDate);
		SET @TextbookID = (SELECT TextbookID FROM #output);
	END
	DROP TABLE #output;
	RETURN @TextbookID;
END;
GO
CREATE PROC sp_IorFCourse_Textbook
(
	@CourseID INT,
	@TBID INT
)
AS 
BEGIN
	DECLARE @CTBID INT;
	CREATE TABLE #output 
	(
		C_TBID INT
	);
	DECLARE @CourseTextbookID INT;
	
	SELECT TOP 1 @CourseTextbookID = C_TBID FROM [CSET_ABET_DB]..[Course_Textbook] WHERE @CourseID = CourseID AND TBID = @TBID;
	IF (@CourseTextbookID IS NULL OR @CourseTextbookID <= 0)
	BEGIN
		INSERT INTO [CSET_ABET_DB]..[Course_Textbook]
		(CourseID, TBID)
		OUTPUT inserted.C_TBID INTO #output
		VALUES(@CourseID, @TBID);
		SET @CourseTextbookID = (SELECT C_TBID FROM #output);
	END
	DROP TABLE #output;
	RETURN @CourseTextbookID;
END;
GO
-- insert or find Author ID by Author first and last name
CREATE PROC sp_IorFAuthor
(
	@FName VARCHAR(32),
	@LName VARCHAR(32)
)
AS 
BEGIN
	CREATE TABLE #output 
	(
		AuthorID INT
	);
	DECLARE @authorID INT;
	SELECT TOP 1 @authorID = AuthorID FROM [CSET_ABET_DB]..[Author] WHERE FName = @FName AND LName = @LName;
	IF (@authorID IS NULL OR @authorID <= 0)
	BEGIN
		INSERT INTO [CSET_ABET_DB]..[Author]
		(FName,LName)
		OUTPUT inserted.AuthorID INTO #output
		VALUES(@FName, @LName);
		SET @authorID = (SELECT AuthorID FROM #output);
	END
	DROP TABLE #output;
	RETURN @authorID;
END;
GO
--insert or find Textbook_Author
CREATE PROC sp_IorFTextbook_Author
(
	@PublisherName	VARCHAR(128),
	@Title			VARCHAR(128),
	@ISBN			VARCHAR(20),
	@PublishDate	DATE, 
	@FName			VARCHAR(32),
	@LName			VARCHAR(32)
)
AS 
BEGIN
	DECLARE @PubID				INT,
			@AuthorID			INT,
			@TextbookID			INT,
			@Textbook_AuthorID	INT;
	EXEC @PubID = sp_IorFPublisher @PublisherName
	EXEC @AuthorID = sp_IorFAuthor @FName, @LName
	EXEC @TextbookID = sp_IorFTextbook @PublisherName, @Title, @ISBN, @PublishDate
	CREATE TABLE #output
	(
		Textbook_AuthorID INT
	);
	SET @Textbook_AuthorID = NULL;
	
	SELECT TOP 1 @Textbook_AuthorID = TextbookAuthorID 
	FROM [CSET_ABET_DB]..[Textbook_Author]	AS TA
	WHERE AuthorID = @AuthorID AND TextbookID = @TextbookID;
	
	IF (@Textbook_AuthorID IS NULL OR @Textbook_AuthorID <= 0)
	BEGIN
		INSERT INTO [CSET_ABET_DB]..[Textbook_Author]
		(TextbookID, AuthorID)
		OUTPUT inserted.TextbookID INTO #output
		VALUES(@TextbookID, @AuthorID);
		SET @Textbook_AuthorID = (SELECT Textbook_AuthorID FROM #output);
	END
	DROP TABLE #output;
	RETURN @Textbook_AuthorID;
END;
GO
--************* TEXT BOOK RELATED STORED PROCS END ***********************************************
--************************************************************************************************



--************************************************************************************************
--************* PROFESSOR RELATED STORED PROCS ***************************************************
--************************************************************************************************

CREATE PROC sp_IorFProfessor
(
	@FName			VARCHAR(32),
	@LName			VARCHAR(32),
	@BuildID		INT,
	@DeptID			INT,
	@OfficeNumber	INT
)
AS 
BEGIN
	CREATE TABLE #output 
	(
		ProfID INT
	);
	DECLARE @ProfID INT;
	SET @ProfID = NULL;
	
	SELECT TOP 1 @ProfID = ProfessorID FROM [CSET_ABET_DB]..[Professor] WHERE FName = @FName AND LName = @LName;
	IF (@ProfID IS NULL OR @profID <= 0)
	BEGIN
		INSERT INTO [CSET_ABET_DB]..[Professor]
		(FName, LName, DepartmentID, BuildingID, OfficeNumber)
		OUTPUT inserted.ProfessorID INTO #output
		VALUES(@FName, @LName, @DeptID, @BuildID, @OfficeNumber);
		SET @ProfID = (SELECT ProfID FROM #output);
	END
	DROP TABLE #output;
	RETURN @ProfID;
END;
GO
CREATE PROC sp_IorFDepartment
(
	@deptName     VARCHAR(100),
	@deptAbbr     VARCHAR(5)
)
AS
BEGIN
	CREATE TABLE #output 
	(
		DepartmentID INT
	);
	DECLARE @deptID INT;
	SELECT TOP 1 @deptID = DepartmentID FROM [CSET_ABET_DB]..[Department] WHERE DepartmentAbbr = @deptAbbr AND DepartmentName = @deptName;
	IF (@deptID IS NULL OR @deptID <= 0)
	BEGIN
		INSERT INTO [CSET_ABET_DB]..[Department]
		(DepartmentName,DepartmentAbbr)
		OUTPUT inserted.DepartmentID INTO #output
		VALUES(@deptName, @deptAbbr);
		SET @deptID = (SELECT DepartmentID FROM #output);
	END
	DROP TABLE #output;
	RETURN @deptID;
END;
GO
CREATE PROC sp_Link_Course_Professor
(
	@CourseID		INT,
	@ProfessorID	INT 
)
AS 
BEGIN
	CREATE TABLE #output 
	(
		C_PID INT
	);
	DECLARE @Course_ProfessorID	INT,
			@Course				INT,
			@Professor			INT;

	(SELECT TOP 1 @Course_ProfessorID = C_PID FROM Course_Professor WHERE CourseID = @CourseID AND ProfessorID = @ProfessorID);
	IF (@Course_ProfessorID <= 0 OR @Course_ProfessorID IS NULL)
	BEGIN
		INSERT INTO [CSET_ABET_DB]..[Course_Professor]
		(CourseID, ProfessorID)
		OUTPUT inserted.C_PID INTO #output
		VALUES(@CourseID, @ProfessorID);
		SELECT TOP 1 @Course_ProfessorID = C_PID FROM #output;
	END
	DROP TABLE #output;
	RETURN @Course_ProfessorID;
END;
GO
CREATE PROC sp_IorFBuilding
(
	@BuildingName     VARCHAR(100),
	@BuildingAbbr     VARCHAR(5)
)
AS
BEGIN
	CREATE TABLE #output 
	(
		BuildingID INT
	);
	DECLARE @BuildingID INT;
	SELECT TOP 1 @BuildingID = BuildingID FROM [CSET_ABET_DB]..[Building] WHERE BuildingAbbr = @BuildingAbbr AND BuildingName = @BuildingName;
	IF (@BuildingID IS NULL OR @BuildingID <= 0)
	BEGIN
		INSERT INTO [CSET_ABET_DB]..Building
		(BuildingName,BuildingAbbr)
		OUTPUT inserted.BuildingID INTO #output
		VALUES(@BuildingName, @BuildingAbbr);
		SET @BuildingID = (SELECT BuildingID FROM #output);
	END
	DROP TABLE #output;
	RETURN @BuildingID;
END;
GO
--************* PROFESSOR RELATED STORED PROCS END ***********************************************
--************************************************************************************************



--************************************************************************************************
--************* STUDENT LEARNING OUTCOMES RELATED STORED PROCS ***********************************
--************************************************************************************************
CREATE PROC sp_IorFDegree
(
	@degreeName     VARCHAR(100),
	@degreeAbbr     VARCHAR(5)
)
AS
BEGIN

CREATE TABLE #output 
(
	DegreeID INT
);
DECLARE @degreeID INT;

SELECT TOP 1 @degreeID = DegreeID FROM [CSET_ABET_DB]..[Degree] WHERE DegreeAbbr = @degreeAbbr AND DegreeName = @degreeName;
IF (@degreeID IS NULL OR @degreeID <= 0)
BEGIN
	INSERT INTO [CSET_ABET_DB]..[Degree]
	(DegreeName,DegreeAbbr)
	OUTPUT inserted.DegreeID INTO #output
	VALUES(@degreeName, @degreeAbbr);
	SET @degreeID = (SELECT DegreeID FROM #output);
END
DROP TABLE #output;
RETURN @degreeID;
END;
GO

CREATE PROC sp_IorF_SLODesctription
(
	@Desc     VARCHAR(512)
)
AS
BEGIN

CREATE TABLE #output 
(
	SLODescID INT
);
DECLARE @SLODescID INT;

SELECT TOP 1 @SLODescID = SLODescID FROM [CSET_ABET_DB]..[SLODescription] WHERE [Description] = @Desc;
IF (@SLODescID IS NULL OR @SLODescID <= 0)
BEGIN
	INSERT INTO [CSET_ABET_DB]..[SLODescription]
	([Description])
	OUTPUT inserted.SLODescID INTO #output
	VALUES(@Desc);
	SET @SLODescID = (SELECT SLODescID FROM #output);
END
DROP TABLE #output;
RETURN @SLODescID;
END;
GO

CREATE PROC sp_IorFDegreeLevel
(
	@degreeLevel     VARCHAR(4)
)
AS
BEGIN

CREATE TABLE #output 
(
	DegreeLvlID INT
);
DECLARE @degreeLVLID INT;

SELECT TOP 1 @degreeLVLID = DegreeLevelID FROM [CSET_ABET_DB]..[DegreeLevel] WHERE DegreeLevel = @degreeLevel;
IF (@degreeLVLID IS NULL OR @degreeLVLID <= 0)
BEGIN
	INSERT INTO [CSET_ABET_DB]..[DegreeLevel]
	(DegreeLevel)
	OUTPUT inserted.DegreeLevelID INTO #output
	VALUES(@degreeLevel);
	SET @degreeLVLID = (SELECT DegreeLvlID FROM #output);
END
DROP TABLE #output;
RETURN @degreeLvlID;
END;
GO

CREATE PROC sp_IorFSLO
(
	@SLODescID INT, 
	@DegreeID INT,
	@DegreeLevelID INT 
)
AS
BEGIN

CREATE TABLE #output 
(
	SloID INT
);
DECLARE @SloID INT;

SELECT TOP 1 @SloID = DegreeLevelID FROM [CSET_ABET_DB]..[SLO] WHERE @SLODescID = SLODescID AND DegreeID = @DegreeID AND DegreeLevelID = @DegreeLevelID;
IF (@SloID IS NULL OR @SloID <= 0)
BEGIN
	INSERT INTO [CSET_ABET_DB]..[SLO]
	(SLODescID, DegreeID, DegreeLevelID)
	OUTPUT inserted.SloID INTO #output
	VALUES(@SLODescID, @DegreeID, @DegreeLevelID);
	SET @SloID = (SELECT SloID FROM #output);
END
DROP TABLE #output;
RETURN @SloID;
END;
GO
--************* STUDENT LEARNING OUTCOMES RELATED STORED PROCS END *******************************
--************************************************************************************************





--************************************************************************************************
--************* Co/Pre-Requisite RELATED STORED PROCS ********************************************
--************************************************************************************************
CREATE PROC sp_IorFReqComment
(
	@comment VARCHAR(256)
)
AS
BEGIN

CREATE TABLE #output 
(
	[CommentID] INT
);
DECLARE @commentID INT;
SELECT TOP 1 @commentID = CommentID FROM [CSET_ABET_DB]..[ReqComment] WHERE Comment = @comment;
IF (@commentID IS NULL OR @commentID <= 0)
BEGIN
	INSERT INTO [CSET_ABET_DB]..[ReqComment]
	(Comment)
	OUTPUT inserted.CommentID INTO #output
	VALUES(@comment);
	SET @commentID = (SELECT CommentID FROM #output);
END
DROP TABLE #output;
RETURN @commentID;
END;
GO


CREATE FUNCTION fnGetCourseLink
(
	@coursedepartmentabr VARCHAR(5),
	@coursenumber INT
)
RETURNS INT
AS
BEGIN
DECLARE @courselink INT = NULL;
SET @courselink = (SELECT CourseID 
				FROM [CSET_ABET_DB]..[Course] as course
				JOIN [CSET_ABET_DB]..[Department] as dept
				ON course.DepartmentID =  dept.DepartmentID
				WHERE dept.DepartmentAbbr = @coursedepartmentabr AND course.Number = @coursenumber);
RETURN @courselink; 
END;
GO

CREATE PROC sp_IorFReqType
(
	@type VARCHAR(64),
	@courselink INT
)
AS
BEGIN

CREATE TABLE #output 
(
	[ReqTypeID] INT
);

DECLARE @typeID INT;
SELECT TOP 1 @typeID = ReqTypeID FROM [CSET_ABET_DB]..[ReqType] WHERE RequirementType = @type;
IF (@typeID IS NULL OR @typeID <= 0)
BEGIN
	INSERT INTO [CSET_ABET_DB]..[ReqType]
	(RequirementType, CourseLink)
	OUTPUT inserted.ReqTypeID INTO #output
	VALUES(@type, @courselink);
	SET @typeID = (SELECT ReqTypeID FROM #output);
END
RETURN @typeID;
DROP TABLE #output;
END;
GO

CREATE PROC sp_IorFRequisite
(
	@deptName     VARCHAR(100),
	@deptAbbr     VARCHAR(5),
	@courseNumber INT,
	@reqSubType   VARCHAR(64),
	@reqcomment   VARCHAR(256)
)
AS
BEGIN

DECLARE @courselink INT = NULL;
DECLARE @deptid INT = NULL;
DECLARE @reqtypeID INT = NULL;
DECLARE @reqcommentID INT = NULL;
DECLARE @reqID INT = -1;

EXEC @deptid = sp_IorFDepartment @deptName, @deptAbbr;
PRINT @deptid;

SET @courselink = dbo.fnGetCourseLink(@deptAbbr, @courseNumber);
if(@courselink IS NULL)
BEGIN
PRINT 'Course Linke was null';
END

EXEC @reqtypeID = sp_IorFReqType @reqSubType, @courselink;
print @reqtypeID;

EXEC @reqcommentID = sp_IorFReqComment @reqcomment;
print @reqcommentID;


CREATE TABLE #output 
(
	RequisiteID INT
);


SELECT TOP 1 @reqID = RequisiteID FROM [CSET_ABET_DB]..[Requisite] AS department  WHERE TypeID = @reqtypeID AND CommentID = @reqcommentID;
IF (@reqID <= 0 OR @reqID IS NULL)
BEGIN
	INSERT INTO [CSET_ABET_DB]..[Requisite]
	(TypeID,CommentID)
	OUTPUT inserted.RequisiteID INTO #output
	VALUES(@reqtypeID, @reqcommentID);
	SET @reqID = (SELECT RequisiteID FROM #output);
END
DROP TABLE #output;
RETURN @reqID;
END;
GO
USE master
--************* Co/Pre-Requisite RELATED STORED PROCS END ****************************************
--************************************************************************************************