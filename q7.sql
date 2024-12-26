-- determine the distribution of orders by the hours of the day
select
	extract(hour from order_time) as time_of_day,
	count(order_id)
from 
	orders
group by 
	time_of_day
    
    