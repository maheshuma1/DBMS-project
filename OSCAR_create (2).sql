-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2021-12-16 13:29:04.134

-- tables
-- Table: Actor
-- drop table Actor;
-- drop table Film;
-- drop table Film_cast;
-- drop table Films_nominated;
-- drop table Oscar_held;
CREATE TABLE Actor (
    Actor_ID int NOT NULL,
    Actor_fname varchar(15) NOT NULL,
    Actor_lname varchar(10) NOT NULL,
    Actor_age int NOT NULL,
    Actor_Gender varchar(5) NOT NULL,
    CONSTRAINT Actor_pk PRIMARY KEY (Actor_ID)
);

-- Table: Film
CREATE TABLE Film (
    Film_ID int NOT NULL,
    Film_name varchar(40) NOT NULL,
    Release_year int NOT NULL,
    CONSTRAINT Film_pk PRIMARY KEY (Film_ID)
);

-- Table: Film_cast
CREATE TABLE Film_cast (
    Filmcast_ID int NOT NULL,
    Actor_ID int NOT NULL,
    Film_ID int NOT NULL,
    CONSTRAINT Film_cast_pk PRIMARY KEY (Filmcast_ID)
);

-- Table: Films_nominated
CREATE TABLE Films_nominated (
    nom_id int NOT NULL,
    Oh_year int NOT NULL,
    Film_ID int NOT NULL,
    CONSTRAINT Films_nominated_pk PRIMARY KEY (nom_id)
);

-- Table: Oscar_held
CREATE TABLE Oscar_held (
    Oh_year int NOT NULL,
    Awards_given int NOT NULL,
    People_attended int NOT NULL,
    Oh_location varchar(20) NOT NULL,
    CONSTRAINT Oscar_held_pk PRIMARY KEY (Oh_year)
);

-- foreign keys
-- Reference: Film_cast_Actor (table: Film_cast)
ALTER TABLE Film_cast ADD CONSTRAINT Film_cast_Actor FOREIGN KEY Film_cast_Actor (Actor_ID)
    REFERENCES Actor (Actor_ID);

-- Reference: Film_cast_Film (table: Film_cast)
ALTER TABLE Film_cast ADD CONSTRAINT Film_cast_Film FOREIGN KEY Film_cast_Film (Film_ID)
    REFERENCES Film (Film_ID);

-- Reference: Films_nominated_Film (table: Films_nominated)
ALTER TABLE Films_nominated ADD CONSTRAINT Films_nominated_Film FOREIGN KEY Films_nominated_Film (Film_ID)
    REFERENCES Film (Film_ID);

-- Reference: Films_nominated_Oscar_held (table: Films_nominated)
ALTER TABLE Films_nominated ADD CONSTRAINT Films_nominated_Oscar_held FOREIGN KEY Films_nominated_Oscar_held (Oh_year)
    REFERENCES Oscar_held (Oh_year);

-- End of file.

