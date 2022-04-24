USE gestion_cinema; /* connection à la base de données */

/* insertion données table tarif */
INSERT INTO gestion_cinema.tarif (libelle_tarif,prix) VALUES
	 ('Plein Tarif',9.2),
	 ('Etudiant',7.6),
	 ('Moins de 14 ans',5.9);

SELECT * FROM tarif; /* visualisation des données*/

/* insertion données table films */
INSERT INTO gestion_cinema.films (titre_film,duree_film,en_cours,a_l_affiche) VALUES
	 ('FilmA','01:50:00',1,1),
	 ('FilmB','02:30:00',1,1),
	 ('FilmC','02:30:00',1,1),
	 ('FimD','03:30:00',1,1),
	 ('FilmE','01:45:00',1,0),
	 ('FilmF','02:10:00',1,0),
	 ('FilmG','03:00:00',1,0),
	 ('FilmH','02:00:00',1,0),
	 ('FilmI','02:10:00',1,0);

SELECT * FROM films; /* visualisation des données*/


/* insertion données table complexe */
INSERT INTO gestion_cinema.complexe (nom_complexe) VALUES
	 ('ComplexeA'),
	 ('ComplexeB'),
	 ('ComplexeC'),
	 ('ComplexeD');

SELECT * FROM complexe; /* visualisation des données*/

/* insertion données table administrateur */

SELECT * FROM administrateur; /* visualisation des données*/
INSERT INTO gestion_cinema.administrateur (nom,prenom,login,mot_de_passe) VALUES
	 ('AAAA','Jean','jean.aaaa@cinema.fr','Admin'),
	 ('BBBB','Jacques','jacques.bbbb@cinema.fr','JB'),
	 ('CCCC','Philippe','philippe.cccc@cinema.fr','PC'),
	 ('DDDD','Sophie','sophie.dddd@cineam.fr','DS'),
	 ('EEEE','Carole','carole.eeee@cinema.fr','CE');



/* insertion données table gestion des accès */
INSERT INTO gestion_cinema.gestion_acces (fk_admin,fk_complex) VALUES
	 (1,1),
	 (1,2),
	 (1,3),
	 (1,4),
	 (2,1),
	 (3,2),
	 (4,3),
	 (5,4);

SELECT * FROM gestion_acces; /* visualisation des données*/

/* insertion données table des salles */
INSERT INTO gestion_cinema.salles (intitule_salle,nombre_places,fk_complex) VALUES
	 ('SalleA',300,1),
	 ('SalleB',250,1),
	 ('SalleC',100,1),
	 ('SalleD',350,1),
	 ('SalleE',400,1),
	 ('SalleF',350,1),
	 ('SalleA',350,2),
	 ('SalleB',320,2),
	 ('SalleC',400,2),
	 ('SalleD',120,2),
	 ('SalleE',300,2),
	 ('SalleA',250,3),
	 ('SalleB',300,3),
	 ('SalleC',450,3),
	 ('SalleD',300,3),
	 ('SalleE',350,3),
	 ('SalleF',250,3),
	 ('SalleA',380,4),
	 ('SalleB',400,4),
	 ('SalleC',350,4),
	 ('SalleD',300,4);


SELECT * FROM salles; /* visualisation des données*/

/* insertion données table des clients */
INSERT INTO gestion_cinema.client (nom,prenom,date_naissance,email,telephone,login,mot_de_passe) VALUES	 ('CLIENTA','pre1','2000-01-25','pre1.clienta@prov.com','0611587429','pre1.clienta@prov.com','mdpa'),
('CLIENTB','pre2','2005-10-02','pre2.clientb@prov.com',NULL,'pre2.clientb@prov.com','mdpb'),	 ('CLIENTC','pre3','2003-10-25','pre3.clientc@prov.com','0625879853','pre3.clientc@prov.com','mdpc'),	 ('CLIENTD','pre4','1998-06-10','pre4.clientd@prov.com','0623584179','pre4.clientd@prov.com','mdpd'),
('CLIENTE','pre5','1988-12-02','pre5.cliente@prov.com',NULL,'pre5.cliente@prov.com','mdpe'),
('CLIENTF','pre6','1978-04-10','pre6.clientf@prov.com','0612345678','pre6.clientf@prov.com','mdpf');

SELECT * FROM client; /* visualisation des données*/

/* insertion données table des séances */
INSERT INTO gestion_cinema.seances (date_seance,heure_debut_seance,heure_fin_seance,fk_salle,fk_film) VALUES
	 ('2022-03-01','12:00:00','13:50:00',1,1),
	 ('2022-03-01','14:00:00','16:30:00',3,2),
	 ('2022-03-01','15:00:00','16:45:00',4,5),
	 ('2022-03-01','16:00:00','18:00:00',1,8),
	 ('2022-03-01','12:00:00','13:50:00',7,1),
	 ('2022-03-01','14:00:00','16:30:00',8,3),
	 ('2022-03-01','15:00:00','18:30:00',9,4),
	 ('2022-03-01','16:00:00','18:10:00',10,9),
	 ('2022-03-01','12:00:00','13:45:00',12,5),
	 ('2022-03-01','14:00:00','16:30:00',13,3),
	 ('2022-03-01','15:00:00','17:00:00',14,8),
	 ('2022-03-01','16:00:00','18:30:00',17,2),
	 ('2022-03-01','12:00:00','13:50:00',18,1),
	 ('2022-03-01','14:00:00','16:10:00',19,6),
	 ('2022-03-01','15:00:00','18:30:00',20,4),
	 ('2022-03-01','16:00:00','18:30:00',21,2);

SELECT * FROM seances; /* visualisation des données*/


