CREATE TABLE IF NOT EXISTS member (
    id           INTEGER NOT NULL PRIMARY KEY,
    name         VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS user (
    user_id           CHAR(100) PRIMARY KEY,
    screen_name       TEXT,
    session           CHAR(100)
);

CREATE TABLE IF NOT EXISTS entry (
    entry_id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    body varchar(255) not null
);
