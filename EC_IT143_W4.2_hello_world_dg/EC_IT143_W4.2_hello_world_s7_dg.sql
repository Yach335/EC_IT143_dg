
CREATE PROCEDURE dbo._usp_hello_world_load
AS 

/***************************************************************************************************************
NAME:dbo.v_hello_world_load
PURPOSE:Create the Hello World - Load view


MODIFICATION LOG:

Ver     Date        Author          Description 
----    ------      --------        --------------------------------
1.0     05/28/2022  Dwight          Build the script for IT143



RUTIME:
1s

NOTES:
The script exist to help me learn step 4 of 8 in the Answer Focused Approach for T-SQL Data Manipulation 

*******************************************************************************************************************/

BEGIN

-- 1) Reload data 

TRUNCATE TABLE dbo.t_hello_world;

INSERT INTO dbo.t_hello_world
select v.my_message, 
       v.current_date_time 
From dbo.v_hello_world_load As v ;

 -- 2) Review result 

select t.*
From dbo.t_hello_world_load AS t;

END;
GO