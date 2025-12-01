-- MySQL Workbench Forward Engineering

GRANT ALL PRIVILEGES ON cs_pal65529.* TO 'cs_sbt21253'@'%';

GRANT ALL PRIVILEGES ON cs_pal65529.* TO 'cs_slf44140'@'%';

GRANT ALL PRIVILEGES ON cs_pal65529.* TO 'cs_jbl50140'@'%';

GRANT ALL PRIVILEGES ON cs_pal65529.* TO 'cs_jmp26286'@'%';



USE cs_pal65529;

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Table `team`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `team` (
  `id_team` VARCHAR(45) NOT NULL,
  `name` VARCHAR(45) NULL,
  `city` VARCHAR(45) NULL,
  `conference` VARCHAR(45) NULL,
  `division` VARCHAR(45) NULL,
  PRIMARY KEY (`id_team`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Draft`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Draft` (
  `id_draft` VARCHAR(45) NOT NULL,
  `year` VARCHAR(45) NULL,
  `location` VARCHAR(45) NULL,
  PRIMARY KEY (`id_draft`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Position`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Position` (
  `id_position` VARCHAR(45) NOT NULL,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id_position`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `college`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `college` (
  `id_college` VARCHAR(45) NOT NULL,
  `name` VARCHAR(45) NULL,
  `city` VARCHAR(45) NULL,
  `state` VARCHAR(45) NULL,
  `conference` VARCHAR(45) NULL,
  PRIMARY KEY (`id_college`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `player`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `player` (
  `player_id` VARCHAR(45) NOT NULL,
  `player` VARCHAR(45) NULL,
  `colleges` VARCHAR(45) NULL,
  `DOB` DATE NULL,
  `height` INT NULL,
  `weight` INT NULL,
  `id_draft` VARCHAR(45) NOT NULL,
  `id_position` VARCHAR(45) NOT NULL,
  `college_id_college` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`player_id`),
  INDEX `fk_player_Draft1_idx` (`id_draft` ASC) VISIBLE,
  INDEX `fk_player_Position1_idx` (`id_position` ASC) VISIBLE,
  INDEX `fk_player_college1_idx` (`college_id_college` ASC) VISIBLE,
  CONSTRAINT `fk_player_Draft1`
    FOREIGN KEY (`id_draft`)
    REFERENCES `Draft` (`id_draft`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_player_Position1`
    FOREIGN KEY (`id_position`)
    REFERENCES `Position` (`id_position`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_player_college1`
    FOREIGN KEY (`college_id_college`)
    REFERENCES `college` (`id_college`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Coach`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Coach` (
  `id_coach` VARCHAR(45) NOT NULL,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `hire_date` DATE NULL,
  `experience` INT NULL,
  `Coach_id_coach` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_coach`),
  INDEX `fk_Coach_Coach1_idx` (`Coach_id_coach` ASC) VISIBLE,
  CONSTRAINT `fk_Coach_Coach1`
    FOREIGN KEY (`Coach_id_coach`)
    REFERENCES `Coach` (`id_coach`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `main_referee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `main_referee` (
  `referee_id` VARCHAR(45) NOT NULL,
  `Referee` VARCHAR(45) NULL,
  PRIMARY KEY (`referee_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Venue`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Venue` (
  `venue_id` VARCHAR(45) NOT NULL,
  `name` VARCHAR(45) NULL,
  `city` VARCHAR(45) NULL,
  `state` VARCHAR(45) NULL,
  `max_occupancy` INT NULL,
  PRIMARY KEY (`venue_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `season`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `season` (
  `id_season` VARCHAR(45) NOT NULL,
  `start_date` DATE NULL,
  `end_date` DATE NULL,
  PRIMARY KEY (`id_season`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Game`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Game` (
  `game_id` VARCHAR(45) NOT NULL,
  `date` DATE NULL,
  `home_team_id` VARCHAR(45) NULL,
  `away_team_id` VARCHAR(45) NULL,
  `referee_id` VARCHAR(45) NOT NULL,
  `venue_id` VARCHAR(45) NOT NULL,
  `season_id_season` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`game_id`),
  INDEX `fk_Game_main_referee1_idx` (`referee_id` ASC) VISIBLE,
  INDEX `fk_Game_Venue1_idx` (`venue_id` ASC) VISIBLE,
  INDEX `fk_Game_season1_idx` (`season_id_season` ASC) VISIBLE,
  CONSTRAINT `fk_Game_main_referee1`
    FOREIGN KEY (`referee_id`)
    REFERENCES `main_referee` (`referee_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Game_Venue1`
    FOREIGN KEY (`venue_id`)
    REFERENCES `Venue` (`venue_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Game_season1`
    FOREIGN KEY (`season_id_season`)
    REFERENCES `season` (`id_season`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Coach_has_team`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Coach_has_team` (
  `id_coach` VARCHAR(45) NOT NULL,
  `id_team` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_coach`, `id_team`),
  INDEX `fk_Coach_has_team_team1_idx` (`id_team` ASC) VISIBLE,
  INDEX `fk_Coach_has_team_Coach1_idx` (`id_coach` ASC) VISIBLE,
  CONSTRAINT `fk_Coach_has_team_Coach1`
    FOREIGN KEY (`id_coach`)
    REFERENCES `Coach` (`id_coach`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Coach_has_team_team1`
    FOREIGN KEY (`id_team`)
    REFERENCES `team` (`id_team`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Game_has_team`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Game_has_team` (
  `game_id` VARCHAR(45) NOT NULL,
  `id_team` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`game_id`, `id_team`),
  INDEX `fk_Game_has_team_team1_idx` (`id_team` ASC) VISIBLE,
  INDEX `fk_Game_has_team_Game1_idx` (`game_id` ASC) VISIBLE,
  CONSTRAINT `fk_Game_has_team_Game1`
    FOREIGN KEY (`game_id`)
    REFERENCES `Game` (`game_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Game_has_team_team1`
    FOREIGN KEY (`id_team`)
    REFERENCES `team` (`id_team`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `player_has_Game`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `player_has_Game` (
  `player_id` VARCHAR(45) NOT NULL,
  `game_id` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`player_id`, `game_id`),
  INDEX `fk_player_has_Game_Game1_idx` (`game_id` ASC) VISIBLE,
  INDEX `fk_player_has_Game_player1_idx` (`player_id` ASC) VISIBLE,
  CONSTRAINT `fk_player_has_Game_player1`
    FOREIGN KEY (`player_id`)
    REFERENCES `player` (`player_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_player_has_Game_Game1`
    FOREIGN KEY (`game_id`)
    REFERENCES `Game` (`game_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `team_has_player`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `team_has_player` (
  `id_team` VARCHAR(45) NOT NULL,
  `player_id` VARCHAR(45) NOT NULL,
  `salary` INT NULL,
  `start_date` DATE NULL,
  `end_date` DATE NULL,
  PRIMARY KEY (`id_team`, `player_id`),
  INDEX `fk_team_has_player_player1_idx` (`player_id` ASC) VISIBLE,
  INDEX `fk_team_has_player_team1_idx` (`id_team` ASC) VISIBLE,
  CONSTRAINT `fk_team_has_player_team1`
    FOREIGN KEY (`id_team`)
    REFERENCES `team` (`id_team`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_team_has_player_player1`
    FOREIGN KEY (`player_id`)
    REFERENCES `player` (`player_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `table1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `table1` (
)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `team_season_stats`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `team_season_stats` (
  `team_id_team` VARCHAR(45) NOT NULL,
  `season_id_season` VARCHAR(45) NOT NULL,
  `wins` INT NULL,
  `losses` INT NULL,
  PRIMARY KEY (`team_id_team`, `season_id_season`),
  INDEX `fk_team_has_season_season1_idx` (`season_id_season` ASC) VISIBLE,
  INDEX `fk_team_has_season_team1_idx` (`team_id_team` ASC) VISIBLE,
  CONSTRAINT `fk_team_has_season_team1`
    FOREIGN KEY (`team_id_team`)
    REFERENCES `team` (`id_team`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_team_has_season_season1`
    FOREIGN KEY (`season_id_season`)
    REFERENCES `season` (`id_season`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;






INSERT INTO Position (id_position, name)
VALUES
  ('PG', 'Point Guard'),
  ('SG', 'Shooting Guard'),
  ('SF', 'Small Forward'),
  ('PF', 'Power Forward'),
  ('C',  'Center');

INSERT INTO Draft (id_draft, year, location)
VALUES
('1',  '1996', 'East Rutherford, NJ'),  -- Kobe Bryant, Allen Iverson, Steve Nash, Ray Allen
('2',  '1997', 'Charlotte, NC'),        -- Tim Duncan, Chauncey Billups, Tracy McGrady
('3',  '1998', 'Vancouver, BC'),        -- Dirk Nowitzki, Paul Pierce, Vince Carter
('4',  '1999', 'Washington, DC'),       -- Elton Brand, Steve Francis, Shawn Marion
('5',  '2000', 'Minneapolis, MN'),      -- Kenyon Martin, Jamal Crawford, Michael Redd
('6',  '2001', 'New York, NY'),         -- Pau Gasol, Joe Johnson, Tony Parker
('7',  '2002', 'New York, NY'),         -- Yao Ming, Amar’e Stoudemire, Caron Butler
('8',  '2003', 'New York, NY'),         -- LeBron James, Carmelo Anthony, Dwyane Wade, Chris Bosh
('9',  '2004', 'New York, NY'),         -- Dwight Howard, Andre Iguodala, Al Jefferson
('10', '2005', 'New York, NY'),         -- Chris Paul, Deron Williams, Andrew Bogut
('11', '2006', 'New York, NY'),         -- LaMarcus Aldridge, Brandon Roy, Rudy Gay
('12', '2007', 'New York, NY'),         -- Kevin Durant, Al Horford, Mike Conley
('13', '2008', 'New York, NY'),         -- Derrick Rose, Russell Westbrook, Kevin Love
('14', '2009', 'New York, NY'),         -- Blake Griffin, James Harden, Stephen Curry, DeMar DeRozan
('15', '2010', 'New York, NY'),         -- John Wall, DeMarcus Cousins, Paul George
('16', '2011', 'Newark, NJ'),           -- Kyrie Irving, Kawhi Leonard, Klay Thompson, Jimmy Butler
('17', '2012', 'Newark, NJ'),           -- Anthony Davis, Damian Lillard, Bradley Beal, Draymond Green
('18', '2013', 'Brooklyn, NY'),         -- Giannis Antetokounmpo, Victor Oladipo, Rudy Gobert
('19', '2014', 'Brooklyn, NY'),         -- Joel Embiid, Andrew Wiggins, Jabari Parker, Nikola Jokic
('20', '2015', 'Brooklyn, NY'),         -- Karl-Anthony Towns, Kristaps Porzingis, Devin Booker
('21', '2016', 'Brooklyn, NY'),         -- Ben Simmons, Brandon Ingram, Jaylen Brown, Pascal Siakam
('22', '2017', 'Brooklyn, NY'),         -- Jayson Tatum, Donovan Mitchell, Bam Adebayo
('23', '2018', 'Brooklyn, NY'),         -- Luka Doncic, Trae Young, Shai Gilgeous-Alexander, Deandre Ayton
('24', '2019', 'Brooklyn, NY'),         -- Zion Williamson, Ja Morant, RJ Barrett
('25', '2020', 'Brooklyn, NY'),         -- Anthony Edwards, LaMelo Ball, Tyrese Haliburton
('26', '2021', 'Brooklyn, NY'),         -- Cade Cunningham, Evan Mobley, Scottie Barnes
('27', '2022', 'Brooklyn, NY'),         -- Paolo Banchero, Chet Holmgren, Jabari Smith Jr.
('28', '2023', 'Brooklyn, NY'),         -- Victor Wembanyama, Brandon Miller, Scoot Henderson, Kyshawn George
('29', '2024', 'Brooklyn, NY'),         -- Zaccharie Risacher, Matas Buzelis, Ron Holland
('30', '2025', 'Brooklyn, NY'),         -- Cooper Flagg (projected), Ace Bailey
('31', '2001', 'New York, NY'),         -- Duplicate ID for expansion if needed
('32', '2002', 'New York, NY');         -- Duplicate ID for expansion if needed

INSERT INTO college (id_college, name, city, state, conference)
VALUES ('C000', 'None', NULL, NULL, NULL);

INSERT INTO college (id_college, name, city, state, conference)
VALUES
('C001', 'Duke University', 'Durham', 'NC', 'ACC'),
('C002', 'University of Kentucky', 'Lexington', 'KY', 'SEC'),
('C003', 'University of Texas', 'Austin', 'TX', 'Big 12'),
('C004', 'San Diego State University', 'San Diego', 'CA', 'MWC'),
('C005', 'University of Kansas', 'Lawrence', 'KS', 'Big 12'),
('C006', 'Davidson College', 'Davidson', 'NC', 'A-10'),
('C007', 'Weber State University', 'Ogden', 'UT', 'Big Sky'),
('C008', 'New Mexico State University', 'Las Cruces', 'NM', 'WAC'),
('C009', 'Arizona State University', 'Tempe', 'AZ', 'Pac-12'),
('C010', 'University of California, Berkeley', 'Berkeley', 'CA', 'Pac-12'),
('C011', 'Gonzaga University', 'Spokane', 'WA', 'WCC'),
('C012', 'University of Miami', 'Coral Gables', 'FL', 'ACC');
INSERT INTO college (id_college, name, city, state, conference)
VALUES
('C013', 'University of North Carolina', 'Chapel Hill', 'NC', 'ACC'),
('C016', 'University of Connecticut', 'Storrs', 'CT', 'Big East'),
('C017', 'Georgetown University', 'Washington', 'DC', 'Big East'),
('C018', 'Wake Forest University', 'Winston-Salem', 'NC', 'ACC'),
('C019', 'Marquette University', 'Milwaukee', 'WI', 'Big East'),
('C020', 'Georgia Tech', 'Atlanta', 'GA', 'ACC'),
('C021', 'University of Florida', 'Gainesville', 'FL', 'SEC'),
('C022', 'Washington State University', 'Pullman', 'WA', 'Pac-12'),
('C023', 'Marquette University', 'Milwaukee', 'WI', 'Big East'), -- duplicate, but needed for FK
('C024', 'Louisiana State University', 'Baton Rouge', 'LA', 'SEC'),
('C025', 'University of Louisville', 'Louisville', 'KY', 'ACC'),
('C026', 'University of Oklahoma', 'Norman', 'OK', 'Big 12'),
('C027', 'Murray State University', 'Murray', 'KY', 'OVC'),
('C028', 'University of Georgia', 'Athens', 'GA', 'SEC'),
('C029', 'Iowa State University', 'Ames', 'IA', 'Big 12'),
('C030', 'Oklahoma State University', 'Stillwater', 'OK', 'Big 12'),
('C031', 'University of Alabama', 'Tuscaloosa', 'AL', 'SEC'),
('C032', 'Rutgers University', 'New Brunswick', 'NJ', 'Big Ten'),
('C033', 'Santa Clara University', 'Santa Clara', 'CA', 'WCC'),
('C034', 'University of Colorado', 'Boulder', 'CO', 'Big 12'),
('C035', 'University of Maryland', 'College Park', 'MD', 'ACC'),
('C036', 'University of Nevada, Las Vegas', 'Las Vegas', 'NV', 'MWC'),
('C037', 'University of Cincinnati', 'Cincinnati', 'OH', 'Big East'),
('C038', 'University of Michigan', 'Ann Arbor', 'MI', 'Big Ten'),
('C039', 'University of Arkansas', 'Fayetteville', 'AR', 'SEC');


INSERT INTO team (id_team, name, city, conference, division)
VALUES
('T001', 'Atlanta Hawks', 'Atlanta', 'Eastern', 'Southeast'),
('T002', 'Boston Celtics', 'Boston', 'Eastern', 'Atlantic'),
('T003', 'Brooklyn Nets', 'Brooklyn', 'Eastern', 'Atlantic'),
('T004', 'Charlotte Hornets', 'Charlotte', 'Eastern', 'Southeast'),
('T005', 'Chicago Bulls', 'Chicago', 'Eastern', 'Central'),
('T006', 'Cleveland Cavaliers', 'Cleveland', 'Eastern', 'Central'),
('T007', 'Detroit Pistons', 'Detroit', 'Eastern', 'Central'),
('T008', 'Indiana Pacers', 'Indianapolis', 'Eastern', 'Central'),
('T009', 'Miami Heat', 'Miami', 'Eastern', 'Southeast'),
('T010', 'Milwaukee Bucks', 'Milwaukee', 'Eastern', 'Central'),
('T011', 'New York Knicks', 'New York', 'Eastern', 'Atlantic'),
('T012', 'Orlando Magic', 'Orlando', 'Eastern', 'Southeast'),
('T013', 'Philadelphia 76ers', 'Philadelphia', 'Eastern', 'Atlantic'),
('T014', 'Toronto Raptors', 'Toronto', 'Eastern', 'Atlantic'),
('T015', 'Washington Wizards', 'Washington', 'Eastern', 'Southeast'),
('T016', 'Dallas Mavericks', 'Dallas', 'Western', 'Southwest'),
('T017', 'Denver Nuggets', 'Denver', 'Western', 'Northwest'),
('T018', 'Golden State Warriors', 'San Francisco', 'Western', 'Pacific'),
('T019', 'Houston Rockets', 'Houston', 'Western', 'Southwest'),
('T020', 'Los Angeles Clippers', 'Los Angeles', 'Western', 'Pacific'),
('T021', 'Los Angeles Lakers', 'Los Angeles', 'Western', 'Pacific'),
('T022', 'Memphis Grizzlies', 'Memphis', 'Western', 'Southwest'),
('T023', 'Minnesota Timberwolves', 'Minneapolis', 'Western', 'Northwest'),
('T024', 'New Orleans Pelicans', 'New Orleans', 'Western', 'Southwest'),
('T025', 'Oklahoma City Thunder', 'Oklahoma City', 'Western', 'Northwest'),
('T026', 'Phoenix Suns', 'Phoenix', 'Western', 'Pacific'),
('T027', 'Portland Trail Blazers', 'Portland', 'Western', 'Northwest'),
('T028', 'Sacramento Kings', 'Sacramento', 'Western', 'Pacific'),
('T029', 'San Antonio Spurs', 'San Antonio', 'Western', 'Southwest'),
('T030', 'Utah Jazz', 'Salt Lake City', 'Western', 'Northwest'),
-- Historic Teams
('T031', 'Seattle SuperSonics', 'Seattle', 'Western', 'Northwest'),
('T032', 'New Jersey Nets', 'East Rutherford', 'Eastern', 'Atlantic'),
('T033', 'Vancouver Grizzlies', 'Vancouver', 'Western', 'Northwest'),
('T034', 'Charlotte Bobcats', 'Charlotte', 'Eastern', 'Southeast');




INSERT INTO player (
  player_id, player, DOB, height, weight, id_position, id_draft, college_id_college
)
VALUES
-- 1996 Draft (id_draft = '1')
('P048', 'Kobe Bryant', '1978-08-23', 78, 212, 'SG', '1', 'C000'),     -- None (Lower Merion HS)
('P049', 'Allen Iverson', '1975-06-07', 72, 165, 'PG', '1', 'C017'),   -- Georgetown
('P050', 'Steve Nash', '1974-02-07', 75, 195, 'PG', '1', 'C033'),      -- Santa Clara
('P051', 'Ray Allen', '1975-07-20', 77, 205, 'SG', '1', 'C016'),       -- UConn

-- 1997 Draft (id_draft = '2')
('P052', 'Tim Duncan', '1976-04-25', 83, 250, 'PF', '2', 'C018'),      -- Wake Forest
('P053', 'Chauncey Billups', '1976-09-25', 75, 202, 'PG', '2', 'C034'),-- Colorado
('P054', 'Tracy McGrady', '1979-05-24', 80, 210, 'SG', '2', 'C000'),   -- None (HS)

-- 1998 Draft (id_draft = '3')
('P055', 'Dirk Nowitzki', '1978-06-19', 84, 245, 'PF', '3', 'C000'),   -- International
('P056', 'Paul Pierce', '1977-10-13', 79, 235, 'SF', '3', 'C005'),     -- Kansas
('P057', 'Vince Carter', '1977-01-26', 78, 220, 'SG', '3', 'C013'),    -- UNC

-- 1999 Draft (id_draft = '4')
('P058', 'Elton Brand', '1979-03-11', 81, 254, 'PF', '4', 'C001'),     -- Duke
('P059', 'Steve Francis', '1977-02-21', 75, 210, 'PG', '4', 'C035'),   -- Maryland
('P060', 'Shawn Marion', '1978-05-07', 79, 220, 'SF', '4', 'C036'),    -- UNLV

-- 2000 Draft (id_draft = '5')
('P061', 'Kenyon Martin', '1977-12-30', 81, 230, 'PF', '5', 'C037'),   -- Cincinnati
('P062', 'Mike Miller', '1980-02-19', 80, 218, 'SG', '5', 'C021'),     -- Florida
('P063', 'Jamal Crawford', '1980-03-20', 76, 200, 'SG', '5', 'C038'),  -- Michigan

-- 2001 Draft (id_draft = '6')
('P064', 'Pau Gasol', '1980-07-06', 84, 250, 'PF', '6', 'C000'),       -- International
('P065', 'Joe Johnson', '1981-06-29', 79, 240, 'SG', '6', 'C039'),     -- Arkansas
('P066', 'Tony Parker', '1982-05-17', 74, 185, 'PG', '6', 'C000'),     -- International

-- 2002 Draft (id_draft = '7')
('P067', 'Yao Ming', '1980-09-12', 88, 310, 'C', '7', 'C000'),         -- International
('P068', 'Amar’e Stoudemire', '1982-11-16', 82, 245, 'PF', '7', 'C000'), -- None (HS)
('P069', 'Caron Butler', '1980-03-13', 79, 215, 'SF', '7', 'C016'),    -- UConn


-- 2003 Draft
('P001', 'LeBron James', '1984-12-30', 81, 250, 'SF', '8', 'C000'),   -- None
('P002', 'Carmelo Anthony', '1984-05-29', 80, 240, 'SF', '8', 'C013'), -- Syracuse
('P003', 'Dwyane Wade', '1982-01-17', 76, 220, 'SG', '8', 'C019'),     -- Marquette
('P004', 'Chris Bosh', '1984-03-24', 83, 235, 'PF', '8', 'C020'),      -- Georgia Tech

-- 2007 Draft
('P005', 'Kevin Durant', '1988-09-29', 82, 240, 'SF', '12', 'C003'),   -- Texas
('P006', 'Al Horford', '1986-06-03', 82, 245, 'C', '12', 'C021'),      -- Florida
('P007', 'Mike Conley', '1987-10-11', 73, 175, 'PG', '12', 'C020'),  

-- 2009 Draft
('P008', 'Stephen Curry', '1988-03-14', 74, 185, 'PG', '14', 'C006'),  -- Davidson
('P009', 'James Harden', '1989-08-26', 77, 220, 'SG', '14', 'C009'),   -- Arizona State

-- 2011 Draft
('P011', 'Kyrie Irving', '1992-03-23', 74, 195, 'PG', '16', 'C001'),   -- Duke
('P012', 'Kawhi Leonard', '1991-06-29', 79, 225, 'SF', '16', 'C004'),  -- San Diego State
('P013', 'Klay Thompson', '1990-02-08', 78, 215, 'SG', '16', 'C022'),  -- Washington State
('P014', 'Jimmy Butler', '1989-09-14', 79, 230, 'SF', '16', 'C023'), 

-- 2012 Draft
('P015', 'Anthony Davis', '1993-03-11', 82, 253, 'PF', '17', 'C002'),  -- Kentucky
('P016', 'Damian Lillard', '1990-07-15', 74, 195, 'PG', '17', 'C007'), -- Weber State
('P017', 'Bradley Beal', '1993-06-28', 76, 210, 'SG', '17', 'C021'),   -- Florida


-- 2014 Draft
('P018', 'Joel Embiid', '1994-03-16', 84, 280, 'C', '19', 'C005'),     -- Kansas
('P019', 'Andrew Wiggins', '1995-02-23', 80, 200, 'SF', '19', 'C005'), -- Kansas
('P020', 'Nikola Jokic', '1995-02-19', 83, 284, 'C', '19', 'C000'),    -- Mega Basket (None placeholder)


-- 2015 Draft
('P021', 'Karl-Anthony Towns', '1995-11-15', 83, 248, 'C', '20', 'C002'), -- Kentucky
('P022', 'Kristaps Porzingis', '1995-08-02', 87, 240, 'PF', '20', 'C000'), -- International
('P023', 'Devin Booker', '1996-10-30', 77, 210, 'SG', '20', 'C002'),      -- Kentucky



-- 2016 Draft
('P024', 'Ben Simmons', '1996-07-20', 82, 240, 'SF', '21', 'C024'),    -- LSU
('P025', 'Brandon Ingram', '1997-09-02', 81, 190, 'SF', '21', 'C001'), -- Duke
('P026', 'Jaylen Brown', '1996-10-24', 78, 223, 'SG', '21', 'C010'),   -- UC Berkeley
('P027', 'Pascal Siakam', '1994-04-02', 81, 230, 'PF', '21', 'C008'),  -- New Mexico State



-- 2017 Draft
('P028', 'Jayson Tatum', '1998-03-03', 80, 210, 'SF', '22', 'C001'),   -- Duke
('P029', 'Donovan Mitchell', '1996-09-07', 75, 215, 'SG', '22', 'C025'), -- Louisville
('P030', 'Bam Adebayo', '1997-07-18', 81, 255, 'C', '22', 'C002'),     -- Kentucky


-- 2018 Draft
('P031', 'Luka Doncic', '1999-02-28', 79, 230, 'PG', '23', 'C000'),    -- Real Madrid (None placeholder)
('P032', 'Trae Young', '1998-09-19', 73, 180, 'PG', '23', 'C026'),     -- Oklahoma
('P033', 'Shai Gilgeous-Alexander', '1998-07-12', 78, 180, 'PG', '23', 'C002'), -- Kentucky



-- 2019 Draft
('P034', 'Zion Williamson', '2000-07-06', 78, 284, 'PF', '24', 'C001'), -- Duke
('P035', 'Ja Morant', '1999-08-10', 75, 174, 'PG', '24', 'C027'),       -- Murray State
('P036', 'RJ Barrett', '2000-06-14', 78, 214, 'SG', '24', 'C001'),      -- Duke


-- 2020 Draft
('P037', 'Anthony Edwards', '2001-08-05', 76, 225, 'SG', '25', 'C028'), -- Georgia
('P038', 'LaMelo Ball', '2001-08-22', 79, 190, 'PG', '25', 'C000'),     -- International
('P039', 'Tyrese Haliburton', '2000-02-29', 77, 185, 'PG', '25', 'C029'), -- Iowa State


-- 2023 Draft
('P043', 'Victor Wembanyama', '2004-01-04', 87, 230, 'C', '28', 'C000'), -- International
('P044', 'Brandon Miller', '2002-11-22', 80, 200, 'SF', '28', 'C031'),   -- Alabama
('P045', 'Scoot Henderson', '2004-02-03', 74, 200, 'PG', '28', 'C000'),  -- G League Ignite

-- 2025 Draft (Projected)
('P046', 'Cooper Flagg', '2006-12-21', 81, 210, 'PF', '30', 'C001'),     -- Duke
('P047', 'Ace Bailey', '2006-12-18', 80, 210, 'SF', '30', 'C032');       -- Rutgers





INSERT INTO team_has_player (id_team, player_id, salary, start_date, end_date)
VALUES
-- 1996 Draft
('T021', 'P048', 3500000, '1996-11-01', '2016-06-30'),   -- Kobe Bryant → Lakers
('T013', 'P049', 3000000, '1996-11-01', '2006-06-30'),   -- Allen Iverson → 76ers
('T018', 'P050', 1500000, '1996-11-01', '2015-06-30'),   -- Steve Nash → Suns
('T005', 'P051', 2000000, '1996-11-01', '2014-06-30'),   -- Ray Allen → Bulls

-- 2003 Draft
('T006', 'P001', 4000000, '2003-11-01', '2025-06-30'),   -- LeBron James → Cavaliers
('T024', 'P002', 3500000, '2003-11-01', '2025-06-30'),   -- Carmelo Anthony → Nuggets
('T009', 'P003', 3000000, '2003-11-01', '2019-06-30'),   -- Dwyane Wade → Heat
('T005', 'P004', 2800000, '2003-11-01', '2017-06-30'),   -- Chris Bosh → Raptors

-- 2007 Draft
('T031', 'P005', 4500000, '2007-11-01', '2025-06-30'),   -- Kevin Durant → Sonics/Thunder
('T001', 'P006', 3000000, '2007-11-01', '2025-06-30'),   -- Al Horford → Hawks
('T022', 'P007', 2500000, '2007-11-01', '2025-06-30'),   -- Mike Conley → Grizzlies

-- 2009 Draft
('T018', 'P008', 3000000, '2009-11-01', '2025-06-30'),   -- Stephen Curry → Warriors
('T025', 'P009', 2800000, '2009-11-01', '2025-06-30'),   -- James Harden → Thunder

-- 2011 Draft
('T006', 'P011', 4000000, '2011-11-01', '2025-06-30'),   -- Kyrie Irving → Cavaliers
('T029', 'P012', 2500000, '2011-11-01', '2025-06-30'),   -- Kawhi Leonard → Spurs
('T018', 'P013', 2200000, '2011-11-01', '2025-06-30'),   -- Klay Thompson → Warriors
('T005', 'P014', 2000000, '2011-11-01', '2025-06-30'),   -- Jimmy Butler → Bulls

-- 2014 Draft
('T013', 'P018', 4000000, '2014-11-01', '2025-06-30'),   -- Joel Embiid → 76ers
('T023', 'P019', 3500000, '2014-11-01', '2025-06-30'),   -- Andrew Wiggins → Timberwolves
('T017', 'P020', 2500000, '2014-11-01', '2025-06-30'),   -- Nikola Jokic → Nuggets

-- 2015 Draft
('T023', 'P021', 5000000, '2015-11-01', '2025-06-30'),   -- Karl-Anthony Towns → Timberwolves
('T011', 'P022', 3000000, '2015-11-01', '2025-06-30'),   -- Kristaps Porzingis → Knicks
('T026', 'P023', 2200000, '2015-11-01', '2025-06-30'),   -- Devin Booker → Suns

-- 2016 Draft
('T015', 'P024', 5000000, '2016-11-01', '2025-06-30'),   -- Ben Simmons → 76ers
('T011', 'P025', 4000000, '2016-11-01', '2025-06-30'),   -- Brandon Ingram → Lakers
('T002', 'P026', 3500000, '2016-11-01', '2025-06-30'),   -- Jaylen Brown → Celtics
('T015', 'P027', 2500000, '2016-11-01', '2025-06-30'),   -- Pascal Siakam → Raptors

-- 2017 Draft
('T002', 'P028', 4000000, '2017-11-01', '2025-06-30'),   -- Jayson Tatum → Celtics
('T015', 'P029', 3500000, '2017-11-01', '2025-06-30'),   -- Donovan Mitchell → Jazz
('T009', 'P030', 3000000, '2017-11-01', '2025-06-30'),   -- Bam Adebayo → Heat

-- 2018 Draft
('T016', 'P031', 4000000, '2018-11-01', '2025-06-30'),   -- Luka Doncic → Mavericks
('T025', 'P032', 3500000, '2018-11-01', '2025-06-30'),   -- Trae Young → Hawks
('T015', 'P033', 3000000, '2018-11-01', '2025-06-30'),   -- Shai Gilgeous-Alexander → Clippers

-- 2019 Draft
('T024', 'P034', 5000000, '2019-11-01', '2025-06-30'),   -- Zion Williamson → Pelicans
('T022', 'P035', 4000000, '2019-11-01', '2025-06-30'),   -- Ja Morant → Grizzlies
('T002', 'P036', 3000000, '2019-11-01', '2025-06-30'),   -- RJ Barrett → Knicks

-- 2020 Draft
('T023', 'P037', 4000000, '2020-11-01', '2025-06-30'),   -- Anthony Edwards → Timberwolves
('T024', 'P038', 3500000, '2020-11-01', '2025-06-30'),   -- LaMelo Ball → Hornets
('T009', 'P039', 3000000, '2020-11-01', '2025-06-30'),   -- Tyrese Haliburton → Kings

-- 2023 Draft
('T025', 'P043', 5000000, '2023-11-01', '2025-06-30');   -- Victor Wembanyama → Spurs


INSERT INTO Venue (venue_id, name, city, state, max_occupancy)
VALUES
('V001', 'Madison Square Garden', 'New York', 'NY', 19800),
('V002', 'United Center', 'Chicago', 'IL', 20917),
('V003', 'TD Garden', 'Boston', 'MA', 19580),
('V004', 'Crypto.com Arena', 'Los Angeles', 'CA', 19068),
('V005', 'Chase Center', 'San Francisco', 'CA', 18064),
('V006', 'Kaseya Center', 'Miami', 'FL', 19600),
('V007', 'Toyota Center', 'Houston', 'TX', 18055),
('V008', 'Ball Arena', 'Denver', 'CO', 19520),
('V009', 'Wells Fargo Center', 'Philadelphia', 'PA', 20478),
('V010', 'Fiserv Forum', 'Milwaukee', 'WI', 17500),
('V011', 'KeyArena', 'Seattle', 'WA', 17100),
('V012', 'Continental Airlines Arena', 'East Rutherford', 'NJ', 20100),
('V013', 'General Motors Place', 'Vancouver', 'BC', 18910),
('V014', 'Time Warner Cable Arena', 'Charlotte', 'NC', 19077);

INSERT INTO season (id_season, start_date, end_date)
VALUES
('S001', '1996-11-01', '1997-06-30'),
('S002', '1997-11-01', '1998-06-30'),
('S003', '1998-11-01', '1999-06-30'),
('S004', '1999-11-01', '2000-06-30'),
('S005', '2000-11-01', '2001-06-30'),
('S006', '2001-11-01', '2002-06-30'),
('S007', '2002-11-01', '2003-06-30'),
('S008', '2003-11-01', '2004-06-30'),
('S009', '2004-11-01', '2005-06-30'),
('S010', '2005-11-01', '2006-06-30'),
('S011', '2006-11-01', '2007-06-30'),
('S012', '2007-11-01', '2008-06-30'),
('S013', '2008-11-01', '2009-06-30'),
('S014', '2009-11-01', '2010-06-30'),
('S015', '2010-10-26', '2011-06-12'),
('S016', '2011-12-25', '2012-06-21'),
('S017', '2012-10-30', '2013-06-20'),
('S018', '2013-10-29', '2014-06-15'),
('S019', '2014-10-28', '2015-06-16'),
('S020', '2015-10-27', '2016-06-19'),
('S021', '2016-10-25', '2017-06-12'),
('S022', '2017-10-17', '2018-06-08'),
('S023', '2018-10-16', '2019-06-13'),
('S024', '2019-10-22', '2020-10-11'),
('S025', '2020-12-22', '2021-07-20'),
('S026', '2021-10-19', '2022-06-16'),
('S027', '2022-10-18', '2023-06-12'),
('S028', '2023-10-24', '2024-06-15'),
('S029', '2024-10-22', '2025-06-15');


INSERT INTO main_referee (referee_id, Referee)
VALUES
-- Historic referees
('R001', 'Joey Crawford'),
('R002', 'Dick Bavetta'),
('R003', 'Steve Javie'),
('R004', 'Earl Strom'),
('R005', 'Jake O\'Donnell'),

-- Long-tenured modern referees
('R006', 'Scott Foster'),
('R007', 'Tony Brothers'),
('R008', 'Ken Mauer'),
('R009', 'Monty McCutchen'),
('R010', 'Bill Kennedy'),
('R011', 'James Capers'),
('R012', 'Marc Davis'),
('R013', 'Ed Malloy'),
('R014', 'Tom Washington'),
('R015', 'Sean Wright'),

-- Current referees (2020s)
('R016', 'Zach Zarba'),
('R017', 'David Guthrie'),
('R018', 'Josh Tiven'),
('R019', 'Kevin Scott'),
('R020', 'Ben Taylor'),
('R021', 'John Goble'),
('R022', 'Michael Smith'),
('R023', 'Lauren Holtkamp'),
('R024', 'Ashley Moyer-Gleich'),
('R025', 'Natalie Sago');

INSERT INTO team_season_stats (team_id_team, season_id_season, wins, losses)
VALUES
-- 1996-97 Season
('T021', 'S001', 53, 29),   -- Lakers
('T013', 'S001', 44, 38),   -- 76ers
('T005', 'S001', 69, 13),   -- Bulls

-- 2003-04 Season
('T006', 'S008', 50, 32),   -- Cavaliers (LeBron rookie)
('T009', 'S008', 42, 40),   -- Heat (Wade rookie)
('T024', 'S008', 43, 39),   -- Nuggets (Carmelo rookie)

-- 2007-08 Season
('T031', 'S012', 20, 62),   -- Sonics (Durant rookie)
('T001', 'S012', 37, 45),   -- Hawks (Horford rookie)
('T022', 'S012', 50, 32),   -- Grizzlies (Conley rookie)

-- 2009-10 Season
('T018', 'S014', 57, 25),   -- Warriors (Curry rookie)
('T025', 'S014', 50, 32),   -- Thunder (Harden rookie)

-- 2011-12 Season
('T006', 'S016', 21, 45),   -- Cavaliers (Kyrie rookie, lockout season)
('T029', 'S016', 50, 16),   -- Spurs (Kawhi rookie)
('T018', 'S016', 23, 43),   -- Warriors (Klay rookie)

-- 2014-15 Season
('T013', 'S019', 18, 64),   -- 76ers (Embiid rookie, injured)
('T023', 'S019', 16, 66),   -- Timberwolves (Wiggins rookie)
('T017', 'S019', 30, 52),   -- Nuggets (Jokic rookie)

-- 2015-16 Season (Warriors 73 wins, Cavs comeback)
('T018', 'S020', 73, 9),    -- Golden State Warriors
('T006', 'S020', 57, 25),   -- Cleveland Cavaliers
('T002', 'S020', 48, 34),   -- Boston Celtics

-- 2016-17 Season (Warriors add Durant)
('T018', 'S021', 67, 15),   -- Golden State Warriors
('T006', 'S021', 51, 31),   -- Cleveland Cavaliers
('T029', 'S021', 61, 21),   -- San Antonio Spurs

-- 2018-19 Season (Raptors title)
('T014', 'S023', 58, 24),   -- Toronto Raptors
('T018', 'S023', 57, 25),   -- Golden State Warriors
('T002', 'S023', 49, 33),   -- Boston Celtics

-- 2019-20 Season (Bubble season)
('T017', 'S024', 46, 27),   -- Denver Nuggets
('T021', 'S024', 52, 19),   -- Los Angeles Lakers
('T009', 'S024', 44, 29),   -- Miami Heat

-- 2021-22 Season (Warriors return to glory)
('T018', 'S026', 53, 29),   -- Golden State Warriors
('T002', 'S026', 51, 31),   -- Boston Celtics
('T017', 'S026', 48, 34),   -- Denver Nuggets

-- 2022-23 Season (Nuggets first championship)
('T017', 'S027', 53, 29),   -- Denver Nuggets
('T021', 'S027', 43, 39),   -- Los Angeles Lakers
('T009', 'S027', 44, 38);   -- Miami Heat

INSERT INTO Game (game_id, date, home_team_id, away_team_id, referee_id, venue_id, season_id_season)
VALUES
-- 1996-97 Season (Kobe & Iverson rookies)
('G001', '1996-11-03', 'T021', 'T002', 'R001', 'V004', 'S001'),   -- Lakers vs Celtics, Joey Crawford
('G002', '1996-12-10', 'T013', 'T005', 'R002', 'V009', 'S001'),   -- 76ers vs Bulls, Dick Bavetta
('G003', '1997-03-15', 'T005', 'T021', 'R003', 'V002', 'S001'),   -- Bulls vs Lakers, Steve Javie

-- 2003-04 Season (LeBron, Melo, Wade rookies)
('G004', '2003-10-29', 'T006', 'T009', 'R004', 'V008', 'S008'),   -- Cavaliers vs Heat, Scott Foster
('G005', '2003-11-07', 'T024', 'T002', 'R005', 'V008', 'S008'),   -- Nuggets vs Celtics, Tony Brothers
('G006', '2004-02-01', 'T009', 'T005', 'R006', 'V006', 'S008'),   -- Heat vs Bulls, Ken Mauer

-- 2007-08 Season (Durant rookie)
('G007', '2007-11-01', 'T031', 'T018', 'R007', 'V011', 'S012'),   -- Sonics vs Warriors, Monty McCutchen
('G008', '2008-01-15', 'T001', 'T031', 'R008', 'V002', 'S012'),   -- Hawks vs Sonics, Bill Kennedy
('G009', '2008-03-20', 'T022', 'T005', 'R009', 'V008', 'S012'),   -- Grizzlies vs Bulls, James Capers

-- 2009-10 Season (Curry rookie)
('G010', '2009-10-28', 'T018', 'T027', 'R010', 'V005', 'S014'),   -- Warriors vs Blazers, Marc Davis
('G011', '2010-01-05', 'T025', 'T018', 'R001', 'V007', 'S014'),   -- Thunder vs Warriors, Joey Crawford
('G012', '2010-03-12', 'T005', 'T018', 'R002', 'V002', 'S014'),   -- Bulls vs Warriors, Dick Bavetta

-- 2011-12 Season (Kyrie rookie, lockout)
('G013', '2011-12-26', 'T006', 'T005', 'R003', 'V002', 'S016'),   -- Cavaliers vs Bulls, Steve Javie
('G014', '2012-01-10', 'T029', 'T018', 'R004', 'V008', 'S016'),   -- Spurs vs Warriors, Scott Foster
('G015', '2012-03-01', 'T018', 'T013', 'R005', 'V005', 'S016'),   -- Warriors vs 76ers, Tony Brothers

-- 2014-15 Season (Embiid, Wiggins, Jokic rookies)
('G016', '2014-11-01', 'T013', 'T002', 'R006', 'V009', 'S019'),   -- 76ers vs Celtics, Ken Mauer
('G017', '2015-01-15', 'T023', 'T017', 'R007', 'V008', 'S019'),   -- Timberwolves vs Nuggets, Monty McCutchen
('G018', '2015-03-20', 'T017', 'T005', 'R008', 'V008', 'S019'),   -- Nuggets vs Bulls, Bill Kennedy

-- 2019-20 Season (Bubble season)
('G019', '2020-07-30', 'T021', 'T018', 'R009', 'V006', 'S024'),   -- Lakers vs Warriors, James Capers
('G020', '2020-08-12', 'T009', 'T017', 'R010', 'V006', 'S024'),   -- Heat vs Nuggets, Marc Davis
('G021', '2020-09-15', 'T021', 'T009', 'R001', 'V006', 'S024'),   -- Lakers vs Heat, Joey Crawford

-- 2022 Finals (Warriors vs Celtics)
('G022', '2022-06-02', 'T018', 'T002', 'R004', 'V005', 'S026'),   -- Warriors vs Celtics, Scott Foster
('G023', '2022-06-08', 'T002', 'T018', 'R005', 'V003', 'S026'),   -- Celtics vs Warriors, Tony Brothers
('G024', '2022-06-16', 'T018', 'T002', 'R006', 'V005', 'S026'),   -- Warriors vs Celtics, Ken Mauer

-- 2023 Finals (Nuggets vs Heat)
('G025', '2023-06-01', 'T017', 'T009', 'R007', 'V008', 'S027'),   -- Nuggets vs Heat, Monty McCutchen
('G026', '2023-06-09', 'T009', 'T017', 'R008', 'V006', 'S027'),   -- Heat vs Nuggets, Bill Kennedy
('G027', '2023-06-12', 'T017', 'T009', 'R009', 'V008', 'S027'),   -- Nuggets vs Heat, James Capers

-- 1997 Playoffs (Bulls dynasty)
('G028', '1997-05-25', 'T005', 'T013', 'R001', 'V002', 'S001'),   -- Bulls vs 76ers, Joey Crawford
('G029', '1997-06-11', 'T005', 'T021', 'R002', 'V002', 'S001'),   -- Bulls vs Lakers, Dick Bavetta

-- 2003-04 Season (rookie battles)
('G030', '2004-01-20', 'T024', 'T009', 'R003', 'V008', 'S008'),   -- Nuggets vs Heat, Steve Javie
('G031', '2004-03-05', 'T006', 'T024', 'R004', 'V008', 'S008'),   -- Cavaliers vs Nuggets, Scott Foster

-- 2007-08 Season (Durant rookie year)
('G032', '2008-02-10', 'T031', 'T002', 'R005', 'V011', 'S012'),   -- Sonics vs Celtics, Tony Brothers
('G033', '2008-04-01', 'T018', 'T031', 'R006', 'V005', 'S012'),   -- Warriors vs Sonics, Ken Mauer

-- 2009-10 Season (Curry rookie year)
('G034', '2010-02-15', 'T018', 'T025', 'R007', 'V005', 'S014'),   -- Warriors vs Thunder, Monty McCutchen
('G035', '2010-04-10', 'T025', 'T018', 'R008', 'V007', 'S014'),   -- Thunder vs Warriors, Bill Kennedy

-- 2011-12 Season (lockout year)
('G036', '2012-01-20', 'T029', 'T006', 'R009', 'V008', 'S016'),   -- Spurs vs Cavaliers, James Capers
('G037', '2012-02-05', 'T018', 'T029', 'R010', 'V005', 'S016'),   -- Warriors vs Spurs, Marc Davis

-- 2014-15 Season (rookie Embiid/Wiggins/Jokic)
('G038', '2015-01-10', 'T017', 'T013', 'R001', 'V008', 'S019'),   -- Nuggets vs 76ers, Joey Crawford
('G039', '2015-03-25', 'T023', 'T017', 'R002', 'V008', 'S019'),   -- Timberwolves vs Nuggets, Dick Bavetta

-- 2015-16 Season (Warriors 73 wins)
('G040', '2016-03-16', 'T018', 'T002', 'R003', 'V005', 'S020'),   -- Warriors vs Celtics, Steve Javie
('G041', '2016-04-10', 'T018', 'T006', 'R004', 'V005', 'S020'),   -- Warriors vs Cavaliers, Scott Foster

-- 2016-17 Season (Durant joins Warriors)
('G042', '2017-01-15', 'T018', 'T021', 'R005', 'V005', 'S021'),   -- Warriors vs Lakers, Tony Brothers
('G043', '2017-03-01', 'T006', 'T018', 'R006', 'V008', 'S021'),   -- Cavaliers vs Warriors, Ken Mauer

-- 2018-19 Season (Raptors title run)
('G044', '2019-02-05', 'T014', 'T002', 'R007', 'V003', 'S023'),   -- Raptors vs Celtics, Monty McCutchen
('G045', '2019-04-10', 'T014', 'T018', 'R008', 'V003', 'S023'),   -- Raptors vs Warriors, Bill Kennedy

-- 2019-20 Bubble Season
('G046', '2020-08-01', 'T021', 'T009', 'R009', 'V006', 'S024'),   -- Lakers vs Heat, James Capers
('G047', '2020-09-20', 'T009', 'T021', 'R010', 'V006', 'S024'),   -- Heat vs Lakers, Marc Davis

-- 2022 Finals (Warriors vs Celtics)
('G048', '2022-06-05', 'T002', 'T018', 'R001', 'V003', 'S026'),   -- Celtics vs Warriors, Joey Crawford
('G049', '2022-06-10', 'T018', 'T002', 'R002', 'V005', 'S026'),   -- Warriors vs Celtics, Dick Bavetta

-- 2023 Finals (Nuggets vs Heat)
('G050', '2023-06-07', 'T009', 'T017', 'R003', 'V006', 'S027');   -- Heat vs Nuggets, Steve Javie


INSERT INTO Game_has_team (game_id, id_team)
VALUES
-- 1996-97 Season
('G001', 'T021'), ('G001', 'T002'),   -- Lakers vs Celtics
('G002', 'T013'), ('G002', 'T005'),   -- 76ers vs Bulls
('G003', 'T005'), ('G003', 'T021'),   -- Bulls vs Lakers

-- 2003-04 Season
('G004', 'T006'), ('G004', 'T009'),   -- Cavaliers vs Heat
('G005', 'T024'), ('G005', 'T002'),   -- Nuggets vs Celtics
('G006', 'T009'), ('G006', 'T005'),   -- Heat vs Bulls

-- 2007-08 Season
('G007', 'T031'), ('G007', 'T018'),   -- Sonics vs Warriors
('G008', 'T001'), ('G008', 'T031'),   -- Hawks vs Sonics
('G009', 'T022'), ('G009', 'T005'),   -- Grizzlies vs Bulls

-- 2009-10 Season
('G010', 'T018'), ('G010', 'T027'),   -- Warriors vs Blazers
('G011', 'T025'), ('G011', 'T018'),   -- Thunder vs Warriors
('G012', 'T005'), ('G012', 'T018'),   -- Bulls vs Warriors

-- 2011-12 Season
('G013', 'T006'), ('G013', 'T005'),   -- Cavaliers vs Bulls
('G014', 'T029'), ('G014', 'T018'),   -- Spurs vs Warriors
('G015', 'T018'), ('G015', 'T013'),   -- Warriors vs 76ers

-- 2014-15 Season
('G016', 'T013'), ('G016', 'T002'),   -- 76ers vs Celtics
('G017', 'T023'), ('G017', 'T017'),   -- Timberwolves vs Nuggets
('G018', 'T017'), ('G018', 'T005'),   -- Nuggets vs Bulls

-- 2019-20 Season
('G019', 'T021'), ('G019', 'T018'),   -- Lakers vs Warriors
('G020', 'T009'), ('G020', 'T017'),   -- Heat vs Nuggets
('G021', 'T021'), ('G021', 'T009'),   -- Lakers vs Heat

-- 2022 Finals
('G022', 'T018'), ('G022', 'T002'),   -- Warriors vs Celtics
('G023', 'T002'), ('G023', 'T018'),   -- Celtics vs Warriors
('G024', 'T018'), ('G024', 'T002'),   -- Warriors vs Celtics

-- 2023 Finals
('G025', 'T017'), ('G025', 'T009'),   -- Nuggets vs Heat
('G026', 'T009'), ('G026', 'T017'),   -- Heat vs Nuggets
('G027', 'T017'), ('G027', 'T009'),   -- Nuggets vs Heat

-- G028–G050 block
('G028', 'T005'), ('G028', 'T013'),   -- Bulls vs 76ers
('G029', 'T005'), ('G029', 'T021'),   -- Bulls vs Lakers
('G030', 'T024'), ('G030', 'T009'),   -- Nuggets vs Heat
('G031', 'T006'), ('G031', 'T024'),   -- Cavaliers vs Nuggets
('G032', 'T031'), ('G032', 'T002'),   -- Sonics vs Celtics
('G033', 'T018'), ('G033', 'T031'),   -- Warriors vs Sonics
('G034', 'T018'), ('G034', 'T025'),   -- Warriors vs Thunder
('G035', 'T025'), ('G035', 'T018'),   -- Thunder vs Warriors
('G036', 'T029'), ('G036', 'T006'),   -- Spurs vs Cavaliers
('G037', 'T018'), ('G037', 'T029'),   -- Warriors vs Spurs
('G038', 'T017'), ('G038', 'T013'),   -- Nuggets vs 76ers
('G039', 'T023'), ('G039', 'T017'),   -- Timberwolves vs Nuggets
('G040', 'T018'), ('G040', 'T002'),   -- Warriors vs Celtics
('G041', 'T018'), ('G041', 'T006'),   -- Warriors vs Cavaliers
('G042', 'T018'), ('G042', 'T021'),   -- Warriors vs Lakers
('G043', 'T006'), ('G043', 'T018'),   -- Cavaliers vs Warriors
('G044', 'T014'), ('G044', 'T002'),   -- Raptors vs Celtics
('G045', 'T014'), ('G045', 'T018'),   -- Raptors vs Warriors
('G046', 'T021'), ('G046', 'T009'),   -- Lakers vs Heat
('G047', 'T009'), ('G047', 'T021'),   -- Heat vs Lakers
('G048', 'T002'), ('G048', 'T018'),   -- Celtics vs Warriors
('G049', 'T018'), ('G049', 'T002'),   -- Warriors vs Celtics
('G050', 'T009'), ('G050', 'T017');   -- Heat vs Nuggets


INSERT INTO Coach (id_coach, first_name, last_name, hire_date, experience, Coach_id_coach)
VALUES
('C001', 'Phil', 'Jackson', '1989-07-01', 20, 'C001'),   -- Bulls, Lakers (self-ref root)
('C002', 'Gregg', 'Popovich', '1996-12-10', 29, 'C002'), -- Spurs
('C003', 'Pat', 'Riley', '1995-09-01', 30, 'C003'),      -- Heat
('C004', 'Doc', 'Rivers', '1999-06-01', 25, 'C004'),     -- Magic, Celtics, Clippers
('C005', 'Steve', 'Kerr', '2014-05-14', 11, 'C005'),     -- Warriors
('C006', 'Erik', 'Spoelstra', '2008-04-28', 17, 'C006'), -- Heat
('C007', 'Tyronn', 'Lue', '2016-01-22', 9, 'C007'),      -- Cavaliers, Clippers
('C008', 'Nick', 'Nurse', '2018-06-14', 7, 'C008'),      -- Raptors
('C009', 'Michael', 'Malone', '2015-06-15', 10, 'C009'), -- Nuggets
('C010', 'Larry', 'Brown', '1983-07-01', 30, 'C010'),     -- 76ers, Pistons
('C011', 'George', 'Karl', '1984-11-01', 35, 'C011'),     -- Nuggets, Bucks, Sonics
('C012', 'Rick', 'Carlisle', '2001-06-01', 24, 'C012'),   -- Pistons, Mavericks
('C013', 'Mike', 'D\'Antoni', '1997-07-01', 25, 'C013'),  -- Suns, Rockets
('C014', 'Tom', 'Thibodeau', '2010-06-01', 15, 'C014'),   -- Bulls, Knicks
('C015', 'Frank', 'Vogel', '2011-05-01', 14, 'C015'),     -- Pacers, Lakers
('C016', 'Jason', 'Kidd', '2014-07-01', 11, 'C016'),      -- Nets, Bucks, Mavericks
('C017', 'Monty', 'Williams', '2010-06-01', 14, 'C017'),  -- Hornets, Suns
('C018', 'Mark', 'Jackson', '2011-06-01', 3, 'C018'),     -- Warriors
('C019', 'Billy', 'Donovan', '2015-06-01', 10, 'C019');   -- Thunder, Bulls



INSERT INTO Coach_has_team (id_coach, id_team)
VALUES
('C001', 'T005'),   -- Phil Jackson → Bulls
('C001', 'T021'),   -- Phil Jackson → Lakers
('C002', 'T029'),   -- Popovich → Spurs
('C003', 'T009'),   -- Pat Riley → Heat
('C004', 'T012'),   -- Doc Rivers → Magic
('C004', 'T002'),   -- Doc Rivers → Celtics
('C005', 'T018'),   -- Steve Kerr → Warriors
('C006', 'T009'),   -- Spoelstra → Heat
('C007', 'T006'),   -- Ty Lue → Cavaliers
('C008', 'T014'),   -- Nick Nurse → Raptors
('C009', 'T017'),   -- Michael Malone → Nuggets
('C010', 'T013'),   -- Larry Brown → 76ers
('C010', 'T005'),   -- Larry Brown → Pistons
('C011', 'T017'),   -- George Karl → Nuggets
('C011', 'T010'),   -- George Karl → Bucks
('C011', 'T031'),   -- George Karl → Sonics
('C012', 'T007'),   -- Rick Carlisle → Pistons
('C012', 'T016'),   -- Rick Carlisle → Mavericks
('C013', 'T026'),   -- Mike D'Antoni → Suns
('C013', 'T019'),   -- Mike D'Antoni → Rockets
('C014', 'T005'),   -- Tom Thibodeau → Bulls
('C014', 'T002'),   -- Tom Thibodeau → Knicks
('C015', 'T008'),   -- Frank Vogel → Pacers
('C015', 'T021'),   -- Frank Vogel → Lakers
('C016', 'T003'),   -- Jason Kidd → Nets
('C016', 'T010'),   -- Jason Kidd → Bucks
('C016', 'T016'),   -- Jason Kidd → Mavericks
('C017', 'T004'),   -- Monty Williams → Hornets
('C017', 'T026'),   -- Monty Williams → Suns
('C018', 'T018'),   -- Mark Jackson → Warriors
('C019', 'T025'),   -- Billy Donovan → Thunder
('C019', 'T005');   -- Billy Donovan → Bulls

INSERT INTO player_has_Game (player_id, game_id)
VALUES
-- 1996-97 Season (rookie debuts)
('P048', 'G001'),   -- Kobe Bryant → Lakers vs Celtics
('P049', 'G001'),   -- Allen Iverson → Lakers vs Celtics
('P051', 'G002'),   -- Ray Allen → 76ers vs Bulls
('P048', 'G003'),   -- Kobe Bryant → Bulls vs Lakers
('P049', 'G003'),   -- Allen Iverson → Bulls vs Lakers

-- 2003-04 Season (LeBron, Melo, Wade)
('P001', 'G004'),   -- LeBron James → Cavaliers vs Heat
('P003', 'G004'),   -- Dwyane Wade → Cavaliers vs Heat
('P002', 'G005'),   -- Carmelo Anthony → Nuggets vs Celtics
('P004', 'G006'),   -- Chris Bosh → Heat vs Bulls
('P001', 'G006'),   -- LeBron James → Heat vs Bulls

-- 2007-08 Season (Durant rookie)
('P005', 'G007'),   -- Kevin Durant → Sonics vs Warriors
('P006', 'G008'),   -- Al Horford → Hawks vs Sonics
('P007', 'G009'),   -- Mike Conley → Grizzlies vs Bulls
('P005', 'G008'),   -- Kevin Durant → Hawks vs Sonics
('P005', 'G009'),   -- Kevin Durant → Grizzlies vs Bulls

-- 2009-10 Season (Curry rookie)
('P008', 'G010'),   -- Stephen Curry → Warriors vs Blazers
('P009', 'G010'),   -- James Harden → Warriors vs Blazers
('P008', 'G011'),   -- Stephen Curry → Thunder vs Warriors
('P009', 'G011'),   -- James Harden → Thunder vs Warriors
('P008', 'G012'),   -- Stephen Curry → Bulls vs Warriors

-- 2011-12 Season (Kyrie rookie)
('P011', 'G013'),   -- Kyrie Irving → Cavaliers vs Bulls
('P014', 'G013'),   -- Jimmy Butler → Cavaliers vs Bulls
('P012', 'G014'),   -- Kawhi Leonard → Spurs vs Warriors
('P013', 'G015'),   -- Klay Thompson → Warriors vs 76ers
('P011', 'G015'),   -- Kyrie Irving → Warriors vs 76ers

-- 2014-15 Season (Embiid, Wiggins, Jokic rookies)
('P018', 'G016'),   -- Joel Embiid → 76ers vs Celtics
('P019', 'G017'),   -- Andrew Wiggins → Timberwolves vs Nuggets
('P020', 'G018'),   -- Nikola Jokic → Nuggets vs Bulls
('P018', 'G017'),   -- Joel Embiid → Timberwolves vs Nuggets
('P019', 'G018');   -- Andrew Wiggins → Nuggets vs Bulls





