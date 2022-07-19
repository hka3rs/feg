import pandas as pd

player_activity = pd.read_excel(r"./Player_Activity_Data.xlsx", header=1, skiprows=0)
player_activity.columns = map(str.lower, player_activity.columns)

#group the player activity by sum active playing days per player
player_days_by_id = player_activity[['src_player_id','activeplayerdays']].groupby(['src_player_id'], as_index=False).sum()
player_days_by_id.head()

#sort the player activity by sum active playing days desc
player_days_by_id = player_days_by_id.sort_values(by=['activeplayerdays'], ascending=False)
player_days_by_id.head()

#take the first 5000 players by activeplayerdays
player_top_5000 = player_days_by_id.iloc[0:5000,0:2]
player_top_5000.head()

#read the player details file 
player_details = pd.read_excel(r"./Player_Details.xlsx", header=0, skiprows=None)
player_details.columns = map(str.lower, player_details.columns)

#join the top 5000 players with player details
player_top_5000_details = pd.merge(player_top_5000, player_details, how='inner', on='src_player_id')
player_top_5000_details.head()

#Now count the players by acquisition channel
player_top_acquisition = player_top_5000_details[['src_player_id','acquisition_channel']].groupby(['acquisition_channel'],as_index=False).count()
player_top_acquisition = player_top_acquisition.sort_values(by=['src_player_id'], ascending=False)
print(player_top_acquisition)

#Now count the players by gender
player_top_gender = player_top_5000_details[['src_player_id','gender']].groupby(['gender'],as_index=False).count()
player_top_gender = player_top_gender.sort_values(by=['src_player_id'], ascending=False)
print(player_top_gender)

#merge the top 5000 players back with Player activity
player_top_5000_activity = pd.merge(player_top_5000, player_activity, how='inner', on='src_player_id')
player_top_5000_activity.head()
player_top_5000_activity.shape

#Now count the top player product & subproduct
player_top_5000_product = player_top_5000_activity.groupby('product').src_player_id.nunique()
print(player_top_5000_product)
