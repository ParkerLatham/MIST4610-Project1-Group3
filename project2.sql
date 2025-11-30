use cs_pal65529;

### Query 1 - Winning / Even / Losing seasons
# Explanation: Uses `CASE` on `wins` vs `losses` to label each team’s season as “Winning”, “Even”, or “Losing”, and lists those results for a chosen season.
# Justification: Gives a simple view of season outcomes across teams, making it easy for executives to talk about performance without diving into detailed stats.
select id_team, name, wins, losses, team_season_stats.wins / (team_season_stats.wins + team_season_stats.losses) as win_pct,
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
    order by win_pct DESC;

### Query 2 - Teams above average win % in most recent season
# Explanation: Finds each team’s wins, losses, and win percentage in the latest season and keeps only the teams whose win percentage is higher than the league-wide average for that season.
# Justification: Helps management quickly see which teams are actually outperforming the league, so they can study what’s working and identify lagging teams that might need intervention.
select id_team, name AS team_name, wins, losses,(wins / (wins + losses)) as win_pct
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
order by win_pct DESC;

### Query 3 - Colleges with most drafted players and above average height
# Explanation: Counts how many players from each college were drafted between 2015 and 2024 and calculates average player height, keeping only colleges with at least 5 drafted players and above average height.
# Justification: Useful for scouting and recruiting which colleges are consistently producing many drafted players and whether they tend to produce bigger players, which can influence scouting focus and partnerships.
SELECT id_college, name, count(*) AS drafted_players, avg(player.height) as player_height
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
order by drafted_players DESC, player_height DESC;

### Query 4 - Venues that host more games than the average arena
# Explanation - Counts games played at each venue in the latest season and compares that number to the league's avg games per venue.
# Justification - Identifies heavily used arenas, supporting operational planning, staffing needs, and maintenance budgeting.
select Venue.venue_id, name, count(*) as games_played
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
order by games_played DESC;

### Query 5 - Teams with above average home venue capacity
# Explanation - Joins teams, venues, and games to compute each team's home venue capacity, then comparees it to the league average
# Justification - Highlights teams in larger markets with greater revenue potential, informing pricing, marketing, and investment decisions.
select id_team,team.name as team_name, avg(Venue.max_occupancy) as avg_home_venue_capacity, COUNT(*) as home_games
from team join Game on Game.home_team_id = team.id_team
join Venue on Game.venue_id = Venue.venue_id
group by id_team, team.name
	having avg_home_venue_capacity >= 
(
    select avg(Venue.max_occupancy)
    from Venue join Game on Game.venue_id = Venue.venue_id
)
order by avg_home_venue_capacity DESC;









        