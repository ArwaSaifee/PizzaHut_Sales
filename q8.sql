-- Join the relevant tables to find the category wise distribution of pizza
select
	category,
    count(name)
from 
	pizza_types
group by 
	category