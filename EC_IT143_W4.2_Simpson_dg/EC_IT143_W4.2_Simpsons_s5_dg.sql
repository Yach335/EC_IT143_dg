--Q: What is Homer Simpson Home Address ?

--A: Let's query that using SQL 

--s5
 select *
 into T_home_address
 from V_home_address;
 
 --
 DROP TABLE IF EXISTS T_home_address;
 GO

 CREATE TABLE T_home_address
 (H_address varchar(30) not null,
  F_name varchar(25) not null);
 GO