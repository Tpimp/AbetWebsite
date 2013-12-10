USE CSET_ABET_DB
GO

IF OBJECT_ID('sp_IOrFAuthor') IS NOT NULL
	DROP PROC sp_IOrFAuthor;
GO

CREATE PROC sp_IOrFAuthor
(
	@FName VARCHAR(32),
	@LName VARCHAR(32)
)
AS 
BEGIN
DECLARE @AuthorID INT
SET @AuthorID = (SELECT AuthorID FROM Author WHERE FName = @FName and LName = @LName);
IF @AuthorID IS NULL OR @AuthorID = -1
BEGIN
	INSERT INTO Author(FName, LName) VALUES (@FName, @LName);
	SET @AuthorID = (SELECT AuthorID FROM Author WHERE FName = @FName and LName = @LName);
END
RETURN @AuthorID
END
GO
DECLARE @ret INT;
EXEC @ret = sp_IOrFAuthor 'foo', 'bar'
PRINT(CAST (@ret AS VARCHAR(2)))
GO
Select FName, LName
FROM Author
