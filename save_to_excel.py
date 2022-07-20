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

player_activity_monthly = pd.read_sql('SELECT * FROM player_activity_monthly', con=database_connection)
print(player_activity_monthly.shape)
result = player_activity_monthly.to_excel(r"./Player_Activity_Monthly.xlsx", index=False)
print(result)


