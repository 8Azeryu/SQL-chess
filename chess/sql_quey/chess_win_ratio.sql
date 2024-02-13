-- What percentage of games White won? What percentage was draw?

select 
 	round((select count(winner) from chess c where winner = ('White')) /(select count(game_id)	from chess c) * 100, 2) 		as white_win_percentage
 	,round((select count(winner) from chess c where winner = ('Black')) /(select count(game_id)	from chess c) * 100, 2) 		as black_win_percentage
 	,round((select count(winner) from chess c where winner = ('Draw')) /(select count(game_id)	from chess c) * 100, 2) 		as draw_percentage
from chess c2
limit 1

/*
with 
	total_count						as
(
		select 
			count(game_id) 	 		as total
		from chess c 
	union
		select 
			count(winner) 			as white_win
		from chess c 
			where winner = ('White')
	union 
		select 
			count(winner) 			as black_win
		from chess c 
			where winner = ('Black')
	union 
		select 
			count(winner) 			as draw
		from chess c 
			where winner = ('Draw')
	)
	
*/