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
-- Table structure for table `coldroomtemperatures`
--

DROP TABLE IF EXISTS `coldroomtemperatures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coldroomtemperatures` (
  `ColdRoomTemperatureID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ColdRoomSensorNumber` int(11) NOT NULL,
  `RecordedWhen` datetime NOT NULL,
  `Temperature` decimal(10,2) NOT NULL,
  `ValidFrom` datetime NOT NULL,
  `ValidTo` datetime NOT NULL,
  PRIMARY KEY (`ColdRoomTemperatureID`),
  KEY `IX_Warehouse_ColdRoomTemperatures_ColdRoomSensorNumber` (`ColdRoomSensorNumber`)
) ENGINE=InnoDB AUTO_INCREMENT=3654741 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coldroomtemperatures`
--

LOCK TABLES `coldroomtemperatures` WRITE;
/*!40000 ALTER TABLE `coldroomtemperatures` DISABLE KEYS */;
INSERT INTO `coldroomtemperatures` VALUES (3654737,1,'2016-05-31 23:59:24',3.72,'2016-05-31 23:59:24','9999-12-31 23:59:59'),(3654738,2,'2016-05-31 23:59:24',4.70,'2016-05-31 23:59:24','9999-12-31 23:59:59'),(3654739,3,'2016-05-31 23:59:24',3.00,'2016-05-31 23:59:24','9999-12-31 23:59:59'),(3654740,4,'2016-05-31 23:59:24',3.58,'2016-05-31 23:59:24','9999-12-31 23:59:59');
/*!40000 ALTER TABLE `coldroomtemperatures` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-01-08 19:51:40
