import pandas as pd

player_details = pd.read_excel(r"./Player_Details.xlsx", header=0, skiprows=None)
player_details.columns = map(str.lower, player_details.columns)
player_details.describe()

first_bet = pd.read_excel(r"./First_Bet_Data.xlsx", header=0, skiprows=None)
first_bet.columns = map(str.lower, first_bet.columns)
first_bet.describe()

bonus_cost = pd.read_excel(r"./BonusCost_Data.xlsx", header=0, skiprows=None)
bonus_cost.columns = map(str.lower, bonus_cost.columns)
bonus_cost.describe()

first_deposit = pd.read_excel(r"./First_Deposit_Data.xlsx", header=0, skiprows=None)
first_deposit.columns = map(str.lower, first_deposit.columns)
first_deposit.describe()

player_activity = pd.read_excel(r"./Player_Activity_Data.xlsx", header=1, skiprows=0)
player_activity.columns = map(str.lower, player_activity.columns)
player_activity.describe()

