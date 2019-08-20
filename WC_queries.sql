-- Join wc_players and wc_matches
SELECT p."MatchID", m."Year", m."Date", m."Stage", m."Attendance", p."Player_MatchID", p."Player_Name", p."Goals", p."Own_Goals", 
m."Referee", p."Yellow_Card", p."Red_Card", p."Second_Yellow_Card", p."Penalty", p."Missed_Penalty", m."Win_Conditions"
FROM wc_players AS p
INNER JOIN wc_matches AS m ON p."MatchID"=m."MatchID";

-- Average attendance by team, ordered by number of matches
SELECT p."Team_Initials", COUNT(m."MatchID") AS "Number of Matches",
	ROUND(SUM(CAST(m."Attendance" AS DECIMAL))/COUNT(m."MatchID"),3) AS "Average Attendance per Match"
FROM wc_players AS p
INNER JOIN wc_matches AS m ON p."MatchID"=m."MatchID"
GROUP BY p."Team_Initials"
ORDER BY "Number of Matches" DESC;

-- Average attendance by team, ordered by attendance 
SELECT p."Team_Initials", COUNT(m."MatchID") AS "Number of Matches",
	ROUND(SUM(CAST(m."Attendance" AS DECIMAL))/COUNT(m."MatchID"),3) AS "Average Attendance per Match"
FROM wc_players AS p
INNER JOIN wc_matches AS m ON p."MatchID"=m."MatchID"
GROUP BY p."Team_Initials"
ORDER BY "Average Attendance per Match" DESC;

-- Average attendance by player, ordered by number of matches 
SELECT p."Player_Name", COUNT(m."MatchID") AS "Number of Matches",
	ROUND(SUM(CAST(m."Attendance" AS DECIMAL))/COUNT(m."MatchID"),3) AS "Average Attendance per Match"
FROM wc_players AS p
INNER JOIN wc_matches AS m ON p."MatchID"=m."MatchID"
GROUP BY p."Player_Name"
ORDER BY "Number of Matches" DESC;

-- Average attendance by player, ordered by attendance
SELECT p."Player_Name", COUNT(m."MatchID") AS "Number of Matches",
	ROUND(SUM(CAST(m."Attendance" AS DECIMAL))/COUNT(m."MatchID"),3) AS "Average Attendance per Match"
FROM wc_players AS p
INNER JOIN wc_matches AS m ON p."MatchID"=m."MatchID"
GROUP BY p."Player_Name"
ORDER BY "Average Attendance per Match" DESC;

-- Referees, number of matches, count of Yellows, Reds, and Penalties, and Rate of each call on a per match basis
SELECT m."Referee", COUNT(m."MatchID") AS "Matches", 
	SUM(p."Yellow_Card") AS "Yellow Cards", 
	ROUND(SUM(CAST(p."Yellow_Card" AS DECIMAL))/COUNT(m."MatchID"),3) AS "Yellows per Match",
	SUM(p."Red_Card") AS "Red Cards", 
	ROUND(SUM(CAST(p."Red_Card" AS DECIMAL))/COUNT(m."MatchID"),3) AS "Reds per Match", 
	(SUM(p."Penalty")+SUM(p."Missed_Penalty")) AS "Penalties", 
	ROUND((SUM(CAST(p."Penalty" AS DECIMAL))+SUM(CAST(p."Missed_Penalty" AS DECIMAL)))/COUNT(m."MatchID"),3) AS "Penalties per Match" 
FROM wc_players AS p
INNER JOIN wc_matches AS m ON p."MatchID"=m."MatchID"
GROUP BY m."Referee"
ORDER BY "Yellows per Match" DESC;
