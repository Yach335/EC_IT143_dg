--Q: What is Homer Simpson Home Address ?

--A: Let's query that using SQL 

--s4
 DROP VIEW IF EXISTS V_homer_address;
 GO
 
 CREATE VIEW V_homer_address
 AS

 Select First_Name, Home_Address
 From Family_Data
 Where First_Name = 'Homer';