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
-- Table structure for table `specialdeals`
--

DROP TABLE IF EXISTS `specialdeals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `specialdeals` (
  `SpecialDealID` int(11) NOT NULL,
  `StockItemID` int(11) DEFAULT NULL,
  `CustomerID` int(11) DEFAULT NULL,
  `BuyingGroupID` int(11) DEFAULT NULL,
  `CustomerCategoryID` int(11) DEFAULT NULL,
  `StockGroupID` int(11) DEFAULT NULL,
  `DealDescription` varchar(30) NOT NULL,
  `StartDate` date NOT NULL,
  `EndDate` date NOT NULL,
  `DiscountAmount` decimal(18,2) DEFAULT NULL,
  `DiscountPercentage` decimal(18,3) DEFAULT NULL,
  `UnitPrice` decimal(18,2) DEFAULT NULL,
  `LastEditedBy` int(11) NOT NULL,
  `LastEditedWhen` datetime NOT NULL,
  PRIMARY KEY (`SpecialDealID`),
  KEY `FK_Sales_SpecialDeals_StockItemID` (`StockItemID`),
  KEY `FK_Sales_SpecialDeals_CustomerID` (`CustomerID`),
  KEY `FK_Sales_SpecialDeals_BuyingGroupID` (`BuyingGroupID`),
  KEY `FK_Sales_SpecialDeals_CustomerCategoryID` (`CustomerCategoryID`),
  KEY `FK_Sales_SpecialDeals_StockGroupID` (`StockGroupID`),
  KEY `FK_Sales_SpecialDeals_Application_People` (`LastEditedBy`),
  CONSTRAINT `FK_Sales_SpecialDeals_Application_People` FOREIGN KEY (`LastEditedBy`) REFERENCES `people` (`PersonID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Sales_SpecialDeals_BuyingGroupID_Sales_BuyingGroups` FOREIGN KEY (`BuyingGroupID`) REFERENCES `buyinggroups` (`BuyingGroupID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Sales_SpecialDeals_CustomerCategoryID_Sales_CustomerCategor16` FOREIGN KEY (`CustomerCategoryID`) REFERENCES `customercategories` (`CustomerCategoryID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Sales_SpecialDeals_CustomerID_Sales_Customers` FOREIGN KEY (`CustomerID`) REFERENCES `customers` (`CustomerID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Sales_SpecialDeals_StockGroupID_Warehouse_StockGroups` FOREIGN KEY (`StockGroupID`) REFERENCES `stockgroups` (`StockGroupID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Sales_SpecialDeals_StockItemID_Warehouse_StockItems` FOREIGN KEY (`StockItemID`) REFERENCES `stockitems` (`StockItemID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `specialdeals`
--

LOCK TABLES `specialdeals` WRITE;
/*!40000 ALTER TABLE `specialdeals` DISABLE KEYS */;
INSERT INTO `specialdeals` VALUES (1,0,0,2,0,7,'10% 1st qtr USB Wingtip','2016-01-01','2016-03-31',0.00,10.000,0.00,2,'2015-12-31 16:00:00'),(2,0,0,1,0,7,'15% 2nd qtr USB Tailspin','2016-04-01','2016-06-30',0.00,15.000,0.00,2,'2015-12-31 16:00:00');
/*!40000 ALTER TABLE `specialdeals` ENABLE KEYS */;
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
