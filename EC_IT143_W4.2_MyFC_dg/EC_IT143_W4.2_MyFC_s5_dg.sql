/*MyFC*/

--Q: How many player are called SANTIAGO in this soccer team 

--A: Let check that information in our database 

--Step5: Turn the view into a table

DROP VIEW IF EXISTS dbo.V_NPLAYERSNAMEDSANTIAGO; 
GO

DROP TABLE IF EXISTS dbo.T_NPLAYERSNAMEDSANTIAGO;
GO


CREATE VIEW dbo.V_NPLAYERSNAMEDSANTIAGO 
AS
/***************************************************************************************************************
NAME:dbo.T_NPLAYERNAMESANTIAGO

PURPOSE:Turn view into table


MODIFICATION LOG:

Ver     Date        Author          Description 
----    ------      --------        --------------------------------
1.0     05/28/2022  Dwight          Build the script for IT143



RUTIME:
1s

NOTES:
The script exist to help me learn step 4 of 8 in the Answer Focused Approach for T-SQL Data Manipulation 

*******************************************************************************************************************/


Select 'This is the number of player with the name SANTIAGO' AS Text, COUNT(pl_name) AS NUMBEROFSANTIAGO
From dbo.tblPlayerDim
Where pl_name Like '%SANTIAGO%';
GO
--------------------------------------------------------------------------5)

select N.Text,N.NUMBEROFSANTIAGO
INTO dbo.T_NPLAYERSNAMEDSANTIAGO
FROM dbo.V_NPLAYERSNAMEDSANTIAGO AS N;

---------------------------------------------------------------------------

DROP TABLE IF EXISTS dbo.T_NPLAYERSNAMEDSANTIAGO;
GO

CREATE TABLE dbo.T_NPLAYERSNAMEDSANTIAGO
(Text varchar(70) not null,
 NUMBEROFSANTIAGO int not null);
GO
