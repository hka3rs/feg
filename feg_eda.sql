SELECT COUNT(1) FROM first_deposit fd
INNER JOIN player_details pd ON (fd.src_player_id = pd.src_player_id);

SELECT COUNT(1) FROM first_bet fb
INNER JOIN player_details pd ON (fb.src_player_id = pd.src_player_id);

SELECT COUNT(1) FROM first_bet fb
INNER JOIN first_deposit fd ON (fb.src_player_id = fd.src_player_id);

##some players who placed first bet in 2020 had prior bets in 2019; check it
SELECT fb.src_player_id, pa.activitymonth, fb.system_first_bet_datetime, pa.bet_amount, fb.system_first_betslip_amt
FROM first_bet fb
INNER JOIN player_activity pa ON (fb.src_player_id = pa.src_player_id)
WHERE fb.system_first_bet_datetime BETWEEN '2021-01-01' AND '2021-12-31'
ORDER BY activitymonth;

##check the player playing hours for 3544
SELECT pa.src_player_id, pa.activitymonth, pa.activeplayerdays, pa.bet_amount
FROM player_activity pa
WHERE pa.src_player_id = 3544
ORDER BY pa.activitymonth;

##check the player playing days sum
SELECT pa.src_player_id, SUM(pa.activeplayerdays)
FROM player_activity pa
WHERE pa.src_player_id = 3544
GROUP BY pa.src_player_id
ORDER BY pa.activitymonth;
## data is duplicated or incorrect for this player sometimes

##check the player playing days for 3544 based on may active palyer days
SELECT pa.*, RANK() OVER(PARTITION BY activitymonth ORDER BY activeplayerdays DESC) AS rnk_record
FROM player_activity pa 
WHERE pa.src_player_id = 3544;

##Create another summary table;
SELECT pa.src_player_id, pa.activitymonth, 
MAX(pa.activeplayerdays) AS activeplayerdays, SUM(pa.bet_amount) AS bet_amount, SUM(pa.win_amount) AS win_amount,
SUM(pa.net_gross_win) AS net_gross_win, SUM(bc.bonus_cost) AS bonus_cost
FROM player_activity pa
LEFT JOIN bonus_cost bc ON(bc.src_player_id = pa.src_player_id AND bc.activitymonth = pa.activitymonth AND bc.product = pa.product)
WHERE pa.src_player_id = 3544
GROUP BY pa.src_player_id, activitymonth;

##CREATE 














