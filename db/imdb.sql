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

-- INSERT INTO stars (first_name, last_name) VALUES ('Doot', 'Dootman');
-- INSERT INTO stars (first_name, last_name) VALUES ('Bob', 'Boberton');
-- INSERT INTO stars (first_name, last_name) VALUES ('Jennifer', 'Jennings');
--
-- INSERT INTO movies (title, genre, budget) VALUES ('Dootmaster', 'Doot Fiction', 50000000);
-- INSERT INTO movies (title, genre, budget) VALUES ('Dootmaster 2: Electric Dootaloo', 'Doot Fiction', 200000000);
-- INSERT INTO movies (title, genre, budget) VALUES ('Dead Bob', 'Thriller', 100000);
-- INSERT INTO movies (title, genre, budget) VALUES ('Space IN SPACE', 'Sci-fi', 5000000);

-- INSERT INTO castings (movie_id, star_id, fee) VALUES (1, 1, 10000000);
-- INSERT INTO castings (movie_id, star_id, fee) VALUES (2, 1, 150000000);
-- INSERT INTO castings (movie_id, star_id, fee) VALUES (3, 2, 10000);
-- INSERT INTO castings (movie_id, star_id, fee) VALUES (4, 3, 1000000);
