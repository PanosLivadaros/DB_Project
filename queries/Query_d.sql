SELECT COUNT (match_id) FILTER (WHERE home_team_id = <teamId> OR away_team_id = <teamId>) AS season_matches,
	 COUNT (match_id) FILTER (WHERE home_team_id = <teamId>) AS season_home_matches,
	 COUNT (match_id) FILTER (WHERE away_team_id = <teamId>) AS season_away_matches,
	 COUNT (match_id) FILTER (WHERE (home_team_id = <teamId> AND home_score > away_score) OR (away_team_id = <teamId> AND away_score > home_score)) AS season_wins,
	 COUNT (match_id) FILTER (WHERE (home_team_id = <teamId> AND home_score < away_score) OR (away_team_id = <teamId> AND away_score < home_score)) AS season_losses,
	 COUNT (match_id) FILTER (WHERE home_team_id = <teamId> OR away_team_id = <teamId> AND home_score = away_score) AS season_draws,
	 COUNT (match_id) FILTER (WHERE home_team_id = <teamId> AND home_score > away_score) AS season_home_wins,
	 COUNT (match_id) FILTER (WHERE home_team_id = <teamId> AND home_score < away_score) AS season_home_losses,
	 COUNT (match_id) FILTER (WHERE home_team_id = <teamId> AND home_score = away_score) AS season_home_draws,
	 COUNT (match_id) FILTER (WHERE away_team_id = <teamId> AND away_score > home_score) AS season_away_wins,
	 COUNT (match_id) FILTER (WHERE away_team_id = <teamId> AND away_score < home_score) AS season_away_losses,
	 COUNT (match_id) FILTER (WHERE away_team_id = <teamId> AND away_score = home_score) AS season_away_draws
FROM Matches
WHERE match_date >= <season_start_placeholder> AND match_date < <season_end_placeholder>;