-- What is the most popular opening code? BLACK A00 - 570times, WHITE C00 - 417times.

with 
white_opener as
(
	select 
		opening_code
		,count(distinct game_id)   as most_popular_opener_move_w
	from chess c 
	where winner = ('White')
	group by 1
),
black_opener as
(
select 
	opening_code
	,count(distinct game_id) 		as most_popular_opener_move_b
from chess c 
where winner = ('Black')
group by 1
)
select 
	wo.opening_code
	,wo.most_popular_opener_move_w
	,bo.most_popular_opener_move_b
from white_opener wo
inner join		black_opener bo 	on	wo.opening_code = bo.opening_code
order by wo.most_popular_opener_move_w desc ,bo.most_popular_opener_move_b desc
 


