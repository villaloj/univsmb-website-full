CREATE DATABASE IF NOT EXISTS voyages ;

USE voyages;

DROP TABLE IF EXISTS voyages.continents; 
DROP TABLE IF EXISTS voyages.pays; 
DROP TABLE IF EXISTS voyages.voyage; 

CREATE TABLE IF NOT EXISTS voyages.continents (
  id_continent int(11) PRIMARY KEY,
  name varchar(50)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS voyages.pays (
  id_pays int(11) PRIMARY KEY,
  id_continent int(11),
  name varchar(50),
  CONSTRAINT FOREIGN KEY (id_continent) REFERENCES voyages.continent(id_continent)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS voyages.voyage (
  id_voyage int(11) PRIMARY KEY,
  id_continent int(11) DEFAULT,
  id_pays int(11) DEFAULT,
  ville varchar(50)
  FOREIGN KEY (id_continent) REFERENCES voyages.continents(id_continent),
  FOREIGN KEY (id_pays) REFERENCES voyages.pays(id_pays)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO voyages.continents (id_continent, name) VALUES
	(1, `Europe`),
  (2, `Asie`),
  (3, `Afrique`),
  (4, `Amérique`);

INSERT INTO voyages.pays (id_pays, id_continent, name) VALUES
	(1, 1,`France`),
  (2, 1, `Espagne`),
  (3, 1, `Portugal`),
  (4, 1, `Allemagne`),
  (5, 2, `Chine`),
  (6, 2, `India`),
  (7, 2, `Japon`),
  (9, 3, `Marroc`),
  (10, 3, `Senegal`),
  (12, 4, `Mexique`),
  (13, 4, `Peru`);

INSERT INTO voyages.voyage (id_voyage, id_continent, id_pays, ville) VALUES
	(1, 1, 1, `Paris`),
  (2, 1, 2, `Sevilla`),
  (3, 1, 3, `Lisboa`),
  (4, 1, 4, `Berlin`),
  (5, 2, 5, `Pekin`),
  (6, 2, 6, `ville1`),
  (7, 2, 7, `ville2`),
  (8, 3, 8, `ville3`),
  (9, 3, 9, `ville4`),
  (10, 3, 10, `ville5`),
  (11, 4, 11, `ville6`),
  (12, 4, 12, `ville7`),
  (13, 4, 13, `ville8`),
  (14, 1, 1, `ville9`),
  (15, 1, 2, `ville10`),
  (16, 1, 3, `ville11`),
  (17, 1, 4, `ville12`),
  (18, 2, 5, `ville13`),
  (19, 2, 6, `ville14`),
  (20, 2, 7, `ville15`),
  (21, 3, 8, `ville16`),
  (22, 3, 9, `ville17`),
  (23, 3, 10, `ville18`),
  (24, 4, 11, `ville19`),
  (25, 4, 12, `ville20`),
  (26, 4, 13, `ville21`);