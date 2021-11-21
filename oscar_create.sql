-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2021-11-19 18:52:27.577

-- tables
-- Table: Actor
CREATE TABLE Actor (
    act_id int NOT NULL,
    act_fname varchar(25) NOT NULL,
    act_lname varchar(25) NOT NULL,
    act_age int NOT NULL,
    CONSTRAINT Actor_pk PRIMARY KEY (act_id)
);

-- Table: Actress
CREATE TABLE Actress (
    Actress_id int NOT NULL,
    actress_fname varchar(25) NOT NULL,
    actress_lname varchar(25) NOT NULL,
    actress_age int NOT NULL,
    CONSTRAINT Actress_pk PRIMARY KEY (Actress_id)
);

-- Table: Award_Winning_movies
CREATE TABLE Award_Winning_movies (
    movie_id int NOT NULL,
    film_name varchar(50) NOT NULL,
    Oscar_held_oh_year int NOT NULL,
    CONSTRAINT Award_Winning_movies_pk PRIMARY KEY (movie_id)
);

-- Table: Films_nominated
CREATE TABLE Films_nominated (
    film_id int NOT NULL,
    premiere_yr int NOT NULL,
    Award_Winning_movies_movie_id int NOT NULL,
    CONSTRAINT Films_nominated_pk PRIMARY KEY (film_id)
);

-- Table: Oscar_held
CREATE TABLE Oscar_held (
    oh_year int NOT NULL,
    awards_given int NOT NULL,
    people_attended int NOT NULL,
    oh_location varchar(30) NOT NULL,
    CONSTRAINT Oscar_held_pk PRIMARY KEY (oh_year)
);

-- Table: film_cast
CREATE TABLE film_cast (
    film_id int NOT NULL,
    Actor_act_id int NOT NULL,
    Actress_Actress_id int NOT NULL,
    Films_nominated_film_id int NOT NULL,
    CONSTRAINT film_cast_pk PRIMARY KEY (film_id)
);

-- foreign keys
-- Reference: Award_Winning_movies_Oscar_held (table: Award_Winning_movies)
ALTER TABLE Award_Winning_movies ADD CONSTRAINT Award_Winning_movies_Oscar_held FOREIGN KEY Award_Winning_movies_Oscar_held (Oscar_held_oh_year)
    REFERENCES Oscar_held (oh_year);

-- Reference: Films_nominated_Award_Winning_movies (table: Films_nominated)
ALTER TABLE Films_nominated ADD CONSTRAINT Films_nominated_Award_Winning_movies FOREIGN KEY Films_nominated_Award_Winning_movies (Award_Winning_movies_movie_id)
    REFERENCES Award_Winning_movies (movie_id);

-- Reference: film_cast_Actor (table: film_cast)
ALTER TABLE film_cast ADD CONSTRAINT film_cast_Actor FOREIGN KEY film_cast_Actor (Actor_act_id)
    REFERENCES Actor (act_id);

-- Reference: film_cast_Actress (table: film_cast)
ALTER TABLE film_cast ADD CONSTRAINT film_cast_Actress FOREIGN KEY film_cast_Actress (Actress_Actress_id)
    REFERENCES Actress (Actress_id);

-- Reference: film_cast_Films_nominated (table: film_cast)
ALTER TABLE film_cast ADD CONSTRAINT film_cast_Films_nominated FOREIGN KEY film_cast_Films_nominated (Films_nominated_film_id)
    REFERENCES Films_nominated (film_id);

-- End of file.

