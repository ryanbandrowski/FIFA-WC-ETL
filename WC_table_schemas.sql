DROP TABLE IF EXISTS wc_players;
DROP TABLE IF EXISTS wc_matches;
DROP TABLE IF EXISTS world_cups;
DROP TABLE IF EXISTS unique_players;

CREATE TABLE world_cups (
	index INT,
	"Year" INT,
	"Country" VARCHAR(255),
	"Winner" VARCHAR(255),
	"Second" VARCHAR(255),
	"Third" VARCHAR(255),
	"Fourth" VARCHAR(255),
	"GoalsScored" INT,
	"QualifiedTeams" INT,
	"MatchesPlayed" INT,
	"Attendance" INT,
	data_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY ("Year")
);

CREATE TABLE wc_matches (
	index INT,
	"MatchID" INT,
	"Year" INT,
	"Date" DATE,
	"Time" TIME,
	"Stage" VARCHAR(255),
	"Stadium" VARCHAR(255),
	"City" VARCHAR(255),
	"Home_Team" VARCHAR(255),
	"Home_Team_Goals" INT,
	"Away_Team_Goals" INT,
	"Away_Team" VARCHAR(255),
	"Win_Conditions" VARCHAR(255),
	"Attendance" INT,
	"Referee" VARCHAR(255),
	"Assistant_1" VARCHAR(255),
	"Assistant_2" VARCHAR(255),
	data_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY ("MatchID"),
	FOREIGN KEY ("Year") REFERENCES world_cups("Year")
);

CREATE TABLE wc_players (
	index INT,
	"Player_MatchID" VARCHAR(255),
	"MatchID" INT,
	"Team_Initials" VARCHAR(255),
	"Player_Name" VARCHAR(255),
	"Goals" INT,
	"Own_Goals" INT,
	"Yellow_Card" INT,
	"Red_Card" INT,
	"Second_Yellow_Card" INT,
	"Penalty" INT,
	"Missed_Penalty" INT,
	data_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY ("Player_MatchID"),
	FOREIGN KEY ("MatchID") REFERENCES wc_matches("MatchID")
);

CREATE TABLE unique_players (
	index INT,
	"Player_Name" VARCHAR(255),
	"Goals" INT,
	"Own_Goals" INT,
	"Yellow_Card" INT,
	"Red_Card" INT,
	"Second_Yellow_Card" INT,
	"Penalty" INT,
	"Missed_Penalty" INT,
	data_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY ("Player_Name")
);
