--- Creo database
CREATE DATABASE `universita`;


USE `universita`;

-- aggiungo le tabelle
CREATE TABLE `dipartimento`(
`id` INT  NOT NULL AUTO_INCREMENT,
`direttore` VARCHAR(255) NOT NULL,
`consiglio` VARCHAR(255),
`bilancio` DECIMAL(),
PRIMARY KEY(`id`)
);

CREATE TABLE `corsi_di_laurea`(
`id` INT NOT NULL AUTO_INCREMENT,
`nome` VARCHAR(255)NOT NULL,
`durata` YEAR NOT NULL,
`sbocchi_professionali`VARCHAR(255),
PRIMARY KEY (`id`)
);

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
);

CREATE TABLE `studente`(
`id` INT NOT NULL AUTO_INCREMENT,
`nome`VARCHAR(255)NOT NULL,
`cognome` VARCHAR(255) NOT NULL,
`matricola`INT NOT NULL UNIQUE,
`e-mail`VARCHAR(255),
PRIMARY KEY(`id`)
);

-- aggiungo le foreign key
ALTER TABLE `corsi_di_laurea` ADD COLUMN`dipartimento_id`INT;
ALTER TABLE `corsi_di_laurea` ADD FOREIGN KEY(`dipartimento_id`) REFERENCES `dipartimento`(`id`);

ALTER TABLE `corsi` ADD COLUMN`corsi_di_laurea_id`INT;
ALTER TABLE `corsi` ADD FOREIGN KEY(`corsi_di_laurea_id`) REFERENCES `corsi_di_laurea`(`id`);

ALTER TABLE `corsi` ADD COLUMN`insegnanti_id`INT;
ALTER TABLE `corsi` ADD FOREIGN KEY(`insegnanti_id`) REFERENCES `insegnanti`(`id`);
ALTER TABLE `insegnanti` ADD COLUMN`corsi_id`INT;
ALTER TABLE `insegnanti` ADD FOREIGN KEY(`corsi_id`) REFERENCES `corsi`(`id`);

ALTER TABLE `studente` ADD COLUMN`corsi_di_laurea_id`INT;
ALTER TABLE `studente` ADD FOREIGN KEY(`corsi_di_laurea_id`) REFERENCES `corsi_di_laurea`(`id`);

--creo tabella ponte tra corsi e insegnati
CREATE TABLE corsi_insegnati(
`corsi_id` INT NOT NULL AUTO_INCREMENT,
`insegnanti` INT NOT NULL AUTO_INCREMENT,
PRIMARY KEY(`corsi_id`),
PRIMARY KEY(`insegnati_id`)
);

--inserisco dati nelle tabelle
INSERT INTO `dipartimento`(`direttore`,`consiglio`,`bilancio) 
VALUES('Daniels','Consiglio di dipartimento`, 3500,88);
INSERT INTO `dipartimento`(`direttore`,`consiglio`,`bilancio) 
VALUES('Laeddis','Rappresentanti degli studenti`, 10000,77);

INSERT INTO `corsi_di_laurea`(`nome`,`durata`,`sbocchi_professionali`) 
VALUES(`Ingegneria_civile`,2022-2025, `Ingegnere`);
INSERT INTO `corsi_di_laurea`(`nome`,`durata`,`sbocchi_professionali`) 
VALUES(`Economia`,2022-2027, `Società di consulenza`);


INSERT INTO `corsi`(`nome`,`numero_studenti`) 
VALUES(`Analisi_matematica`, `105`);
INSERT INTO `corsi`(`nome`,`numero_studenti`) 
VALUES(`Fisica`, `85`);

INSERT INTO `insegnanti`(`nome`,`cognome`) 
VALUES(`Carlo`, `Rossi`);
INSERT INTO `insegnanti`(`nome`,`cognome`) 
VALUES(`Fabio`, `Bianchi`);

INSERT INTO `studente`(`nome`,`cognome`,`matricola`,`e_mail`) 
VALUES(`John`,`Cena`, `000375`,`john.cena@gmail.it`);
INSERT INTO `studente`(`nome`,`cognome`,`matricola`,`e_mail`) 
VALUES(`Rey`,`Mysterio`, `000619`,`rey.mysterio619@gmail.it`);