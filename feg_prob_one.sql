#Step 1; find out if there are any customers with signup date in 2021
SELECT COUNT(src_player_id) FROM player_details
WHERE signup_date BETWEEN '2021-01-01' AND '2021-12-31';

#Step 2; find out the players who has placed a first bet in 2021
SELECT COUNT(src_player_id), SUM(system_first_betslip_amt), AVG(system_first_betslip_amt),
MAX(system_first_betslip_amt), MIN(system_first_betslip_amt), 
MONTH(system_first_bet_datetime), YEAR(system_first_bet_datetime)
FROM first_bet 
WHERE system_first_bet_datetime BETWEEN '2019-01-01' AND '2021-12-31'
GROUP BY MONTH(system_first_bet_datetime), YEAR(system_first_bet_datetime)
ORDER BY YEAR(system_first_bet_datetime), MONTH(system_first_bet_datetime);

#Step 3; find out the top players who has placed a first bet in 2021
SELECT src_player_id, MONTH(system_first_bet_datetime), YEAR(system_first_bet_datetime), system_first_betslip_amt
FROM first_bet 
WHERE system_first_bet_datetime BETWEEN '2021-01-01' AND '2021-12-31' 
ORDER BY 4 DESC;

#Step 4; compare the player activity across channels in 2021 vs 2019 & 2020
SELECT MONTH(activitymonth), YEAR(activitymonth), product, subproduct, SUM(activeplayerdays)
FROM player_activity
WHERE activitymonth BETWEEN '2019-01-01' AND '2021-12-31' 
GROUP BY 1, 2, 3, 4
ORDER BY 2,1,3,4;

#Step 5; Look at the customer demographics based on the first bet date
SELECT COUNT(pd.src_player_id), gender, 
YEAR(system_first_bet_datetime)
FROM first_bet fb
INNER JOIN player_details pd ON (fb.src_player_id = pd.src_player_id)
WHERE system_first_bet_datetime BETWEEN '2019-01-01' AND '2021-12-31'
GROUP BY 2,3
ORDER BY 3;

SELECT COUNT(pd.src_player_id), acquisition_channel, 
YEAR(system_first_bet_datetime)
FROM first_bet fb
INNER JOIN player_details pd ON (fb.src_player_id = pd.src_player_id)
WHERE system_first_bet_datetime BETWEEN '2019-01-01' AND '2021-12-31'
GROUP BY 2,3
ORDER BY 3;



