USE CSET_ABET_DB;
GO

BEGIN
DECLARE @PublisherName  VARCHAR(32);


SET @PublisherName = 'Mike Murach & Associates, Inc.';


DECLARE @returnVal INT;
EXEC @returnval =  sp_IorFPublisher @PublisherName;
PRINT @returnval;
END;

Select *
FROM Publisher
GO
USE master