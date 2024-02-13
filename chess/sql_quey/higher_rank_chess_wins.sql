-- What percentage chess games, the winner has a higher rank?

with  higher_rank_wins as   
(
    select  
        winner,
        white_rating,
        black_rating,
        case  when  white_rating - black_rating > 1 then  1 else  0 end  as  higherRankWhiteWins,
        case  when  black_rating - white_rating > 1 then  1 else  0 end  as  higherRankBlackWins
    from  chess
)
select   
    round ((select count(winner) from chess where winner = 'White') / sum(higherRankWhiteWins)  * 100, 2) 		as  higherRankWhiteWinsPercentage
    ,round((select count(winner) from chess where winner = 'Black') / sum(higherRankBlackWins)  * 100, 2)		as  higherRankBlackWinsPercentage
from  
    higher_rank_wins
  

















