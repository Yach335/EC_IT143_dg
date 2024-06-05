/*MyFC*/

--Q: How many player are called SANTIAGO in this soccer team 

--A: Let check that information in our database 

--Step3: create an Ad Hoc SQL query 

Select 'This is the number of player with the name SANTIAGO' AS Text, COUNT(pl_name) AS NUMBEROFSANTIAGO
From dbo.tblPlayerDim
Where pl_name Like '%SANTIAGO%' 
