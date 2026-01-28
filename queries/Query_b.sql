SELECT goals_scored, penalties, match_date, first_name, last_name
FROM PlayerStats
NATURAL JOIN (SELECT * FROM Matches WHERE match_id = <match_id>) AS subquery
NATURAL JOIN Players;