-- Analyze the cumulative revenue generated over time
select 
	order_date,
	round(sum(revenue) over(order by order_date),2) as revenue
from
(select 
	orders.order_date,
    sum(order_details.quantity * pizzas.price) as revenue
from 
	order_details
join 
	orders
on orders.order_id = order_details.order_id
join 
	pizzas
on pizzas.pizza_id = order_details.pizza_id
group by 
	orders.order_date) as subquery