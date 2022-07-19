import pandas as pd
import sqlalchemy  


database_username = 'root'
database_password = 'password'
database_ip       = 'localhost'
database_name     = 'world'
database_connection = sqlalchemy.create_engine('mysql+mysqlconnector://{0}:{1}@{2}/{3}'.
                                               format(database_username, database_password, 
                                                      database_ip, database_name))

print(database_connection)

player_details = pd.read_excel(r"./Player_Details.xlsx", header=0, skiprows=None)
player_details.columns = map(str.lower, player_details.columns)
ans = player_details.to_sql(con=database_connection, name='player_details', if_exists='replace', index=None)
print("Saved player_details successfully. rows = {0}".format(ans))

first_bet = pd.read_excel(r"./First_Bet_Data.xlsx", header=0, skiprows=None)
first_bet.columns = map(str.lower, first_bet.columns)
ans = first_bet.to_sql(con=database_connection, name='first_bet', if_exists='replace', index=None)
print('Saved first_bet successfully. rows = {0}'.format(ans))

bonus_cost = pd.read_excel(r"./BonusCost_Data.xlsx", header=0, skiprows=None)
bonus_cost.columns = map(str.lower, bonus_cost.columns)
ans = bonus_cost.to_sql(con=database_connection, name='bonus_cost', if_exists='replace', index=None)
print('Saved bonus_cost successfully. rows = {0}'.format(ans))

first_deposit = pd.read_excel(r"./First_Deposit_Data.xlsx", header=0, skiprows=None)
first_deposit.columns = map(str.lower, first_deposit.columns)
ans = first_deposit.to_sql(con=database_connection, name='first_deposit', if_exists='replace', index=None)
print('Saved first_deposit successfully. rows = {0}'.format(ans))

player_activity = pd.read_excel(r"./Player_Activity_Data.xlsx", header=1, skiprows=0)
player_activity.columns = map(str.lower, player_activity.columns)
ans = player_activity.to_sql(con=database_connection, name='player_activity', if_exists='replace', index=None, chunksize=1000)
print('Saved player_activity successfully. rows = {0}'.format(ans))


