

CREATE DATABASE gestion_cinema; /* création de la base de données */

USE gestion_cinema; /* connection à la base de données */

/* création de la table administrateur */
CREATE TABLE administrateur (
  id_admin INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  nom VARCHAR(50) NOT NULL,
  prenom VARCHAR(50) NOT NULL,
  login VARCHAR(254) NOT NULL UNIQUE,
  mot_de_passe VARCHAR(60) NOT NULL
);

/* création de la table client */
CREATE TABLE client (
  id_client INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  nom VARCHAR(50) NOT NULL,
  prenom VARCHAR(50) NOT NULL,
  date_naissance DATE NOT NULL,
  email VARCHAR(100)  NOT NULL,
  telephone VARCHAR(10),
  login VARCHAR(254) NOT NULL UNIQUE,
  mot_de_passe VARCHAR(60) NOT NULL
) ;

/* creation de la table complexe */
CREATE TABLE complexe (
  id_complex INT NOT NULL AUTO_INCREMENT PRIMARY KEY ,
  nom_complexe VARCHAR(20) NOT NULL
) ;

/* création de la table films */
CREATE TABLE films (
  id_film INT NOT NULL AUTO_INCREMENT PRIMARY KEY ,
  titre_film VARCHAR(100) NOT NULL,
  duree_film TIME NOT NULL,
  en_cours BOOLEAN NOT NULL DEFAULT TRUE,
  a_l_affiche BOOLEAN NOT NULL DEFAULT FALSE
) ;

/* création de la table tarifs */
CREATE TABLE tarif (
  id_tarif INT NOT NULL AUTO_INCREMENT PRIMARY KEY ,
  libelle_tarif VARCHAR(50) NOT NULL,
  prix REAL NOT NULL
);

/* création des tables avec Foreign Key */

/* création de la table gestion des accès */
CREATE TABLE gestion_acces (
  id_gestion INT NOT NULL AUTO_INCREMENT PRIMARY KEY ,
  fk_admin INT NOT NULL,
  fk_complex INT NOT NULL,
  FOREIGN KEY (fk_admin) REFERENCES administrateur(id_admin),
  FOREIGN KEY (fk_complex) REFERENCES complexe(id_complex)
); 

/* création de la table des salles */
CREATE TABLE salles (
  id_salle INT NOT NULL AUTO_INCREMENT PRIMARY KEY ,
  intitule_salle VARCHAR(20) NOT NULL,
  nombre_places INT NOT NULL,
  fk_complex INT NOT NULL,
   FOREIGN KEY (fk_complex) REFERENCES complexe(id_complex)
);

/* création de la table des séances */
CREATE TABLE seances (
  id_seance INT NOT NULL AUTO_INCREMENT PRIMARY KEY ,
  date_seance DATE NOT NULL,
  heure_debut_seance TIME NOT NULL,
  heure_fin_seance TIME NOT NULL,
  fk_salle INT NOT NULL,
  fk_film INT NOT NULL,
  FOREIGN KEY (fk_film) REFERENCES films(id_film),
  FOREIGN KEY (fk_salle) REFERENCES salles(id_salle)
);

/* création de la table des reservations */
CREATE TABLE reservation (
  id_reservation INT NOT NULL AUTO_INCREMENT PRIMARY KEY ,
  fk_client INT NOT NULL,
  fk_seance INT NOT NULL,
  FOREIGN KEY (fk_client) REFERENCES client(id_client),
  FOREIGN KEY (fk_seance) REFERENCES seances(id_seance)
);

/* création de la table des détails des reservations */
CREATE TABLE detail_reservation (
  id_detail_reservation INT NOT NULL AUTO_INCREMENT PRIMARY KEY ,
  nombre_plein_tarif INT DEFAULT NULL,
  nombre_tarif_etudiant INT DEFAULT NULL,
  nombre_moins_14ans INT DEFAULT NULL,
  paiement_internet BOOLEAN DEFAULT FALSE,
  fk_reservation INT NOT NULL,
  FOREIGN KEY (fk_reservation) REFERENCES reservation(id_reservation)
)
