-- Determine the top 3 most ordered pizza types based on revenue for each pizza category 
select 
	category,
    name,
    revenue,
    rn
from
(select 
	category,
    name,
    rank() over(partition by category order by revenue desc) as rn,
    revenue
from
(select 
	pizza_types.category,
    pizza_types.name,
    sum(order_details.quantity * pizzas.price) as revenue
from 
	order_details
join 
	pizzas
on order_details.pizza_id = pizzas.pizza_id
join 
	pizza_types
on pizzas.pizza_type_id = pizza_types.pizza_type_id
group by 
	pizza_types.category,
    pizza_types.name
) as subquery) as a
where 
	rn <= 3
    
