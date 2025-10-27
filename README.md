# NBA-SQL-Project



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



# Full Data Base and Query Code



INSERT INTO player (
  player_id, player, position, colleges, DOB, height, weight, id_position, id_draft
)
VALUES
('23', 'LeBron James', 'Small Forward', 'None', '1984-12-30', 81, 250, 'SF', '1'),
('35', 'Kevin Durant', 'Small Forward', 'Texas', '1988-09-29', 82, 240, 'SF', '2'),
('3', 'Kawhi Leonard', 'Small Forward', 'San Diego State', '1991-06-29', 79, 225, 'SF', '3'),
('77', 'Luka Doncic', 'Point Guard', 'None', '1999-02-28', 79, 230, 'PG', '4'),
('21', 'Joel Embiid', 'Center', 'Kansas', '1994-03-16', 84, 280, 'C', '5'),
('1', 'Devin Booker', 'Shooting Guard', 'Kentucky', '1996-10-30', 77, 210, 'SG', '6'),
('0', 'Zion Williamson', 'Power Forward', 'Duke', '2000-07-06', 78, 284, 'PF', '7'),
('30', 'Stephen Curry', 'Point Guard', 'Davidson', '1988-03-14', 74, 185, 'PG', '8'),
('13', 'Damian Lillard', 'Point Guard', 'Weber State', '1990-07-15', 74, 195, 'PG', '9'),
('27', 'Pascal Siakam', 'Power Forward', 'New Mexico State', '1994-04-02', 81, 230, 'PF', '10');

INSERT INTO player (
  player_id, player, position, colleges, DOB, height, weight, id_position, id_draft
)
VALUES
('15', 'Nikola Jokic', 'Center', 'None', '1995-02-19', 83, 284, 'C', '11'),
('2', 'Shai Gilgeous-Alexander', 'Point Guard', 'Kentucky', '1998-07-12', 78, 180, 'PG', '12'),
('11', 'Anthony Davis', 'Power Forward', 'Kentucky', '1993-03-11', 82, 253, 'PF', '13'),
('22', 'Jayson Tatum', 'Small Forward', 'Duke', '1998-03-03', 80, 210, 'SF', '14'),
('5', 'James Harden', 'Shooting Guard', 'Arizona State', '1989-08-26', 77, 220, 'SG', '15'),
('10', 'Jaylen Brown', 'Shooting Guard', 'California', '1996-10-24', 78, 223, 'SG', '16'),
('6', 'Kyrie Irving', 'Point Guard', 'Duke', '1992-03-23', 74, 195, 'PG', '17'),
('8', 'Joel Ayayi', 'Shooting Guard', 'Gonzaga', '1999-03-05', 76, 180, 'SG', '18'),
('18', 'Kyshawn George', 'Small Forward', 'Miami (FL)', '2003-12-01', 80, 205, 'SF', '19'),
('32', 'Cooper Flagg', 'Power Forward', 'Duke', '2006-12-21', 81, 210, 'PF', '20');


INSERT INTO Draft (id_draft, year, location)
VALUES
('11', '2014', 'Brooklyn, NY'),
('12', '2018', 'Brooklyn, NY'),
('13', '2012', 'Newark, NJ'),
('14', '2017', 'Brooklyn, NY'),
('15', '2009', 'New York, NY'),
('16', '2016', 'Brooklyn, NY'),
('17', '2011', 'Newark, NJ'),
('18', '2021', 'Brooklyn, NY'),
('19', '2023', 'Brooklyn, NY'),
('20', '2025', 'Brooklyn, NY');

INSERT INTO Draft (
  id_draft, year, location
)
VALUES
('1', '2003', 'New York, NY'),         -- LeBron James
('2', '2007', 'New York, NY'),         -- Kevin Durant
('3', '2011', 'Newark, NJ'),           -- Kawhi Leonard
('4', '2018', 'Brooklyn, NY'),         -- Luka Doncic
('5', '2014', 'Brooklyn, NY'),         -- Joel Embiid
('6', '2015', 'Brooklyn, NY'),         -- Devin Booker
('7', '2019', 'Brooklyn, NY'),         -- Zion Williamson
('8', '2010', 'New York, NY'),         -- Stephen Curry
('9', '2012', 'Newark, NJ'),           -- Damian Lillard
('10', '2016', 'Brooklyn, NY');        -- Pascal Siakam



INSERT INTO Position (id_position, name)
VALUES
  ('PG', 'Point Guard'),
  ('SG', 'Shooting Guard'),
  ('SF', 'Small Forward'),
  ('PF', 'Power Forward'),
  ('C',  'Center');
  
  




INSERT INTO team (id_team, name, city, conference, division)
VALUES
  ('ATL', 'Atlanta Hawks', 'Atlanta', 'Eastern', 'Southeast'),
  ('BOS', 'Boston Celtics', 'Boston', 'Eastern', 'Atlantic'),
  ('BKN', 'Brooklyn Nets', 'Brooklyn', 'Eastern', 'Atlantic'),
  ('CHA', 'Charlotte Hornets', 'Charlotte', 'Eastern', 'Southeast'),
  ('CHI', 'Chicago Bulls', 'Chicago', 'Eastern', 'Central'),
  ('CLE', 'Cleveland Cavaliers', 'Cleveland', 'Eastern', 'Central'),
  ('DAL', 'Dallas Mavericks', 'Dallas', 'Western', 'Southwest'),
  ('DEN', 'Denver Nuggets', 'Denver', 'Western', 'Northwest'),
  ('DET', 'Detroit Pistons', 'Detroit', 'Eastern', 'Central'),
  ('GSW', 'Golden State Warriors', 'San Francisco', 'Western', 'Pacific'),
  ('HOU', 'Houston Rockets', 'Houston', 'Western', 'Southwest'),
  ('IND', 'Indiana Pacers', 'Indianapolis', 'Eastern', 'Central'),
  ('LAC', 'Los Angeles Clippers', 'Los Angeles', 'Western', 'Pacific'),
  ('LAL', 'Los Angeles Lakers', 'Los Angeles', 'Western', 'Pacific'),
  ('MEM', 'Memphis Grizzlies', 'Memphis', 'Western', 'Southwest'),
  ('MIA', 'Miami Heat', 'Miami', 'Eastern', 'Southeast'),
  ('MIL', 'Milwaukee Bucks', 'Milwaukee', 'Eastern', 'Central'),
  ('MIN', 'Minnesota Timberwolves', 'Minneapolis', 'Western', 'Northwest'),
  ('NOP', 'New Orleans Pelicans', 'New Orleans', 'Western', 'Southwest'),
  ('NYK', 'New York Knicks', 'New York', 'Eastern', 'Atlantic'),
  ('OKC', 'Oklahoma City Thunder', 'Oklahoma City', 'Western', 'Northwest'),
  ('ORL', 'Orlando Magic', 'Orlando', 'Eastern', 'Southeast'),
  ('PHI', 'Philadelphia 76ers', 'Philadelphia', 'Eastern', 'Atlantic'),
  ('PHX', 'Phoenix Suns', 'Phoenix', 'Western', 'Pacific'),
  ('POR', 'Portland Trail Blazers', 'Portland', 'Western', 'Northwest'),
  ('SAC', 'Sacramento Kings', 'Sacramento', 'Western', 'Pacific'),
  ('SAS', 'San Antonio Spurs', 'San Antonio', 'Western', 'Southwest'),
  ('TOR', 'Toronto Raptors', 'Toronto', 'Eastern', 'Atlantic'),
  ('UTA', 'Utah Jazz', 'Salt Lake City', 'Western', 'Northwest'),
  ('WAS', 'Washington Wizards', 'Washington', 'Eastern', 'Southeast');


INSERT INTO Coach (id_coach, first_name, last_name, hire_date, experience)
VALUES
  ('C001', 'Quin', 'Snyder', '2023-02-26', 9),         -- Atlanta Hawks
  ('C002', 'Joe', 'Mazzulla', '2023-04-01', 3),        -- Boston Celtics
  ('C003', 'Jacque', 'Vaughn', '2022-11-01', 5),       -- Brooklyn Nets
  ('C004', 'Steve', 'Clifford', '2022-06-24', 10),     -- Charlotte Hornets
  ('C005', 'Billy', 'Donovan', '2020-09-22', 10),      -- Chicago Bulls
  ('C006', 'J.B.', 'Bickerstaff', '2020-03-10', 6),    -- Cleveland Cavaliers
  ('C007', 'Jason', 'Kidd', '2021-06-28', 10),         -- Dallas Mavericks
  ('C008', 'Michael', 'Malone', '2015-06-15', 11),     -- Denver Nuggets
  ('C009', 'Monty', 'Williams', '2023-06-02', 9),      -- Detroit Pistons
  ('C010', 'Steve', 'Kerr', '2014-05-14', 11),         -- Golden State Warriors
  ('C011', 'Ime', 'Udoka', '2023-04-25', 3),           -- Houston Rockets
  ('C012', 'Rick', 'Carlisle', '2021-06-24', 21),      -- Indiana Pacers
  ('C013', 'Tyronn', 'Lue', '2020-10-20', 9),          -- LA Clippers
  ('C014', 'Darvin', 'Ham', '2022-06-03', 4),          -- LA Lakers
  ('C015', 'Tuomas', 'Iisalo', '2024-07-01', 1),       -- Memphis Grizzlies
  ('C016', 'Erik', 'Spoelstra', '2008-04-28', 17),     -- Miami Heat
  ('C017', 'Adrian', 'Griffin', '2023-06-05', 2),      -- Milwaukee Bucks
  ('C018', 'Chris', 'Finch', '2021-02-22', 5),         -- Minnesota Timberwolves
  ('C019', 'Willie', 'Green', '2021-07-22', 4),        -- New Orleans Pelicans
  ('C020', 'Tom', 'Thibodeau', '2020-07-30', 12),      -- New York Knicks
  ('C021', 'Mark', 'Daigneault', '2020-11-11', 5),     -- OKC Thunder
  ('C022', 'Jamahl', 'Mosley', '2021-07-11', 4),       -- Orlando Magic
  ('C023', 'Nick', 'Nurse', '2023-06-01', 6),          -- Philadelphia 76ers
  ('C024', 'Frank', 'Vogel', '2023-06-06', 11),        -- Phoenix Suns
  ('C025', 'Chauncey', 'Billups', '2021-06-27', 4),    -- Portland Trail Blazers
  ('C026', 'Mike', 'Brown', '2022-05-09', 9),          -- Sacramento Kings
  ('C027', 'Mitchell', 'Johnson', '2024-06-30', 1),    -- San Antonio Spurs
  ('C028', 'Darko', 'Rajaković', '2023-06-13', 2),     -- Toronto Raptors
  ('C029', 'Will', 'Hardy', '2022-06-29', 3),          -- Utah Jazz
  ('C030', 'Wes', 'Unseld Jr.', '2021-07-17', 4);      -- Washington Wizards

INSERT INTO main_referee (referee_id, Referee)
VALUES
  ('R001', 'Scott Foster'),
  ('R002', 'Tony Brothers'),
  ('R003', 'Marc Davis'),
  ('R004', 'James Capers'),
  ('R005', 'David Guthrie'),
  ('R006', 'Ben Taylor'),
  ('R007', 'Ed Malloy'),
  ('R008', 'Pat Fraher'),
  ('R009', 'Biniam Maru'),
  ('R010', 'Jenna Reneau');


INSERT INTO Venue (venue_id, name, city, state, max_occupancy)
VALUES
  ('V001', 'State Farm Arena', 'Atlanta', 'GA', 17044),
  ('V002', 'TD Garden', 'Boston', 'MA', 18624),
  ('V003', 'Barclays Center', 'Brooklyn', 'NY', 17732),
  ('V004', 'Spectrum Center', 'Charlotte', 'NC', 19077),
  ('V005', 'United Center', 'Chicago', 'IL', 20917),
  ('V006', 'Rocket Mortgage FieldHouse', 'Cleveland', 'OH', 19432),
  ('V007', 'American Airlines Center', 'Dallas', 'TX', 19200),
  ('V008', 'Ball Arena', 'Denver', 'CO', 19520),
  ('V009', 'Little Caesars Arena', 'Detroit', 'MI', 20491),
  ('V010', 'Chase Center', 'San Francisco', 'CA', 18064),
  ('V011', 'Toyota Center', 'Houston', 'TX', 18055),
  ('V012', 'Gainbridge Fieldhouse', 'Indianapolis', 'IN', 17923),
  ('V013', 'Intuit Dome', 'Inglewood', 'CA', 18000),
  ('V014', 'Crypto.com Arena', 'Los Angeles', 'CA', 19060),
  ('V015', 'FedExForum', 'Memphis', 'TN', 18119),
  ('V016', 'Kaseya Center', 'Miami', 'FL', 19600),
  ('V017', 'Fiserv Forum', 'Milwaukee', 'WI', 17500),
  ('V018', 'Target Center', 'Minneapolis', 'MN', 19356),
  ('V019', 'Smoothie King Center', 'New Orleans', 'LA', 17444),
  ('V020', 'Madison Square Garden', 'New York', 'NY', 19812),
  ('V021', 'Paycom Center', 'Oklahoma City', 'OK', 18203),
  ('V022', 'Amway Center', 'Orlando', 'FL', 18846),
  ('V023', 'Wells Fargo Center', 'Philadelphia', 'PA', 20478),
  ('V024', 'Footprint Center', 'Phoenix', 'AZ', 18055),
  ('V025', 'Moda Center', 'Portland', 'OR', 19441),
  ('V026', 'Golden 1 Center', 'Sacramento', 'CA', 17500),
  ('V027', 'Frost Bank Center', 'San Antonio', 'TX', 18418),
  ('V028', 'Scotiabank Arena', 'Toronto', 'ON', 19800),
  ('V029', 'Delta Center', 'Salt Lake City', 'UT', 18306),
  ('V030', 'Capital One Arena', 'Washington', 'DC', 20356);

INSERT INTO team_has_player (id_team, player_id, salary, start_date, end_date)
VALUES
  ('LAL', '23', 45000000, '2023-10-01', '2024-06-15'),  -- LeBron James
  ('PHX', '35', 47000000, '2023-10-01', '2024-06-15'),  -- Kevin Durant
  ('LAC', '3', 44000000, '2023-10-01', '2024-06-15'),   -- Kawhi Leonard
  ('DAL', '77', 46000000, '2023-10-01', '2024-06-15'),  -- Luka Doncic
  ('PHI', '21', 47000000, '2023-10-01', '2024-06-15');  -- Joel Embiid

INSERT INTO team_has_player (id_team, player_id, salary, start_date, end_date)
VALUES
  ('DEN', '15', 47600000, '2023-10-01', '2024-06-15'),  -- Nikola Jokic
  ('OKC', '2', 33000000, '2023-10-01', '2024-06-15'),   -- Shai Gilgeous-Alexander
  ('LAL', '11', 40000000, '2023-10-01', '2024-06-15'),  -- Anthony Davis
  ('BOS', '22', 32000000, '2023-10-01', '2024-06-15'),  -- Jayson Tatum
  ('LAC', '5', 35000000, '2023-10-01', '2024-06-15'),   -- James Harden
  ('BOS', '10', 29000000, '2023-10-01', '2024-06-15'),  -- Jaylen Brown
  ('DAL', '6', 37000000, '2023-10-01', '2024-06-15'),   -- Kyrie Irving
  ('WAS', '8', 1800000, '2023-10-01', '2024-06-15'),    -- Joel Ayayi
  ('MIA', '18', 2000000, '2025-10-01', '2026-06-15');   -- Kyshawn George    


INSERT INTO Coach_has_team (id_coach, id_team)
VALUES
  ('C001', 'ATL'),  -- Quin Snyder → Atlanta Hawks
  ('C002', 'BOS'),  -- Joe Mazzulla → Boston Celtics
  ('C007', 'DAL'),  -- Jason Kidd → Dallas Mavericks
  ('C010', 'GSW'),  -- Steve Kerr → Golden State Warriors
  ('C014', 'LAL');  -- Darvin Ham → Los Angeles Lakers

INSERT INTO Game (game_id, date, home_team_id, away_team_id, referee_id, venue_id)
VALUES
  ('G001', '2025-10-26', 'SAS', 'BKN', 'R001', 'V027'),  -- Spurs vs Nets @ Frost Bank Center
  ('G002', '2025-10-26', 'DET', 'BOS', 'R002', 'V009'),  -- Pistons vs Celtics @ Little Caesars Arena
  ('G003', '2025-10-26', 'MIA', 'NYK', 'R003', 'V016'),  -- Heat vs Knicks @ Kaseya Center
  ('G004', '2025-10-26', 'CLE', 'MIL', 'R004', 'V006'),  -- Cavaliers vs Bucks @ Rocket Mortgage FieldHouse
  ('G005', '2025-10-26', 'WAS', 'CHA', 'R005', 'V030'),  -- Wizards vs Hornets @ Capital One Arena
  ('G006', '2025-10-26', 'MIN', 'IND', 'R006', 'V018');  -- Timberwolves vs Pacers @ Target Center



INSERT INTO Game_has_team (game_id, id_team)
VALUES
  ('G001', 'SAS'),  -- Spurs vs Nets
  ('G001', 'BKN'),

  ('G002', 'DET'),  -- Pistons vs Celtics
  ('G002', 'BOS'),

  ('G003', 'MIA'),  -- Heat vs Knicks
  ('G003', 'NYK'),

  ('G004', 'CLE'),  -- Cavaliers vs Bucks
  ('G004', 'MIL'),

  ('G005', 'WAS'),  -- Wizards vs Hornets
  ('G005', 'CHA'),

  ('G006', 'MIN'),  -- Timberwolves vs Pacers
  ('G006', 'IND');

INSERT INTO Position (id_position, name)
VALUES
('PG', 'Point Guard'),
('SG', 'Shooting Guard'),
('SF', 'Small Forward'),
('PF', 'Power Forward'),
('C', 'Center');





# SIMPLE QUERIES

#1 Select everything from Game except the Venue

SELECT 
  game_id,
  date,
  home_team_id,
  away_team_id,
  referee_id
FROM 
  Game;
  
#2 Select all players that are taller than 6'8

select * from player
where height > 80;


#3 Select Western conference teams

Select id_team, name, division
From team
Where conference = 'Western';

#4 select all players sorted by their listed position

Select player, position
From player
Order by position, player;



# COMPLEX QUERIES


#5  Select the Count, Average, Minimum, and Maximum salary based on position in NBA in descending order

SELECT
  Position.name AS position_name,
  COUNT(player.player_id) AS num_players,
  AVG(team_has_player.salary) AS avg_salary,
  MIN(team_has_player.salary) AS min_salary,
  MAX(team_has_player.salary) AS max_salary
FROM player
JOIN Position ON player.id_position = Position.id_position
LEFT JOIN team_has_player ON player.player_id = team_has_player.player_id
GROUP BY Position.name
ORDER BY avg_salary DESC;


#6 Find all of the teams that Lebron has played on

SELECT
  player.player,
  team.name AS team_name
FROM player
JOIN team_has_player ON player.player_id = team_has_player.player_id
JOIN team ON team_has_player.id_team = team.id_team
WHERE player.player = 'LeBron James';


#7  Display each player's name, their team, coach, and draft location

SELECT
  player.player AS player_name,
  team.name AS team_name,
  Coach.first_name AS coach_first,
  Coach.last_name AS coach_last,
  Draft.location AS draft_location
FROM player
JOIN team_has_player ON player.player_id = team_has_player.player_id
JOIN team ON team_has_player.id_team = team.id_team
JOIN Coach_has_team ON team.id_team = Coach_has_team.id_team
JOIN Coach ON Coach_has_team.id_coach = Coach.id_coach
JOIN Draft ON player.id_draft = Draft.id_draft;





#8  Compare average payroll by coach to see who's team is getting paid the most on average

SELECT
  Coach.first_name AS coach_first,
  Coach.last_name AS coach_last,
  team.name AS team_name,
  AVG(team_has_player.salary) AS average_team_payroll
FROM Coach
JOIN Coach_has_team ON Coach.id_coach = Coach_has_team.id_coach
JOIN team ON Coach_has_team.id_team = team.id_team
JOIN team_has_player ON team.id_team = team_has_player.id_team
JOIN player ON team_has_player.player_id = player.player_id
GROUP BY Coach.first_name, Coach.last_name, team.name
ORDER BY average_team_payroll desc;


#9 Highest paid player on each team who's name starts with a vowel

SELECT
name, player, salary,
(team_has_player.salary / NULLIF(player.height, 0)) 
FROM team
JOIN team_has_player
ON team_has_player.id_team = team.id_team
JOIN player
ON player.player_id = team_has_player.player_id
JOIN (
    SELECT id_team, MAX(salary) AS max_salary
    FROM team_has_player
    GROUP BY id_team
) maxpay
ON maxpay.id_team = team_has_player.id_team
AND maxpay.max_salary = team_has_player.salary
WHERE team.city REGEXP '^(A|E|I|O|U)'
ORDER BY team_has_player.salary DESC, team.name;





#10 Players who never switched teams

Select player, team.name
From player
Join team_has_player
On team_has_player.player_id = player.player_id
Join team
On team.id_team = team_has_player.id_team
Where Not Exists (
	Select * 
	From team_has_player
	Where team_has_player.player_id = player.player_id
	And team_has_player.id_team <> team.id_team
)
Group by player, name
Order by player;	









# Data Model
<img width="1246" height="777" alt="image" src="https://github.com/user-attachments/assets/39ec2e4d-5580-4c56-841e-8ecbd60dbb76" />
