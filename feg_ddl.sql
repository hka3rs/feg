DESCRIBE player_details;
DESCRIBE player_activity;
DESCRIBE bonus_cost;
DESCRIBE first_bet;
DESCRIBE first_deposit;

SELECT * FROM player_details;
SELECT * FROM bonus_cost;
SELECT * FROM first_bet;
SELECT * FROM first_deposit;
SELECT * FROM player_activity;

SELECT COUNT(1) FROM player_details;
SELECT COUNT(1) FROM bonus_cost;
SELECT COUNT(1) FROM first_bet;
SELECT COUNT(1) FROM first_deposit;
SELECT COUNT(1) FROM player_activity;

##CREATE A SUMMARY TABLE FOR PLAYER_ACTIVITY_MONTHLY
DROP TABLE IF EXISTS player_activity_monthly;
CREATE TABLE player_activity_monthly AS
SELECT 
	pa.src_player_id, 
    pa.activitymonth, 
	MAX(pa.activeplayerdays) AS activeplayerdays, 
	SUM(pa.bet_amount) AS bet_amount, 
    SUM(pa.win_amount) AS win_amount,
	SUM(pa.net_gross_win) AS net_gross_win, 
    SUM(bc.bonus_cost) AS bonus_cost
FROM player_activity pa
LEFT JOIN bonus_cost bc 
	ON(bc.src_player_id = pa.src_player_id AND bc.activitymonth = pa.activitymonth AND bc.product = pa.product)
GROUP BY pa.src_player_id, activitymonth;

DESCRIBE player_activity_monthly;











