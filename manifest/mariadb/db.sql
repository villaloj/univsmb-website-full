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
  (2, 1, 1, 'Lyon'),
  (3, 1, 2, 'Barcelone'),
  (4, 1, 2, 'Seville'),
  (5, 1, 3, 'Lisbonne'),
  (6, 1, 3, 'Porto'),
  (7, 1, 4, 'Berlin'),
  (8, 1, 4, 'Nordlingen'),
  (9, 2, 5, 'Shanghai'),
  (10, 2, 5, 'Wuhan'),
  (11, 2, 6, 'Bombay'),
  (12, 2, 6, 'NewDelhi'),
  (13, 2, 7, 'Tokyo'),
  (14, 2, 7, 'Kyoto'),
  (15, 3, 8, 'Marrakech'),
  (16, 3, 8, 'Casablanca'),
  (17, 3, 9, 'Dakar'),
  (18, 3, 9, 'SaintLouis'),
  (19, 4, 10, 'Mexico'),
  (20, 4, 10, 'PuertoMorelos'),
  (21, 4, 11, 'Cuzco'),
  (22, 4, 11, 'Huaraz'),
  (23, 3, 9, 'PPPPPP');
