 /*MyFC*/

--Step6: Load the table from the view using Ad Hoc SQL script

 --1) Load the table 
 
 TRUNCATE TABLE dbo.T_NPLAYERSNAMEDSANTIAGO 

 INSERT INTO dbo.T_NPLAYERSNAMEDSANTIAGO
 SELECT N.Text,N.NUMBEROFSANTIAGO
 FROM  dbo.V_NPLAYERSNAMEDSANTIAGO AS N; 

  --2) Review the result

 SELECT J.* 
 FROM dbo.T_NPLAYERSNAMEDSANTIAGO AS J;
 
