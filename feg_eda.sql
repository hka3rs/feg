SELECT COUNT(1) FROM first_deposit fd
INNER JOIN player_details pd ON (fd.src_player_id = pd.src_player_id);

SELECT COUNT(1) FROM first_bet fb
INNER JOIN player_details pd ON (fb.src_player_id = pd.src_player_id);

SELECT COUNT(1) FROM first_bet fb
INNER JOIN first_deposit fd ON (fb.src_player_id = fd.src_player_id);




