-- calculate the total revenue generated from pizza sales 
SELECT 
    ROUND(SUM(quantity * price), 2)
FROM
    order_details
        LEFT JOIN
    pizzas ON order_details.pizza_id = pizzas.pizza_id