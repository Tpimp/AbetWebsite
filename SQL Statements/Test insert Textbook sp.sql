USE CSET_ABET_DB;
GO

DECLARE @PublisherName	VARCHAR(128),
		@Title			VARCHAR(128),
		@ISBN			VARCHAR(20),
		@PublishDate	DATE,
		@FName			VARCHAR(32),
		@LName			VARCHAR(32),
		@Author			INT;
DECLARE	@PublisherID	INT;
SET @PublisherName = 'Mike Murach & Associates, Inc.';
SET @Title = 'Murach''s SQL Server 2012 for Developers';
SET @ISBN = 'ISBN111'
SET @PublishDate = GETDATE();
SET @FName = 'Joel'
SET @LName = 'Murach';


DECLARE @returnVal	INT; 
EXEC @returnval = sp_IorFTextbook_Author @PublisherName, @Title, @ISBN, @PublishDate, @FName, @LName;
PRINT @returnval;
SET @FName = 'Bryan';
SET @LName = 'Syverson';
EXEC @Author = sp_IorFAuthor @FName, @LName;
EXEC @returnval = sp_Link_Textbook_Author @Author, 1;
PRINT @returnval;
GO

Select Title, PublisherName, Fname, LName
FROM [CSET_ABET_DB]..[Textbook_Author]	AS TA
	JOIN [CSET_ABET_DB]..[Textbook]		AS T
	ON TA.TextbookID = T.TextbookID
	JOIN [CSET_ABET_DB]..[Author]		AS A
	ON TA.AuthorID = A.AuthorID
	JOIN Publisher						AS P
	ON T.PublisherID = P.PublisherID;
GO

use master