#Step 1; find out the average spend of players for the years 2019 to 2021
SELECT MONTH(activitymonth), YEAR(activitymonth), 
AVG(bet_amount), AVG(win_amount), AVG(gross_win), AVG(net_gross_win)
FROM player_activity
WHERE activitymonth BETWEEN '2019-01-01' AND '2021-12-31' 
GROUP BY 1, 2 
ORDER BY 2,1;

#Step 2; find out the top betting customers and their LTV's
SELECT AVG(sum_bet_amount), AVG(sum_win_amount), AVG(sum_gross_win), AVG(sum_net_gross_win)
FROM
(
	SELECT src_player_id, SUM(bet_amount) as sum_bet_amount, SUM(win_amount) as sum_win_amount, 
	SUM(gross_win) as sum_gross_win, SUM(net_gross_win) as sum_net_gross_win
	FROM player_activity
	WHERE activitymonth BETWEEN '2019-01-01' AND '2021-12-31' 
	GROUP BY 1
) as inner_table;

#Step 3; find out the distinct number of customers in activity table
SELECT COUNT(DISTINCT src_player_id) FROM player_activity;

#Step 4; find the Average bonus cost for LTV
SELECT AVG(sum_bonus_cost) FROM (SELECT src_player_id, SUM(bonus_cost) as sum_bonus_cost FROM bonus_cost GROUP BY 1) as bc;
    
#Step 5; combine 4 and 2
SELECT * FROM
(
	SELECT AVG(sum_bet_amount) AS avg_bet_amount, 
			AVG(sum_win_amount) AS avg_win_amount, 
            AVG(sum_gross_win) AS avg_gross_win, 
            AVG(sum_net_gross_win) AS avg_net_gross_win, 
            avg_bonus_cost
	FROM
	(
		SELECT src_player_id, SUM(bet_amount) as sum_bet_amount, SUM(win_amount) as sum_win_amount, 
		SUM(gross_win) as sum_gross_win, SUM(net_gross_win) as sum_net_gross_win
		FROM player_activity
		WHERE activitymonth BETWEEN '2019-01-01' AND '2021-12-31' 
		GROUP BY 1
	) as inner_table
	CROSS JOIN (SELECT AVG(sum_bonus_cost) as avg_bonus_cost FROM (SELECT src_player_id, SUM(bonus_cost) as sum_bonus_cost FROM bonus_cost GROUP BY 1) as bc) as bc2)
    AS result;
    
#Step 6; find the bonus cost by product
SELECT SUM(bonus_cost), product FROM bonus_cost GROUP BY product;




