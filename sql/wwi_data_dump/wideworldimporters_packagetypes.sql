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
-- Table structure for table `packagetypes`
--

DROP TABLE IF EXISTS `packagetypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `packagetypes` (
  `PackageTypeID` int(11) NOT NULL,
  `PackageTypeName` varchar(50) NOT NULL,
  `LastEditedBy` int(11) NOT NULL,
  `ValidFrom` datetime NOT NULL,
  `ValidTo` datetime NOT NULL,
  PRIMARY KEY (`PackageTypeID`),
  UNIQUE KEY `UQ_Warehouse_PackageTypes_PackageTypeName` (`PackageTypeName`),
  KEY `FK_Warehouse_PackageTypes_Application_People` (`LastEditedBy`),
  CONSTRAINT `FK_Warehouse_PackageTypes_Application_People` FOREIGN KEY (`LastEditedBy`) REFERENCES `people` (`PersonID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `packagetypes`
--

LOCK TABLES `packagetypes` WRITE;
/*!40000 ALTER TABLE `packagetypes` DISABLE KEYS */;
INSERT INTO `packagetypes` VALUES (1,'Bag',1,'2013-01-01 00:00:00','9999-12-31 23:59:59'),(2,'Block',1,'2013-01-01 00:00:00','9999-12-31 23:59:59'),(3,'Bottle',1,'2013-01-01 00:00:00','9999-12-31 23:59:59'),(4,'Box',1,'2013-01-01 00:00:00','9999-12-31 23:59:59'),(5,'Can',1,'2013-01-01 00:00:00','9999-12-31 23:59:59'),(6,'Carton',1,'2013-01-01 00:00:00','9999-12-31 23:59:59'),(7,'Each',1,'2013-01-01 00:00:00','9999-12-31 23:59:59'),(8,'Kg',1,'2013-01-01 00:00:00','9999-12-31 23:59:59'),(9,'Packet',1,'2013-01-01 00:00:00','9999-12-31 23:59:59'),(10,'Pair',1,'2013-01-01 00:00:00','9999-12-31 23:59:59'),(11,'Pallet',1,'2013-01-01 00:00:00','9999-12-31 23:59:59'),(12,'Tray',1,'2013-01-01 00:00:00','9999-12-31 23:59:59'),(13,'Tub ',1,'2013-01-01 00:00:00','9999-12-31 23:59:59'),(14,'Tube',1,'2013-01-01 00:00:00','9999-12-31 23:59:59');
/*!40000 ALTER TABLE `packagetypes` ENABLE KEYS */;
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
