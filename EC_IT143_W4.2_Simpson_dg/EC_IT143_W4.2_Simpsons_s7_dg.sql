--Q: What is Homer Simpson Home Address ?

--A: Let's query that using SQL 

--s7

CREATE PROCEDURE PC_home_address;

BEGIN 
--Load data

TRUNCATE TABLE T_home_address;

INSERT INTO T_home_address
Select *
From V_homer_address

--Review result 
Select H.*
From T_home_address as H

END;
GO