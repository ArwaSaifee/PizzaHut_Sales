-- Group the orders by date and calculate the average number of pizzas ordered per day
select round(avg(quantity),0) as pizza_ordered_per_day
from (select 
	order_date,
    sum(quantity) as quantity 
from 
	order_details
join 
	orders
on order_details.order_id = orders.order_id
group by 
	order_date) as subquery
