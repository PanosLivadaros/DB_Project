-- Trigger function --
CREATE OR REPLACE FUNCTION demote_teams_trigger()
RETURNS TRIGGER AS $$
BEGIN
-- Check if Demoted_Teams table exists and, if not, create it --
CREATE TABLE IF NOT EXISTS Demoted_Teams (
  team_id SERIAL PRIMARY KEY,
  team_name VARCHAR(30) NOT NULL,
  home_ground VARCHAR(30),
  history_description TEXT,
  home_wins INTEGER DEFAULT 0,
  away_wins INTEGER DEFAULT 0,
  home_losses INTEGER DEFAULT 0,
  away_losses INTEGER DEFAULT 0,
  home_draws INTEGER DEFAULT 0,
  away_draws INTEGER DEFAULT 0
);
-- Check if a team has been demoted and, if so, insert it into Demoted_Teams --
IF (OLD.demoted = false) AND (NEW.demoted = true) THEN
INSERT INTO Demoted_Teams (team_name, home_ground, history_description, home_wins, away_wins, home_losses, away_losses, home_draws, away_draws)
VALUES (OLD.team_name, OLD.home_ground, OLD.history_description, OLD.home_wins, OLD.away_wins, OLD.home_losses, OLD.away_losses, OLD.home_draws, OLD.away_draws);
END IF;
RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Trigger --
CREATE OR REPLACE TRIGGER demote_teams_trigger
AFTER UPDATE ON Teams
FOR EACH ROW
EXECUTE FUNCTION demote_teams_trigger();

-- Test query for trigger demote_team_trigger --
UPDATE Teams SET demoted = TRUE WHERE team_id = 1;