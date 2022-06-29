-- create author table
CREATE TABLE author (
  id INT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255) NOT NULL  
);

-- create games table
CREATE TABLE game (
  id INT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  publish_date DATE NOT NULL,
  archived BOOLEAN NOT NULL,
  multiplayer BOOLEAN NOT NULL,  
  last_played_at DATE NOT NULL 
);
