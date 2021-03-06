-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: gestion_cinema
-- ------------------------------------------------------
-- Server version	8.0.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `gestion_cinema`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `gestion_cinema` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `gestion_cinema`;

--
-- Table structure for table `administrateur`
--

DROP TABLE IF EXISTS `administrateur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `administrateur` (
  `id_admin` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `login` varchar(254) NOT NULL,
  `mot_de_passe` varchar(60) NOT NULL,
  PRIMARY KEY (`id_admin`),
  UNIQUE KEY `login` (`login`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrateur`
--

LOCK TABLES `administrateur` WRITE;
/*!40000 ALTER TABLE `administrateur` DISABLE KEYS */;
INSERT INTO `administrateur` VALUES (1,'AAAA','Jean','jean.aaaa@cinema.fr','Admin'),(2,'BBBB','Jacques','jacques.bbbb@cinema.fr','JB'),(3,'CCCC','Philippe','philippe.cccc@cinema.fr','PC'),(4,'DDDD','Sophie','sophie.dddd@cineam.fr','DS'),(5,'EEEE','Carole','carole.eeee@cinema.fr','CE');
/*!40000 ALTER TABLE `administrateur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client` (
  `id_client` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `date_naissance` date NOT NULL,
  `email` varchar(100) NOT NULL,
  `telephone` varchar(10) DEFAULT NULL,
  `login` varchar(254) NOT NULL,
  `mot_de_passe` varchar(60) NOT NULL,
  PRIMARY KEY (`id_client`),
  UNIQUE KEY `login` (`login`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (1,'CLIENTA','pre1','2000-01-25','pre1.clienta@prov.com','0611587429','pre1.clienta@prov.com','mdpa'),(2,'CLIENTB','pre2','2005-10-02','pre2.clientb@prov.com',NULL,'pre2.clientb@prov.com','mdpb'),(3,'CLIENTC','pre3','2003-10-25','pre3.clientc@prov.com','0625879853','pre3.clientc@prov.com','mdpc'),(4,'CLIENTD','pre4','1998-06-10','pre4.clientd@prov.com','0623584179','pre4.clientd@prov.com','mdpd'),(5,'CLIENTE','pre5','1988-12-02','pre5.cliente@prov.com',NULL,'pre5.cliente@prov.com','mdpe'),(6,'CLIENTF','pre6','1978-04-10','pre6.clientf@prov.com','0612345678','pre6.clientf@prov.com','mdpf');
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `complexe`
--

DROP TABLE IF EXISTS `complexe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `complexe` (
  `id_complex` int NOT NULL AUTO_INCREMENT,
  `nom_complexe` varchar(20) NOT NULL,
  PRIMARY KEY (`id_complex`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `complexe`
--

LOCK TABLES `complexe` WRITE;
/*!40000 ALTER TABLE `complexe` DISABLE KEYS */;
INSERT INTO `complexe` VALUES (1,'ComplexeA'),(2,'ComplexeB'),(3,'ComplexeC'),(4,'ComplexeD');
/*!40000 ALTER TABLE `complexe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detail_reservation`
--

DROP TABLE IF EXISTS `detail_reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detail_reservation` (
  `id_detail_reservation` int NOT NULL AUTO_INCREMENT,
  `nombre_plein_tarif` int DEFAULT NULL,
  `nombre_tarif_etudiant` int DEFAULT NULL,
  `nombre_moins_14ans` int DEFAULT NULL,
  `paiement_internet` tinyint(1) DEFAULT '0',
  `fk_reservation` int NOT NULL,
  PRIMARY KEY (`id_detail_reservation`),
  KEY `fk_reservation` (`fk_reservation`),
  CONSTRAINT `detail_reservation_ibfk_1` FOREIGN KEY (`fk_reservation`) REFERENCES `reservation` (`id_reservation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detail_reservation`
--

LOCK TABLES `detail_reservation` WRITE;
/*!40000 ALTER TABLE `detail_reservation` DISABLE KEYS */;
/*!40000 ALTER TABLE `detail_reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `films`
--

DROP TABLE IF EXISTS `films`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `films` (
  `id_film` int NOT NULL AUTO_INCREMENT,
  `titre_film` varchar(100) NOT NULL,
  `duree_film` time NOT NULL,
  `en_cours` tinyint(1) NOT NULL DEFAULT '1',
  `a_l_affiche` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_film`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `films`
--

LOCK TABLES `films` WRITE;
/*!40000 ALTER TABLE `films` DISABLE KEYS */;
INSERT INTO `films` VALUES (1,'FilmA','01:50:00',1,1),(2,'FilmB','02:30:00',1,1),(3,'FilmC','02:30:00',1,1),(4,'FimD','03:30:00',1,1),(5,'FilmE','01:45:00',1,0),(6,'FilmF','02:10:00',1,0),(7,'FilmG','03:00:00',1,0),(8,'FilmH','02:00:00',1,0),(9,'FilmI','02:10:00',1,0);
/*!40000 ALTER TABLE `films` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gestion_acces`
--

DROP TABLE IF EXISTS `gestion_acces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gestion_acces` (
  `id_gestion` int NOT NULL AUTO_INCREMENT,
  `fk_admin` int NOT NULL,
  `fk_complex` int NOT NULL,
  PRIMARY KEY (`id_gestion`),
  KEY `fk_admin` (`fk_admin`),
  KEY `fk_complex` (`fk_complex`),
  CONSTRAINT `gestion_acces_ibfk_1` FOREIGN KEY (`fk_admin`) REFERENCES `administrateur` (`id_admin`),
  CONSTRAINT `gestion_acces_ibfk_2` FOREIGN KEY (`fk_complex`) REFERENCES `complexe` (`id_complex`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gestion_acces`
--

LOCK TABLES `gestion_acces` WRITE;
/*!40000 ALTER TABLE `gestion_acces` DISABLE KEYS */;
INSERT INTO `gestion_acces` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,2,1),(6,3,2),(7,4,3),(8,5,4);
/*!40000 ALTER TABLE `gestion_acces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation` (
  `id_reservation` int NOT NULL AUTO_INCREMENT,
  `fk_client` int NOT NULL,
  `fk_seance` int NOT NULL,
  PRIMARY KEY (`id_reservation`),
  KEY `fk_client` (`fk_client`),
  KEY `fk_seance` (`fk_seance`),
  CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`fk_client`) REFERENCES `client` (`id_client`),
  CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`fk_seance`) REFERENCES `seances` (`id_seance`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salles`
--

DROP TABLE IF EXISTS `salles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salles` (
  `id_salle` int NOT NULL AUTO_INCREMENT,
  `intitule_salle` varchar(20) NOT NULL,
  `nombre_places` int NOT NULL,
  `fk_complex` int NOT NULL,
  PRIMARY KEY (`id_salle`),
  KEY `fk_complex` (`fk_complex`),
  CONSTRAINT `salles_ibfk_1` FOREIGN KEY (`fk_complex`) REFERENCES `complexe` (`id_complex`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salles`
--

LOCK TABLES `salles` WRITE;
/*!40000 ALTER TABLE `salles` DISABLE KEYS */;
INSERT INTO `salles` VALUES (1,'SalleA',300,1),(2,'SalleB',250,1),(3,'SalleC',100,1),(4,'SalleD',350,1),(5,'SalleE',400,1),(6,'SalleF',350,1),(7,'SalleA',350,2),(8,'SalleB',320,2),(9,'SalleC',400,2),(10,'SalleD',120,2),(11,'SalleE',300,2),(12,'SalleA',250,3),(13,'SalleB',300,3),(14,'SalleC',450,3),(15,'SalleD',300,3),(16,'SalleE',350,3),(17,'SalleF',250,3),(18,'SalleA',380,4),(19,'SalleB',400,4),(20,'SalleC',350,4),(21,'SalleD',300,4);
/*!40000 ALTER TABLE `salles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seances`
--

DROP TABLE IF EXISTS `seances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seances` (
  `id_seance` int NOT NULL AUTO_INCREMENT,
  `date_seance` date NOT NULL,
  `heure_debut_seance` time NOT NULL,
  `heure_fin_seance` time NOT NULL,
  `fk_salle` int NOT NULL,
  `fk_film` int NOT NULL,
  PRIMARY KEY (`id_seance`),
  KEY `fk_film` (`fk_film`),
  KEY `fk_salle` (`fk_salle`),
  CONSTRAINT `seances_ibfk_1` FOREIGN KEY (`fk_film`) REFERENCES `films` (`id_film`),
  CONSTRAINT `seances_ibfk_2` FOREIGN KEY (`fk_salle`) REFERENCES `salles` (`id_salle`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seances`
--

LOCK TABLES `seances` WRITE;
/*!40000 ALTER TABLE `seances` DISABLE KEYS */;
INSERT INTO `seances` VALUES (1,'2022-03-01','12:00:00','13:50:00',1,1),(2,'2022-03-01','14:00:00','16:30:00',3,2),(3,'2022-03-01','15:00:00','16:45:00',4,5),(4,'2022-03-01','16:00:00','18:00:00',1,8),(5,'2022-03-01','12:00:00','13:50:00',7,1),(6,'2022-03-01','14:00:00','16:30:00',8,3),(7,'2022-03-01','15:00:00','18:30:00',9,4),(8,'2022-03-01','16:00:00','18:10:00',10,9),(9,'2022-03-01','12:00:00','13:45:00',12,5),(10,'2022-03-01','14:00:00','16:30:00',13,3),(11,'2022-03-01','15:00:00','17:00:00',14,8),(12,'2022-03-01','16:00:00','18:30:00',17,2),(13,'2022-03-01','12:00:00','13:50:00',18,1),(14,'2022-03-01','14:00:00','16:10:00',19,6),(15,'2022-03-01','15:00:00','18:30:00',20,4),(16,'2022-03-01','16:00:00','18:30:00',21,2);
/*!40000 ALTER TABLE `seances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tarif`
--

DROP TABLE IF EXISTS `tarif`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tarif` (
  `id_tarif` int NOT NULL AUTO_INCREMENT,
  `libelle_tarif` varchar(50) NOT NULL,
  `prix` double NOT NULL,
  PRIMARY KEY (`id_tarif`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tarif`
--

LOCK TABLES `tarif` WRITE;
/*!40000 ALTER TABLE `tarif` DISABLE KEYS */;
INSERT INTO `tarif` VALUES (1,'Plein Tarif',9.2),(2,'Etudiant',7.6),(3,'Moins de 14 ans',5.9);
/*!40000 ALTER TABLE `tarif` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-22 20:36:11
