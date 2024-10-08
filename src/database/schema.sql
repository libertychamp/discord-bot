/* This entry is populated for every user who signs up for the leaderboard */
CREATE TABLE IF NOT EXISTS leaderboard_entry (
    discord_id TEXT PRIMARY KEY NOT NULL,
    kattis_username TEXT NOT NULL,
    original_points REAL NOT NULL,
    current_points REAL NOT NULL
);

/* This table is used if we want to make a graph for the user that will show their progress throughout the semester */
CREATE TABLE IF NOT EXISTS score_snapshot (
    score REAL NOT NULL,
    discord_id TEXT NOT NULL,

    /*
    * SQLite does not have a date type, so we will store the date as a string 
    * Date format: YYYY-MM-DD 
    */
    date TEXT NOT NULL,
    FOREIGN KEY(discord_id) REFERENCES leaderboard_entry(discord_id),
    PRIMARY KEY(discord_id, date)
);


/* This table is used to store the score of Liberty on a certain date
* This is used to make a graph that shows the progress of Liberty throughout the semester
*/
CREATE TABLE IF NOT EXISTS liberty_score_snapshot (
    score REAL NOT NULL,
    rank INTEGER NOT NULL,
    date TEXT PRIMARY KEY NOT NULL
);