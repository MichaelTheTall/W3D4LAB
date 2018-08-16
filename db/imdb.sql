DROP TABLE castings;
DROP TABLE movies;
DROP TABLE stars;

CREATE TABLE movies
(
  id SERIAL8 PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  genre VARCHAR(255),
  budget INT8
);

CREATE TABLE stars
(
  id SERIAL8 PRIMARY KEY,
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255) NOT NULL
);

CREATE TABLE castings
(
  id SERIAL8 PRIMARY KEY,
  star_id INT8 REFERENCES stars(id),
  movie_id INT8 REFERENCES movies(id),
  fee INT8 NOT NULL
);
