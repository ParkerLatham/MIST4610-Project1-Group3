# NBA-SQL-Project

This is MIST 4610 SQL project representing the relationships between NBA entities.
There are both simple and complex queries that are relevant from a NBA managerial perspective. 

Full .sql file is included, please see attatched!


# Team Name: Group 3

Group Members:

Parker Latham: [ParkerLatham](https://github.com/ParkerLatham)

Sam Franks: [samwise2403](https://github.com/samwise2403)

Sam Tock: [SamTock](https://github.com/SamTock)

Joaquin Pastor: [joaquinpastorg](https://github.com/joaquinpastorg)

Jiya Lulla: [jiyalulla-ctrl](https://github.com/jiyalulla-ctrl)

# Data Model
<img width="1246" height="777" alt="image" src="https://github.com/user-attachments/assets/39ec2e4d-5580-4c56-841e-8ecbd60dbb76" />

# Data Dictionary:
<img width="793" height="705" alt="image" src="https://github.com/user-attachments/assets/98894685-25e3-49e6-b417-7ab2219f40f0" />
<img width="805" height="542" alt="image" src="https://github.com/user-attachments/assets/8af4ff19-0027-4212-b719-8828411a4825" />
<img width="813" height="876" alt="image" src="https://github.com/user-attachments/assets/6a32742a-4b69-4173-b1e6-6d73a0e205d6" />
<img width="816" height="594" alt="image" src="https://github.com/user-attachments/assets/70829d99-5255-41ae-b388-bca569dbd3e0" />
<img width="795" height="662" alt="image" src="https://github.com/user-attachments/assets/a166a0d8-c240-4c7f-9566-ec200117a9a2" />
<img width="810" height="314" alt="image" src="https://github.com/user-attachments/assets/c44ceb93-6ca8-44bf-ba02-5594cf61b096" />
<img width="800" height="775" alt="image" src="https://github.com/user-attachments/assets/5892077b-624e-4f2a-b7ee-9201d520530d" />
<img width="791" height="458" alt="image" src="https://github.com/user-attachments/assets/07b497f3-1c0c-4f93-b8c4-6bce0a534eb2" />
<img width="857" height="334" alt="image" src="https://github.com/user-attachments/assets/09ba513a-74e4-4781-98c2-9e51c4bdf5f8" />
<img width="818" height="513" alt="image" src="https://github.com/user-attachments/assets/42ade4be-6105-4332-b124-b4373c1e3cae" />
<img width="789" height="332" alt="image" src="https://github.com/user-attachments/assets/759bdea9-6f74-4696-a748-2037a06b6c3f" />
<img width="819" height="544" alt="image" src="https://github.com/user-attachments/assets/d6e6427a-dcb8-4138-bae6-6b587836b933" />

# Queries

<img width="1037" height="527" alt="Screenshot 2025-10-26 at 8 29 50 PM" src="https://github.com/user-attachments/assets/36620b66-939b-4121-8599-e3610bfed20f" />
Description: This query retrieves all details from the Game table—such as the game ID, date, home team, away team, and referee—but excludes the venue information. It is designed to provide an overview of scheduled games while focusing only on matchup and officiating details rather than the location.


<img width="1037" height="527" alt="Screenshot 2025-10-26 at 8 31 05 PM" src="https://github.com/user-attachments/assets/6e0c61b5-96a8-4732-9918-1e8caf3d8ddb" />
Description: This query returns all players whose height exceeds 80 inches (equivalent to 6 feet 8 inches). It helps identify taller athletes, often forwards or centers, and can be used to analyze how player height varies across teams or positions.


<img width="1037" height="527" alt="Screenshot 2025-10-26 at 8 32 56 PM" src="https://github.com/user-attachments/assets/e92ff1ed-dd75-455c-aaa3-86bc7b438c04" />
Description: This query selects each team’s ID, name and division where the conference is listed as "Western." It lets us filter or group teams based on conference affiliation, which is useful for comparing team performance or roster data between conferences.


<img width="1037" height="528" alt="Screenshot 2025-10-26 at 8 34 09 PM" src="https://github.com/user-attachments/assets/a2360063-b0f2-4f3a-b251-561e92cb1202" />
Description: This query lists all players along with their positions and orders the output by position and player name. It provides us with an organized view of player distribution across positions, helping to analyze team structure and positional depth within the different teams in the league.


<img width="1037" height="528" alt="Screenshot 2025-10-26 at 8 34 32 PM" src="https://github.com/user-attachments/assets/6e8fed04-3a3a-457a-ad39-b215ee2d2b2c" />
Description: This query calculates the number of players, the average salary and the minimum and maximum salary for each position in the NBA. It combines player and contract data to show how pay levels differ by position, providing us insight into which roles tend to earn more or less on average.


<img width="1037" height="398" alt="Screenshot 2025-10-26 at 8 35 06 PM" src="https://github.com/user-attachments/assets/2e653cde-c772-4da6-9f2b-2de3b905e94d" />
Description: This query identifies every team associated with LeBron James by joining player and team data through the team_has_player table. It demonstrates how a many-to-many relationship can track a player’s history across multiple teams, allowing for analysis of player movement throughout their career.


<img width="1037" height="467" alt="Screenshot 2025-10-26 at 8 35 42 PM" src="https://github.com/user-attachments/assets/8b6c63ce-bb5c-41e0-85a2-f3086b47c83e" />
Description: This query connects several related tables—player, team, coach and draft to show each player’s name, the team they play for, their coach and where they were drafted. It offers a complete snapshot of a player’s background and current affiliation, which is very useful for scouting reports or career analysis.


<img width="1037" height="467" alt="Screenshot 2025-10-26 at 8 36 08 PM" src="https://github.com/user-attachments/assets/50978f06-1af4-4205-af55-c77c8b526f9e" />
Description: This query calculates the average salary of players on each coach’s team and ranks them from highest to lowest. It highlights which coaches manage higher paid rosters and provides insight into the potential relationships that exist between team payroll and coaching assignments.


<img width="1037" height="467" alt="Screenshot 2025-10-26 at 8 36 35 PM" src="https://github.com/user-attachments/assets/f17f7978-c30c-4323-99bf-e434de56020a" />
Description: This query finds the highest paid player for each team by comparing individual salaries to the team’s maximum salary value, then filters results to include only teams located in cities that start with a vowel. It showcases subquery usage and demonstrates how to identify top earners while applying specific filters.


<img width="1037" height="592" alt="Screenshot 2025-10-26 at 8 38 00 PM" src="https://github.com/user-attachments/assets/ba51ac78-194f-4baa-8de2-e86d390268c2" />
Description: This query lists all players who have only played for a single team by using a NOT EXISTS clause to exclude any player with multiple team associations pn their records. It helps identify players with long-term loyalty or one-team careers, which can be useful for retention or legacy analysis.

