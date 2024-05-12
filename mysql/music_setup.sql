DROP DATABASE IF EXISTS music_db_development;
CREATE DATABASE IF NOT EXISTS music_db_development;
USE music_db_development;

-- -----------------------------------------------------
-- Album Table
-- -----------------------------------------------------
DROP TABLE IF EXISTS albums;

CREATE TABLE IF NOT EXISTS albums (
  id INT PRIMARY KEY,
  title VARCHAR(250) NOT NULL,
  release_date DATE NOT NULL,
  cover BLOB
);


-- -----------------------------------------------------
-- Song Table
-- -----------------------------------------------------
DROP TABLE IF EXISTS songs;

CREATE TABLE IF NOT EXISTS songs (
  id INT PRIMARY KEY,
  length TIME NOT NULL,
  title VARCHAR(1000) NOT NULL
);


-- -----------------------------------------------------
-- Artist Table
-- -----------------------------------------------------
DROP TABLE IF EXISTS artists;

CREATE TABLE IF NOT EXISTS artists (
  id INT PRIMARY KEY,
  name VARCHAR(100) NOT NULL
);


-- -----------------------------------------------------
-- User Table
-- -----------------------------------------------------
DROP TABLE IF EXISTS users;

CREATE TABLE IF NOT EXISTS users (
  id INT PRIMARY KEY,
  username VARCHAR(50) NOT NULL UNIQUE,
  password_digest VARCHAR(100) NOT NULL);


-- -----------------------------------------------------
-- Album Review Table
-- -----------------------------------------------------
DROP TABLE IF EXISTS album_reviews;

CREATE TABLE IF NOT EXISTS album_reviews (
  id INT PRIMARY KEY,
  rating TINYINT,
  review VARCHAR(1000),
  album_id INT NOT NULL,
  user_id INT NOT NULL,
  date_created DATE NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users (id),
  FOREIGN KEY (album_id) REFERENCES albums (id)
);


-- -----------------------------------------------------
-- Tracklist Table
-- -----------------------------------------------------
DROP TABLE IF EXISTS tracklists;

CREATE TABLE IF NOT EXISTS tracklists(
  id INT NOT NULL,
  sequence_no INT NOT NULL,
  album_id INT NOT NULL,
  song_id INT NOT NULL,
  PRIMARY KEY (id), -- , sequence_no),-- , album_id), -- Necessary for composite PKs
  FOREIGN KEY (album_id) REFERENCES albums (id),
  FOREIGN KEY (song_id) REFERENCES songs (id)
);


-- -----------------------------------------------------
-- Album by Artist Table
-- -----------------------------------------------------
DROP TABLE IF EXISTS album_by_artists;

CREATE TABLE IF NOT EXISTS album_by_artists (
  id INT PRIMARY KEY,
  artist_id INT NOT NULL,
  album_id INT NOT NULL,
  FOREIGN KEY (album_id) REFERENCES albums (id),
  FOREIGN KEY (artist_id) REFERENCES artists (id)
);


-- -----------------------------------------------------
-- Song by Artist Table
-- -----------------------------------------------------
DROP TABLE IF EXISTS song_by_artists;

CREATE TABLE IF NOT EXISTS song_by_artists (
  id INT PRIMARY KEY,
  artist_id INT NOT NULL,
  song_id INT NOT NULL,
  FOREIGN KEY (song_id) REFERENCES songs (id),
  FOREIGN KEY (artist_id) REFERENCES artists (id)
);


-- -----------------------------------------------------
-- Genre Table
-- -----------------------------------------------------
DROP TABLE IF EXISTS genres;

CREATE TABLE IF NOT EXISTS genres (
  id INT PRIMARY KEY,
  genre_name VARCHAR(50) NOT NULL
);


-- -----------------------------------------------------
-- Classification Table
-- -----------------------------------------------------
DROP TABLE IF EXISTS classifications;

CREATE TABLE IF NOT EXISTS classifications (
  id INT PRIMARY KEY,
  song_id INT NOT NULL,
  album_id INT NOT NULL,
  genre_id INT NOT NULL,
  FOREIGN KEY (genre_id) REFERENCES genres (id),
  FOREIGN KEY (album_id) REFERENCES albums (id),
  FOREIGN KEY (song_id) REFERENCES songs (id)
);


-- -----------------------------------------------------
-- Song Review Table
-- -----------------------------------------------------
DROP TABLE IF EXISTS song_reviews;

CREATE TABLE IF NOT EXISTS song_reviews (
  id INT PRIMARY KEY,
  review VARCHAR(1000),
  rating TINYINT,
  song_id INT NOT NULL,
  user_id INT NOT NULL,
  date_created DATE NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users (id),
  FOREIGN KEY (song_id) REFERENCES songs (id)
);


-- -----------------------------------------------------
-- Follows Table
-- -----------------------------------------------------
DROP TABLE IF EXISTS follows;

CREATE TABLE IF NOT EXISTS follows (
  id INT PRIMARY KEY,
  follower_id INT NOT NULL,
  following_id INT NOT NULL,
  FOREIGN KEY (follower_id) REFERENCES users (id),
  FOREIGN KEY (following_id) REFERENCES users (id)
);

