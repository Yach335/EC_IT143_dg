-- Q: What is the current date and time ?

-- A: Let's ask SQL server and find out...

select 'HelloS World' AS my_message, 
        GETDATE() AS current_date_time;