with 
taranga_wins_w as
(
	select 
		game_id 
	    ,case  when  white_rating - black_rating > 1 then  1 else  0 end  as  higherRankWhiteWins
	from chess c 
	where white_id = ('taranga') 
),
total_games_w as
(
	select 
	     count(game_id) 	as total
		 from chess c 
	 where white_id = ('taranga')
),
taranga_wins_b as
(
	select 
		game_id 
	    ,case  when  black_rating - white_rating > 1 then  1 else  0 end  					as  higherRankBlackWins
	from chess c 
	where black_id = ('taranga') 
),
total_games_b as
(
	select 
	     count(game_id) 	as total
		 from chess c 
	 where black_id = ('taranga')
)
select 
	round(sum(higherRankWhiteWins) / 72 *100, 2) 									as tarangaAsWhiteWonWhenHigherRankPercentage
	,(select round(sum(higherRankBlackWins) / 82 *100, 2) from taranga_wins_b)  	as tarangaAsBlackWonWhenHigherRankPercentage 
from taranga_wins_w tww


