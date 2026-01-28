SELECT SUM(goals_scored) AS season_goals, SUM(penalties) season_penalties, SUM(cards_received) AS season_cards, SUM(minutes_played) AS season_playtime, MAX(player_position) AS season_position
FROM (SELECT * FROM PlayerStats WHERE player_id = <playerId>) AS selected_1_query_c
NATURAL JOIN (SELECT match_id FROM Matches WHERE match_date >= <season_start_placeholder> AND match_date < <season_end_placeholder>) AS selected_2_query_c
NATURAL JOIN (SELECT * FROM Players WHERE player_id = <playerId>) AS selected_3_query_c;