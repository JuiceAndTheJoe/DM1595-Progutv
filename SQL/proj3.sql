CREATE TABLE Scores (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    username TEXT,
    score INTEGER,
    level INTEGER,
    played_at TEXT
);

INSERT INTO Scores (username, score, level, played_at)
VALUES ("Player1", 1500, 3, "2025-09-19");

INSERT INTO Scores (username, score, level, played_at)
VALUES ("Player2", 3000, 5, "2025-09-19");

INSERT INTO Scores (username, score, level, played_at)
VALUES ("Player3", 500, 1, "2025-09-18");

/* PLayer1 got a better score and higher level */
UPDATE Scores
SET score = 2200,
    level = 4
WHERE username = "Player1";

/* Player3 wants to delete his score */
DELETE FROM Scores
WHERE username = "Player3";