-- MySQL dump 10.13  Distrib 5.7.24, for Linux (x86_64)
--
-- Host: localhost    Database: wideworldimporters
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.36-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `gebruikers`
--

DROP TABLE IF EXISTS `gebruikers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gebruikers` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `Voornaam` varchar(45) DEFAULT NULL,
  `Tussenvoegsels` varchar(45) DEFAULT NULL,
  `Achternaam` varchar(45) DEFAULT NULL,
  `Straat` varchar(45) DEFAULT NULL,
  `Huisnummer` varchar(45) DEFAULT NULL,
  `Postcode` varchar(45) DEFAULT NULL,
  `Plaats` varchar(45) DEFAULT NULL,
  `Email` varchar(45) NOT NULL,
  `Wachtwoord` varchar(45) NOT NULL,
  `Telefoonnummer` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gebruikers`
--

LOCK TABLES `gebruikers` WRITE;
/*!40000 ALTER TABLE `gebruikers` DISABLE KEYS */;
INSERT INTO `gebruikers` VALUES (1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'daniel2','1a1dc91c907325c69271ddf0c944bc72',NULL),(12,'adwin','li','quidcaps','','','','','pipo@pip.nl','1e7f80f62335c365af204a7a15f20272','400'),(37,'pipo','','clown','fefe','22','7323sp','dwdw','pipo2@pip.nl','a16656a039d8b23731b3e933914f8bd7',''),(38,'pipo','','clown','fefe','22','7323sp','dwdw','pipo2@pip.nl','a16656a039d8b23731b3e933914f8bd7',''),(39,'pipo','','clown','fefe','22','7323sp','dwdw','pipo2@pip.nl','a16656a039d8b23731b3e933914f8bd7',''),(40,'adwin','','quidcaps','fefe','22','7323sp','Apeldoorn','pipo@pip.nl','1e7f80f62335c365af204a7a15f20272','hihi2');
/*!40000 ALTER TABLE `gebruikers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-01-08 19:51:39
