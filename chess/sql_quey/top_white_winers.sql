with 
white_wins as
(
select
	white_id 
	,winner 
	,count(winner) as total_wins_w
from chess c 
group by 1, 2
having winner = 'White'
),
black_wins as 
(
select
	black_id  
	,winner 
	,count(winner) 	as total_wins_b 
from chess c 
group by 1, 2
having winner = 'Black'
)
select
	ww.winner
	,ww.white_id as	white_id
	,ww.total_wins_w
	,dense_rank () over
		(order by ww.total_wins_w desc) as winner_ranking
from white_wins ww
limit 5

