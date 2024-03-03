DROP DATABASE IF EXISTS bbdd;
CREATE DATABASE bbdd;

USE bbdd;

CREATE TABLE jugador (
	id INT NOT NULL,
	username VARCHAR(15)
)ENGINE=InnoDB;

CREATE TABLE partida (
	id INT NOT NULL,
	duracion FLOAT,
	fecha VARCHAR(15),
	hora VARCHAR(15)
)ENGINE=InnoDB;

CREATE TABLE informacion (
	id_j1 INT,
	id_j2 INT,
	id_p INT,
	id_ganador INT,
	puntos_j1 INT,
	puntos_j2 INT,
	FOREIGN KEY (id_j1) REFERENCES jugador(ip),
	FOREIGN KEY (id_j2) REFERENCES jugador(ip),
	FOREIGN KEY (id_p) REFERENCES partida(ip)
)ENGINE=InnoDB;

CREATE TABLE ranking (
	id_j INT,
	puntos INT,
	username VARCHAR(15)
)ENGINE=InnoDB;


INSERT INTO jugador VALUES (4,'Juan');
INSERT INTO jugador VALUES (6,'Maria');
INSERT INTO jugador VALUES (3,'Mario');

INSERT INTO partida VALUES (1,2.30,'12/03/23','16:39');
INSERT INTO partida VALUES (2,3.30,'23/03/23','16:30');

INSERT INTO ranking VALUES (4,49,'Juan');
INSERT INTO ranking VALUES (3,47,'Mario');

INSERT INTO informacion VALUES (4,6,1,4,49,45);
INSERT INTO informacion VALUES (4,3,2,3,42,47);
