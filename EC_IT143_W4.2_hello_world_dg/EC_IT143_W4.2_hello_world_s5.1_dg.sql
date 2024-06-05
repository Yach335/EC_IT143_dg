-- Q: What is the current date and time?

-- Let's ask SQL server and find out... 

select v.my_message, 
       v.current_date_time, 
From dbo.v_hello_world_load As v ;