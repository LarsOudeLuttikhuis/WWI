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
-- Table structure for table `buyinggroups`
--

DROP TABLE IF EXISTS `buyinggroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `buyinggroups` (
  `BuyingGroupID` int(11) NOT NULL,
  `BuyingGroupName` varchar(50) NOT NULL,
  `LastEditedBy` int(11) NOT NULL,
  `ValidFrom` datetime NOT NULL,
  `ValidTo` datetime NOT NULL,
  PRIMARY KEY (`BuyingGroupID`),
  UNIQUE KEY `UQ_Sales_BuyingGroups_BuyingGroupName` (`BuyingGroupName`),
  KEY `FK_Sales_BuyingGroups_Application_People` (`LastEditedBy`),
  CONSTRAINT `FK_Sales_BuyingGroups_Application_People` FOREIGN KEY (`LastEditedBy`) REFERENCES `people` (`PersonID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buyinggroups`
--

LOCK TABLES `buyinggroups` WRITE;
/*!40000 ALTER TABLE `buyinggroups` DISABLE KEYS */;
INSERT INTO `buyinggroups` VALUES (1,'Tailspin Toys',1,'2013-01-01 00:00:00','9999-12-31 23:59:59'),(2,'Wingtip Toys',1,'2013-01-01 00:00:00','9999-12-31 23:59:59');
/*!40000 ALTER TABLE `buyinggroups` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-01-08 19:51:38
