--- Creo database
CREATE DATABASE universita;


USE `universita`;

-- aggiungo le tabelle
CREATE TABLE `dipartimento`(
    `id` INT  NOT NULL AUTO_INCREMENT,
    `direttore` VARCHAR(255) NOT NULL,
    `consiglio` VARCHAR(255),
    `bilancio` DECIMAL(6,4),
    PRIMARY KEY(`id`)
);

CREATE TABLE `corsi_di_laurea`(
    `id` INT NOT NULL AUTO_INCREMENT,
    `nome` VARCHAR(255)NOT NULL,
    `durata` YEAR NOT NULL,
    `sbocchi_professionali`VARCHAR(255),
    PRIMARY KEY (`id`)
);
ALTER TABLE universita.dipartimento MODIFY COLUMN bilancio INT NULL;


CREATE TABLE `corsi`(
    `id` int NOT NULL AUTO_INCREMENT,
    `nome` VARCHAR(255)NOT NULL,
    `numero_studenti` INT,
    PRIMARY KEY (`id`)
);

CREATE TABLE `insegnati`(
    `id` INT NOT NULL AUTO_INCREMENT,
    `nome` VARCHAR(255)NOT NULL,
    `cognome`VARCHAR(255)NOT NULL,
    PRIMARY KEY (`id`)
);

CREATE TABLE `studente`(
    `id` INT NOT NULL AUTO_INCREMENT,
    `nome`VARCHAR(255)NOT NULL,
    `cognome` VARCHAR(255) NOT NULL,
    `matricola`INT NOT NULL UNIQUE,
    `e-mail`VARCHAR(255),
    PRIMARY KEY(`id`)
);


ALTER TABLE universita.studente CHANGE `e-mail` e_mail varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL;
-- aggiungo le foreign key
ALTER TABLE `corsi_di_laurea` ADD COLUMN`dipartimento_id`INT;
ALTER TABLE `corsi_di_laurea` ADD FOREIGN KEY(`dipartimento_id`) REFERENCES `dipartimento`(`id`);

ALTER TABLE `corsi` ADD COLUMN`corsi_di_laurea_id`INT;
ALTER TABLE `corsi` ADD FOREIGN KEY(`corsi_di_laurea_id`) REFERENCES `corsi_di_laurea`(`id`);

ALTER TABLE `studente` ADD COLUMN`corsi_di_laurea_id`INT;
ALTER TABLE `studente` ADD FOREIGN KEY(`corsi_di_laurea_id`) REFERENCES `corsi_di_laurea`(`id`);

--creo tabella ponte tra corsi e insegnati
CREATE TABLE insegnanti_corsi(
	insegnanti_id INT, 
	corsi_id INT,
	FOREIGN KEY(insegnanti_id) REFERENCES insegnati(id),
	FOREIGN KEY(corsi_id) REFERENCES corsi(id),
	PRIMARY KEY(insegnanti_id, corsi_id)
);


--inserisco dati nelle tabelle
INSERT INTO dipartimento (direttore, consiglio, bilancio) 
VALUES ('Bianca Neve', 'Rappresentanti studenti', 11100);
INSERT INTO dipartimento (direttore, consiglio, bilancio) 
VALUES ('Fabio Rossi', 'Consiglio di dipartimento', 11200);

INSERT INTO `corsi_di_laurea`(nome,durata,sbocchi_professionali) 
VALUES('Ingegneria',2022-01-01/2025-01-01, 'Ingegnere');
INSERT INTO `corsi_di_laurea`(nome,durata,sbocchi_professionali) 
VALUES('Economia',2022-01-01/2027-01-01, 'Società di consulenza');

INSERT INTO `corsi`(nome ,numero_studenti) 
VALUES('Analisi_matematica', 105);
INSERT INTO `corsi`(nome,numero_studenti) 
VALUES('Fisica', 85);

INSERT INTO `insegnati`(nome,cognome) 
VALUES('Carlo', 'Rossi');
INSERT INTO `insegnati`(`nome`,`cognome`) 
VALUES('Fabio', 'Bianchi');

INSERT INTO insegnanti_corsi
(insegnanti_id, corsi_id)
VALUES(1, 1);

INSERT INTO insegnanti_corsi
(insegnanti_id, corsi_id)
VALUES(2, 2);


INSERT INTO `studente`(nome,cognome,matricola,e_mail) 
VALUES('John','Cena', 000375,'john.cena@gmail.it');
INSERT INTO `studente`(nome,cognome,matricola,e_mail) 
VALUES('Rey','Mysterio', 000619,'rey.mysterio619@gmail.it');