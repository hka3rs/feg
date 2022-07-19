#Step 1 find the TOP 20% of the customers by activiy playing data and store them in a seperate table
SELECT src_player_id, SUM(activeplayerdays) as sum_player_days
FROM player_activity
WHERE activitymonth BETWEEN '2019-01-01' AND '2021-12-31' 
GROUP BY 1
ORDER BY 2 DESC;


