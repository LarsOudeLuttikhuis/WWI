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
-- Table structure for table `transactiontypes`
--

DROP TABLE IF EXISTS `transactiontypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transactiontypes` (
  `TransactionTypeID` int(11) NOT NULL,
  `TransactionTypeName` varchar(50) NOT NULL,
  `LastEditedBy` int(11) NOT NULL,
  `ValidFrom` datetime NOT NULL,
  `ValidTo` datetime NOT NULL,
  PRIMARY KEY (`TransactionTypeID`),
  UNIQUE KEY `UQ_Application_TransactionTypes_TransactionTypeName` (`TransactionTypeName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactiontypes`
--

LOCK TABLES `transactiontypes` WRITE;
/*!40000 ALTER TABLE `transactiontypes` DISABLE KEYS */;
INSERT INTO `transactiontypes` VALUES (1,'Customer Invoice',1,'2013-01-01 00:00:00','9999-12-31 23:59:59'),(2,'Customer Credit Note',1,'2013-01-01 00:00:00','9999-12-31 23:59:59'),(3,'Customer Payment Received',1,'2013-01-01 00:00:00','9999-12-31 23:59:59'),(4,'Customer Refund',1,'2013-01-01 00:00:00','9999-12-31 23:59:59'),(5,'Supplier Invoice',1,'2013-01-01 00:00:00','9999-12-31 23:59:59'),(6,'Supplier Credit Note',1,'2013-01-01 00:00:00','9999-12-31 23:59:59'),(7,'Supplier Payment Issued',1,'2013-01-01 00:00:00','9999-12-31 23:59:59'),(8,'Supplier Refund',1,'2013-01-01 00:00:00','9999-12-31 23:59:59'),(9,'Stock Transfer',1,'2013-01-01 00:00:00','9999-12-31 23:59:59'),(10,'Stock Issue',1,'2013-01-01 00:00:00','9999-12-31 23:59:59'),(11,'Stock Receipt',1,'2013-01-01 00:00:00','9999-12-31 23:59:59'),(12,'Stock Adjustment at Stocktake',1,'2013-01-01 00:00:00','9999-12-31 23:59:59'),(13,'Customer Contra',9,'2016-01-01 16:05:00','9999-12-31 23:59:59');
/*!40000 ALTER TABLE `transactiontypes` ENABLE KEYS */;
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
