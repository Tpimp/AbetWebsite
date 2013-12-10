USE CSET_ABET_DB;
GO

BEGIN
DECLARE @FName  VARCHAR(32);
DECLARE @LName  VARCHAR(32);


SET @FName  = 'Joel';
SET @LName = 'Murach';


DECLARE @returnVal INT;
EXEC @returnval =  sp_IorFAuthor @FName, @LName;
PRINT @returnval;
END;