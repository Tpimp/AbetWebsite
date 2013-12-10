USE CSET_ABET_DB;
GO

BEGIN
DECLARE @buildName  VARCHAR(128);
DECLARE @buildAbbr  VARCHAR(5);

SET @buildName  = 'PervysageVine';
SET @buildAbbr = 'PV';


DECLARE @returnVal INT;
EXEC @returnval =  sp_IorFBuilding @buildName, @buildAbbr;
PRINT @returnval;
END;
GO
SELECT * FROM Building 
GO
USE master