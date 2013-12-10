USE CSET_ABET_DB
GO
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'users')
	DROP TABLE users;
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Course_ReqDeg')
	DROP TABLE Course_ReqDeg;
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Course_Textbook')
	DROP TABLE Course_Textbook
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Course_Requisites')
	DROP TABLE Course_Requisites;
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Course_ElectDeg')
	DROP TABLE Course_ElectDeg;
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Course_PreRequisites')
	DROP TABLE Course_PreRequisites;
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'ReqTyps')
	DROP TABLE ReqTyps;
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Course_SLO')
	DROP TABLE Course_SLO
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Course_Professor')
	DROP TABLE Course_Professor
IF EXISTS (SELECT * FROM sys.objects WHERE name = 'Requisite' AND TYPE = 'u')
	DROP TABLE Requisite
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'ReqComment')
	DROP TABLE ReqComment
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'ReqType')
	DROP TABLE ReqType;
IF EXISTS (SELECT * FROM sys.objects WHERE name = 'Course' AND TYPE = 'u')
	DROP TABLE Course
IF EXISTS (SELECT * FROM sys.objects WHERE name = 'Textbook_Author' AND TYPE = 'u')
	DROP TABLE Textbook_Author
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Textbook')
	DROP TABLE Textbook
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Author')
	DROP TABLE Author
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Publisher')
	DROP TABLE Publisher
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Professor')
	DROP TABLE Professor
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'CourseNumber')
	DROP TABLE CourseNumber
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Department')
	DROP TABLE Department
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'SLO')
	DROP TABLE SLO
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'SLODescription')
	DROP TABLE SLODescription
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'CourseDescription')
	DROP TABLE CourseDescription
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Degree')
	DROP TABLE Degree
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'DegreeLevel')
	DROP TABLE DegreeLevel
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Requisite')
	DROP TABLE Requisite
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'ReqComment')
	DROP TABLE ReqComment
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Building')
	DROP TABLE Building
GO

USE master
GO
IF DB_ID('CSET_ABET_DB') IS NOT NULL
	DROP DATABASE [CSET_ABET_DB]
GO

IF DB_ID('CSET_ABET_DB') IS NULL
BEGIN
	CREATE DATABASE CSET_ABET_DB
END
ELSE 
	print 'CSET_ABET_DB already exists.'
GO


USE CSET_ABET_DB;

CREATE TABLE Building
(
	BuildingID		INT IDENTITY
					CONSTRAINT PK_BuildingID Primary Key,
	BuildingName	VARCHAR(128) 
					CONSTRAINT NN_BuildingName NOT NULL,
	BuildingAbbr	VARCHAR(2) 
					CONSTRAINT NN_BuildingAbbr NOT NULL
)
-- TEXTBOOK HUB --
CREATE TABLE Publisher
(
	[PublisherID]   INT   IDENTITY 
						CONSTRAINT PK_Publisher_ID PRIMARY KEY,
	[PublisherName] VARCHAR(128) 
						CONSTRAINT NN_PublisherName NOT NULL DEFAULT ''
);

CREATE TABLE users
(
	UserID	INT IDENTITY CONSTRAINT PK_UserID PRIMARY KEY,
	UserName VARCHAR (64) CONSTRAINT UNIQUE_USERNAME UNIQUE,
	Password	VARCHAR (64) CONSTRAINT NN_Password NOT NULL 
);

CREATE TABLE Textbook
(
	[TextbookID]	INT IDENTITY	
						CONSTRAINT PK_TextbookID	Primary Key,
	[PublisherID]	INT				
						CONSTRAINT FK_TB_Published_ID	REFERENCES Publisher (PublisherID),
	[Title]			VARCHAR(128)	
						CONSTRAINT NN_TextbookTitle NOT NULL DEFAULT '',
	[ISBN]			VARCHAR(20)		
						CONSTRAINT NN_AuthorLName	NOT NULL DEFAULT '',
	[PublishDate]	DATE			
						CONSTRAINT NN_PublishDate	NOT NULL DEFAULT GETDATE()  
);
CREATE TABLE Author
(
	[AuthorID]	INT	IDENTITY 
					CONSTRAINT PK_AuthorID		Primary Key,
	[FName]		VARCHAR(32) 
					CONSTRAINT NN_AuthorFName	NOT NULL DEFAULT '',
	[LName]		VARCHAR(32) 
					CONSTRAINT NN_AuthorLName	NOT NULL DEFAULT ''
);
CREATE TABLE Textbook_Author
(
	[TextbookAuthorID]	INT IDENTITY 
							CONSTRAINT PK_TextBookAuthorID	Primary Key(TextbookID,AuthorID),
	[TextbookID]		INT	       
							CONSTRAINT FK_TBA_TextBookID	REFERENCES Textbook(TextbookID),
	[AuthorID]			INT	       
							CONSTRAINT FK_TBA_AuthorID		REFERENCES Author(AuthorID)
);
-- SLO HUB --
CREATE TABLE DegreeLevel
(
	[DegreeLevelID]	INT IDENTITY	
						CONSTRAINT PK_DegreeLevelID Primary Key,
	[DegreeLevel]	VARCHAR(4)		
						CONSTRAINT NN_DegreeLevel	NOT NULL
)
CREATE TABLE Degree
(
	[DegreeID]	INT IDENTITY	
					CONSTRAINT PK_DegreeID Primary Key,
	[DegreeName]	VARCHAR(128)		
					CONSTRAINT NN_DegreeName NOT NULL,
	[DegreeAbbr]	VARCHAR(128)		
					CONSTRAINT NN_DegreeAbbr NOT NULL
)
CREATE TABLE SLODescription
(
	[SLODescID]		INT IDENTITY 
						CONSTRAINT PK_SLODescriptionID Primary Key,
	[Description]	VARCHAR(512) 
						CONSTRAINT	NN_CourseDescriptionID NOT NULL
)
CREATE TABLE SLO
(
	[SloID]			INT IDENTITY	
						CONSTRAINT PK_SLOID Primary Key,
	[SLODescID]		INT
						CONSTRAINT FK_SLO_DescID REFERENCES SLODescription([SLODescID]),
	[DegreeID]		INT	
						CONSTRAINT FK_SLO_DegreeID REFERENCES Degree(DegreeID),
	[DegreeLevelID]	INT	
						CONSTRAINT FK_SLO_DegreeLevelID REFERENCES DegreeLevel(DegreeLevelID)
)
-- COURSE HUB --
CREATE TABLE Department
(
	[DepartmentID]	INT IDENTITY	
					CONSTRAINT PK_DepartmentID	Primary Key,
	[DepartmentName]	VARCHAR(128)
					CONSTRAINT NN_DepartmentName	NOT NULL,
	[DepartmentAbbr]	VARCHAR(5)
					CONSTRAINT NN_DepartmentAbbr	NOT NULL
)
CREATE TABLE Professor
(
	[ProfessorID]	INT IDENTITY	
						CONSTRAINT PK_ProfessorID Primary Key,
	[FName]			VARCHAR(64)		
						CONSTRAINT NN_Prof_FName NOT NULL,
	[LName]			VARCHAR(64)		
						CONSTRAINT NN_Prof_LName NOT NULL,
	[DepartmentID]	INT			
						CONSTRAINT FK_Prof_DepartmentID 
						REFERENCES Department(DepartmentID),
	[BuildingID]	INT CONSTRAINT FK_Prof_BuildingID
						REFERENCES Building(BuildingID),
	[OfficeNumber]  INT CONSTRAINT NN_OfficeNumber NOT NULL
)

CREATE TABLE Course
(
	[CourseID]		INT IDENTITY	 
						CONSTRAINT PK_CourseID Primary Key,
	[Title]			VARCHAR(128)	
						CONSTRAINT NN_Title			NOT NULL,
	[Number]		INT			
						CONSTRAINT NN_Number		NOT NULL,
	[Lecture Hours] INT
						CONSTRAINT NN_Lecture		NOT NULL,
	[Lab Hours]     INT
						CONSTRAINT NN_Lab			NOT NULL,
	[Credits]       INT 
						CONSTRAINT NN_Credits		NOT NULL,
	[Description]   VARCHAR(2048) 
						CONSTRAINT NN_Description   NOT NULL,
	[Goals]		    VARCHAR(2048) 
						CONSTRAINT NN_Goals			NOT NULL,
	[Topics]		VARCHAR(2048) 
						CONSTRAINT NN_Goals			NOT NULL,
	[DepartmentID]	INT			
						CONSTRAINT FK_Course_DepartmentID	
						REFERENCES Department(DepartmentID),
	[CoordinatorID] INT			
						CONSTRAINT FK_Course_CoordinatorID	
						REFERENCES Professor(ProfessorID)	
)

CREATE TABLE Course_Textbook
(
	C_TBID	INT IDENTITY
					CONSTRAINT PK_C_TBID PRIMARY KEY,
    CourseID	INT CONSTRAINT FK_C_TB_CourseID 
					REFERENCES Course (CourseID),
	TBID	INT CONSTRAINT FK_C_TBID
					REFERENCES Textbook(TextbookID)
)

CREATE TABLE Course_ReqDeg
(
	C_ReqDegID	INT IDENTITY
					CONSTRAINT PK_C_REQDEGID PRIMARY KEY,
    CourseID	INT CONSTRAINT FK_Course_ReqDegID 
					REFERENCES Course (CourseID),
	DegreeID	INT CONSTRAINT FK_ReqDeg_CourseID
					REFERENCES Degree(DegreeID)
)
CREATE TABLE Course_ElectDeg
(
	C_ElectDegID    INT IDENTITY
					CONSTRAINT PK_C_ELECTDEGID PRIMARY KEY,
    CourseID		INT CONSTRAINT FK_Course_ElecDegID 
			  REFERENCES Course (CourseID) NOT NULL,
	DegreeID INT CONSTRAINT FK_ElecDeg_CourseID
			  REFERENCES Degree(DegreeID) NOT NULL
)
CREATE TABLE Course_Professor
(
	C_PID     INT IDENTITY
		      CONSTRAINT PK_C_PID PRIMARY KEY,
    CourseID  INT CONSTRAINT FK_Course_ProfID 
			  REFERENCES Course (CourseID) NOT NULL,
	ProfessorID INT CONSTRAINT FK_Prof_CourseID
				 REFERENCES Professor(ProfessorID) NOT NULL
)
-- Pre/CoRequisite HUB --
CREATE TABLE ReqType
(
	[ReqTypeID]			INT IDENTITY 
						CONSTRAINT PK_ReqTypeID PRIMARY KEY,
	[RequirementType]	VARCHAR(64)
						CONSTRAINT NN_RequirementType NOT NULL,
	[CourseLink]	INT DEFAULT NULL
)
CREATE TABLE ReqComment
(
	[CommentID]		INT IDENTITY
							CONSTRAINT PK_CommentID PRIMARY KEY,
	[Comment]		VARCHAR(256)
							CONSTRAINT NN_Comment NOT NULL
)
CREATE TABLE Requisite
(
	[RequisiteID]	INT IDENTITY 
						CONSTRAINT PK_RequisiteID Primary Key,

	[CommentID]		INT			
						CONSTRAINT FK_Requisite_CommentID 
						REFERENCES ReqComment(CommentID),
	[TypeID]		INT			
						CONSTRAINT FK_Requisite_ReqType 
						REFERENCES ReqType(ReqTypeID)
)
CREATE TABLE Course_PreRequisites
(
	C_PReqID     INT IDENTITY
				     CONSTRAINT PK_C_PReqID PRIMARY KEY,
    CourseID     INT CONSTRAINT FK_Course_PREQID 
			         REFERENCES Course (CourseID) NOT NULL,
	RequisiteID  INT CONSTRAINT FK_PREQ_CourseID
				     REFERENCES Requisite(RequisiteID) NOT NULL
)
CREATE TABLE Course_Requisites
(
	C_ReqID     INT IDENTITY
		            CONSTRAINT PK_C_ReqID PRIMARY KEY,
    CourseID    INT CONSTRAINT FK_Course_REQID 
			        REFERENCES Course (CourseID) NOT NULL,
	RequisiteID INT CONSTRAINT FK_REQ_CourseID
				    REFERENCES Requisite(RequisiteID) NOT NULL
)
GO
--System Admin
IF DATABASE_PRINCIPAL_ID('db_system_admin') IS NOT NULL
BEGIN
	DROP ROLE db_system_admin
	PRINT 'Dropping system_admin Role'
END
ELSE 
	PRINT 'system_admin Role does not exist.'
GO
IF DATABASE_PRINCIPAL_ID('db_system_admin') IS NULL
BEGIN
	PRINT 'Creating system_admin Role'
	CREATE ROLE db_system_admin
END
IF DATABASE_PRINCIPAL_ID('db_system_admin') IS NOT NULL
	GRANT SELECT, EXECUTE, INSERT, UPDATE
	TO db_system_admin
GO
--Guest
IF DATABASE_PRINCIPAL_ID('db_guest_view') IS NOT NULL
BEGIN
	DROP ROLE db_guest_view
	PRINT 'Removing guest_view'
END
ELSE 
	PRINT 'guest_view role does not exist.'
GO

IF DATABASE_PRINCIPAL_ID('db_guest_view') IS NULL
BEGIN
	print 'Creating guest_view'
	CREATE ROLE db_guest_view;
END
ELSE 
	print 'Unable to create Guest Role'
GO
IF DATABASE_PRINCIPAL_ID('db_guest_view') IS NOT NULL
	GRANT SELECT
	TO db_guest_view

--NEW ONES STARTED FROM SECOND PRESENTATION
--this is a broken method
--Book related indexes
USE CSET_ABET_DB
GO
Create INDEX books_idx ON Textbook (TextbookID);
Create INDEX authors_idx  ON Author (AuthorID); 
Create INDEX publishers_idx  ON Publisher (PublisherID); 

GO
USE master