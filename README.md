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

### Query 1 - Winning / Even / Losing seasons
# Explanation: Uses `CASE` on `wins` vs `losses` to label each team’s season as “Winning”, “Even”, or “Losing”, and lists those results for a chosen season.
# Justification: Gives a simple view of season outcomes across teams, making it easy for executives to talk about performance without diving into detailed stats.

Execute:
> select id_team, name, wins, losses, team_season_stats.wins / (team_season_stats.wins + team_season_stats.losses) as win_pct,
    case
        when team_season_stats.wins > team_season_stats.losses THEN 'Winning'
        when team_season_stats.wins = team_season_stats.losses THEN 'Even'
        else 'Losing'
    end as season_type
from team
join team_season_stats on team.id_team = team_season_stats.team_id_team
join season on team_season_stats.season_id_season = season.id_season
where (season.start_date) = (
	select max(start_date)
    from season
    join team_season_stats on team_season_stats.season_id_season = season.id_season
    )
    having season_type = 'Winning'
    order by win_pct DESC

+ ------------ + --------- + --------- + ----------- + ------------ + ---------------- +
| id_team      | name      | wins      | losses      | win_pct      | season_type      |
+ ------------ + --------- + --------- + ----------- + ------------ + ---------------- +
| T017         | Denver Nuggets | 53        | 29          | 0.6463       | Winning          |
| T009         | Miami Heat | 44        | 38          | 0.5366       | Winning          |
| T021         | Los Angeles Lakers | 43        | 39          | 0.5244       | Winning          |
+ ------------ + --------- + --------- + ----------- + ------------ + ---------------- +
3 rows

### Query 2 - Teams above average win % in most recent season
# Explanation: Finds each team’s wins, losses, and win percentage in the latest season and keeps only the teams whose win percentage is higher than the league-wide average for that season.
# Justification: Helps management quickly see which teams are actually outperforming the league, so they can study what’s working and identify lagging teams that might need intervention.

Execute:
> select id_team, name AS team_name, wins, losses,(wins / (wins + losses)) as win_pct
from team 
join team_season_stats on id_team = team_id_team
join season on team_season_stats.season_id_season = season.id_season
where start_date = (
	select max(start_date)
    from season
    join team_season_stats on team_season_stats.season_id_season = season.id_season
    )
having win_pct >= (
    select avg(wins / (wins + losses))
    from team_season_stats 
    join season on team_season_stats.season_id_season = season.id_season
    where start_date = (
		select max(start_date)
    from season
    join team_season_stats on team_season_stats.season_id_season = season.id_season
    )
)
order by win_pct DESC

+ ------------ + -------------- + --------- + ----------- + ------------ +
| id_team      | team_name      | wins      | losses      | win_pct      |
+ ------------ + -------------- + --------- + ----------- + ------------ +
| T017         | Denver Nuggets | 53        | 29          | 0.6463       |
+ ------------ + -------------- + --------- + ----------- + ------------ +
1 rows

### Query 3 - Colleges with most drafted players and above average height
# Explanation: Counts how many players from each college were drafted between 2015 and 2024 and calculates average player height, keeping only colleges with at least 5 drafted players and above average height.
# Justification: Useful for scouting and recruiting which colleges are consistently producing many drafted players and whether they tend to produce bigger players, which can influence scouting focus and partnerships.

Execute:
> SELECT id_college, name, count(*) AS drafted_players, avg(player.height) as player_height
from college
join player on player.college_id_college = college.id_college
join Draft on Draft.id_draft = player.id_draft
group by id_college,name
having drafted_players >= 2
   and player_height >
       (
          select avg(height)
           from player
           where id_draft IS NOT NULL
       )
order by drafted_players DESC, player_height DESC

+ --------------- + --------- + -------------------- + ------------------ +
| id_college      | name      | drafted_players      | player_height      |
+ --------------- + --------- + -------------------- + ------------------ +
| C000            | None      | 14                   | 81.4286            |
| C002            | University of Kentucky | 5                    | 80.2000            |
| C005            | University of Kansas | 3                    | 81.0000            |
| C021            | University of Florida | 3                    | 79.3333            |
+ --------------- + --------- + -------------------- + ------------------ +
4 rows

### Query 4 - Venues that host more games than the average arena
# Explanation - Counts games played at each venue in the latest season and compares that number to the league's avg games per venue.
# Justification - Identifies heavily used arenas, supporting operational planning, staffing needs, and maintenance budgeting.

Execute:
> select Venue.venue_id, name, count(*) as games_played
from Venue
join Game on Game.venue_id = Venue.venue_id
join season on Game.season_id_season = season.id_season
where (season.start_date) = (
	select max(start_date)
    from season
    join Game on Game.season_id_season = season.id_season
    )    
group by venue_id,name
having games_played >=
(
		select count(*) / count(distinct Game.venue_id) from Game
    join season on Game.season_id_season = season.id_season
    where (season.start_date) = (  
	select max(start_date)
    from season
    join Game on Game.season_id_season = season.id_season
    )      
)
order by games_played DESC

+ ------------- + --------- + ----------------- +
| venue_id      | name      | games_played      |
+ ------------- + --------- + ----------------- +
| V008          | Ball Arena | 2                 |
| V006          | Kaseya Center | 2                 |
+ ------------- + --------- + ----------------- +
2 rows


### Query 5 - Teams with above average home venue capacity
# Explanation - Joins teams, venues, and games to compute each team's home venue capacity, then comparees it to the league average
# Justification - Highlights teams in larger markets with greater revenue potential, informing pricing, marketing, and investment decisions.

Execute:
> select id_team,team.name as team_name, avg(Venue.max_occupancy) as avg_home_venue_capacity, COUNT(*) as home_games
from team join Game on Game.home_team_id = team.id_team
join Venue on Game.venue_id = Venue.venue_id
group by id_team, team.name
	having avg_home_venue_capacity >= 
(
    select avg(Venue.max_occupancy)
    from Venue join Game on Game.venue_id = Venue.venue_id
)
order by avg_home_venue_capacity DESC

+ ------------ + -------------- + ---------------------------- + --------------- +
| id_team      | team_name      | avg_home_venue_capacity      | home_games      |
+ ------------ + -------------- + ---------------------------- + --------------- +
| T005         | Chicago Bulls  | 20917.0000                   | 4               |
| T001         | Atlanta Hawks  | 20917.0000                   | 1               |
| T013         | Philadelphia 76ers | 20478.0000                   | 2               |
| T006         | Cleveland Cavaliers | 19869.2500                   | 4               |
| T009         | Miami Heat     | 19600.0000                   | 5               |
| T002         | Boston Celtics | 19580.0000                   | 2               |
| T014         | Toronto Raptors | 19580.0000                   | 2               |
| T024         | New Orleans Pelicans | 19520.0000                   | 2               |
| T022         | Memphis Grizzlies | 19520.0000                   | 1               |
| T029         | San Antonio Spurs | 19520.0000                   | 2               |
| T023         | Minnesota Timberwolves | 19520.0000                   | 2               |
| T017         | Denver Nuggets | 19520.0000                   | 4               |
| T021         | Los Angeles Lakers | 19467.0000                   | 4               |
+ ------------ + -------------- + ---------------------------- + --------------- +
13 rows

[Data Visualizations Project 2.pdf](https://github.com/user-attachments/files/23842451/Data.Visualizations.Project.2.pdf)
