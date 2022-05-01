CREATE DATABASE IF NOT EXISTS voyages ;

USE voyages;

DROP TABLE IF EXISTS voyages.voyage;
DROP TABLE IF EXISTS voyages.pays;
DROP TABLE IF EXISTS voyages.continents;

CREATE TABLE IF NOT EXISTS voyages.continents (
  id_continent int(11) PRIMARY KEY,
  name_continent varchar(50)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS voyages.pays (
  id_pays int(11) PRIMARY KEY,
  id_continent int(11),
  name_pays varchar(50),
  CONSTRAINT FOREIGN KEY (id_continent) REFERENCES voyages.continents(id_continent)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS voyages.voyage (
  id_voyage int(11) PRIMARY KEY,
  id_continent int(11),
  id_pays int(11),
  ville varchar(50),
  FOREIGN KEY (id_continent) REFERENCES voyages.continents(id_continent),
  FOREIGN KEY (id_pays) REFERENCES voyages.pays(id_pays)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO voyages.continents (id_continent, name_continent) VALUES
	(1, 'Europe'),
  (2, 'Asie'),
  (3, 'Afrique'),
  (4, 'Amérique');

INSERT INTO voyages.pays (id_pays, id_continent, name_pays) VALUES
	(1, 1,'France'),
  (2, 1, 'Espagne'),
  (3, 1, 'Portugal'),
  (4, 1, 'Allemagne'),
  (5, 2, 'Chine'),
  (6, 2, 'Inde'),
  (7, 2, 'Japon'),
  (8, 3, 'Marroc'),
  (9, 3, 'Senegal'),
  (10, 4, 'Mexique'),
  (11, 4, 'Peru');

INSERT INTO voyages.voyage (id_voyage, id_continent, id_pays, ville) VALUES
	(1, 1, 1, 'Paris'),
  (2, 1, 2, 'Lyon'),
  (3, 1, 3, 'Barcelone'),
  (4, 1, 4, 'Seville'),
  (5, 2, 5, 'Lisbonne'),
  (6, 2, 6, 'Porto'),
  (7, 2, 7, 'Berlin'),
  (8, 2, 7, 'Nordlingen'),
  (9, 3, 9, 'Shanghai'),
  (10, 4, 10, 'Wuhan'),
  (11, 4, 11, 'Bombay'),
  (12, 4, 10, 'NewDelhi'),
  (13, 4, 11, 'Tokyo'),
  (14, 1, 1, 'Kyoto'),
  (15, 1, 2, 'Marrakech'),
  (16, 1, 3, 'Casablanca'),
  (17, 1, 4, 'Dakar'),
  (18, 2, 5, 'SaintLouis'),
  (19, 2, 6, 'Mexico'),
  (20, 2, 7, 'PuertoMorelos'),
  (21, 3, 8, 'Cuzco'),
  (22, 3, 9, 'Huaraz'),
  (23, 3, 9, 'PPPPPP');
