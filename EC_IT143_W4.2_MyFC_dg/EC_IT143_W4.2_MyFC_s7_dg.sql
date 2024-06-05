/*MyFC*/

CREATE PROCEDURE  dbo.PC_NPLAYERSNAMEDSANTIAGO 
AS
/***************************************************************************************************************
NAME:dbo.PC_NPLAYERNAMESANTIAGO

PURPOSE:CREATE PROCEDURE


MODIFICATION LOG:

Ver     Date        Author          Description 
----    ------      --------        --------------------------------
1.0     05/28/2022  Dwight          Build the script for IT143



RUTIME:
1s

NOTES:
The script exist to help me learn step 4 of 8 in the Answer Focused Approach for T-SQL Data Manipulation 

*******************************************************************************************************************/
--Step7: Turn the Ad Hoc SQL script in a stored procedure 

--DROP PROCEDURE IF EXISTS dbo.PC_NPLAYERSNAMEDSANTIAGO;
--GO

  BEGIN 


--1) Load the table 
 
 TRUNCATE TABLE dbo.T_NPLAYERSNAMEDSANTIAGO 

 INSERT INTO dbo.T_NPLAYERSNAMEDSANTIAGO
 SELECT N.Text,N.NUMBEROFSANTIAGO
 FROM   dbo.V_NPLAYERSNAMEDSANTIAGO AS N; 

  --2) Review the result

 SELECT J.* 
 FROM dbo.T_NPLAYERSNAMEDSANTIAGO AS J;
 
END;
GO