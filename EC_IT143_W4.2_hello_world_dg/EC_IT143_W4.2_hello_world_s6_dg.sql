-- Q: What is the current date and time ?

-- A: Let's ask SQL server and find out...

-- 1) Reload data 

TRUNCATE TABLE dbo.t_hello_world;

INSERT INTO dbo.t_hello_world
select v.my_message, 
       v.current_date_time, 
From dbo.v_hello_world_load As v ;

 -- 2) Review result 

select t.*
From dbo.t_hello_world_load AS t;