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
  ville varchar(50),
  date_entree DATE,
  date_sortie DATE,  
  num_personnes int(10),
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
  (4, 1, `Alemagne`),
  (5, 2, `Chine`),
  (6, 2, `India`),
  (7, 2, `Japon`),
  (8, 3, `Yibuti`),
  (9, 3, `Marroc`),
  (10, 3, `Senegal`),
  (11, 4, `EEUU`),
  (12, 4, `Mexique`),
  (13, 4, `Peru`);

INSERT INTO voyages.voyage (id_voyage, id_continent, id_pays, ville, date_entree, date_sortie, num_personnes) VALUES
	(1, 1, 1, `Paris`, `2022-10-04`, `2022-10-04` ),
  (2, 1, 2, `Sevilla`, `2022-11-23`, `2022-11-30`),
  (3, 1, 3, `Lisboa`, `2022-10-04`, `2022-10-04`),
  (4, 1, 4, `Berlin`, `2022-11-23`, `2022-11-30`),
  (5, 2, 5, `Pekin`, `2022-11-23`, `2022-11-30`),
  (6, 2, 6, `ville1`, `2022-10-04`, `2022-10-04`),
  (7, 2, 7, `ville2`, `2022-11-23`, `2022-11-30`),
  (8, 3, 8, `ville3`, `2022-10-04`, `2022-10-04`),
  (9, 3, 9, `ville4`, `2022-11-23`, `2022-11-30`),
  (10, 3, 10, `ville5`, `2022-10-04`, `2022-10-04`),
  (11, 4, 11, `ville6`, `2022-11-23`, `2022-11-30`),
  (12, 4, 12, `ville7`, `2022-10-04`, `2022-10-04`),
  (13, 4, 13, `ville8`, `2022-11-23`, `2022-11-30`),
  (14, 1, 1, `ville9`, `2022-10-04`, `2022-10-04`),
  (15, 1, 2, `ville10`, `2022-11-23`, `2022-11-30`),
  (16, 1, 3, `ville11`, `2022-10-04`, `2022-10-04`),
  (17, 1, 4, `ville12`, `2022-11-23`, `2022-11-30`),
  (18, 2, 5, `ville13`, `2022-10-04`, `2022-10-04`),
  (19, 2, 6, `ville14`, `2022-11-23`, `2022-11-30`),
  (20, 2, 7, `ville15`, `2022-10-04`, `2022-10-04`),
  (21, 3, 8, `ville16`, `2022-11-23`, `2022-11-30`),
  (22, 3, 9, `ville17`, `2022-10-04`, `2022-10-04`),
  (23, 3, 10, `ville18`, `2022-11-23`, `2022-11-30`),
  (24, 4, 11, `ville19`, `2022-10-04`, `2022-10-04`),
  (25, 4, 12, `ville20`, `2022-11-23`, `2022-11-30`),
  (26, 4, 13, `ville21`, `2022-10-04`, `2022-10-04`);