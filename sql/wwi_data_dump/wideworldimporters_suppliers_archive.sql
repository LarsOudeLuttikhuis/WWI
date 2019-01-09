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
-- Table structure for table `suppliers_archive`
--

DROP TABLE IF EXISTS `suppliers_archive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `suppliers_archive` (
  `SupplierID` int(11) NOT NULL,
  `SupplierName` varchar(100) NOT NULL,
  `SupplierCategoryID` int(11) NOT NULL,
  `PrimaryContactPersonID` int(11) NOT NULL,
  `AlternateContactPersonID` int(11) NOT NULL,
  `DeliveryMethodID` int(11) DEFAULT NULL,
  `DeliveryCityID` int(11) NOT NULL,
  `PostalCityID` int(11) NOT NULL,
  `SupplierReference` varchar(20) DEFAULT NULL,
  `BankAccountName` varchar(50) DEFAULT NULL,
  `BankAccountBranch` varchar(50) DEFAULT NULL,
  `BankAccountCode` varchar(20) DEFAULT NULL,
  `BankAccountNumber` varchar(20) DEFAULT NULL,
  `BankInternationalCode` varchar(20) DEFAULT NULL,
  `PaymentDays` int(11) NOT NULL,
  `InternalComments` longtext,
  `PhoneNumber` varchar(20) NOT NULL,
  `FaxNumber` varchar(20) NOT NULL,
  `WebsiteURL` varchar(256) NOT NULL,
  `DeliveryAddressLine1` varchar(60) NOT NULL,
  `DeliveryAddressLine2` varchar(60) DEFAULT NULL,
  `DeliveryPostalCode` varchar(10) NOT NULL,
  `DeliveryLocation` varchar(100) DEFAULT NULL,
  `PostalAddressLine1` varchar(60) NOT NULL,
  `PostalAddressLine2` varchar(60) DEFAULT NULL,
  `PostalPostalCode` varchar(10) NOT NULL,
  `LastEditedBy` int(11) NOT NULL,
  `ValidFrom` datetime NOT NULL,
  `ValidTo` datetime NOT NULL,
  KEY `ix_Suppliers_Archive` (`ValidFrom`,`ValidTo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suppliers_archive`
--

LOCK TABLES `suppliers_archive` WRITE;
/*!40000 ALTER TABLE `suppliers_archive` DISABLE KEYS */;
INSERT INTO `suppliers_archive` VALUES (1,'A Datum Corporation',2,21,22,7,38171,38171,'AA20384','A Datum Corporation','Woodgrove Bank Zionsville','356981','2147483647','25986',14,'','(847) 555-0100','(847) 555-0101','http://www.adatum.com','Suite 10','183838 Southwest Boulevard','46077','','PO Box 1039','Surrey','46077',1,'2013-01-01 00:00:00','2013-01-01 00:05:00'),(13,'Woodgrove Bank',7,45,46,0,30378,30378,'028034202','Woodgrove Bank','Woodgrove Bank San Francisco','325698','2147483647','65893',7,'Only speak to Donald if Hubert really is not available','(415) 555-0103','(415) 555-0107','http://www.woodgrovebank.com','Level 3','8488 Vienna Boulevard','94101','','PO Box 2390','Canterbury','94101',1,'2013-01-01 00:00:00','2013-01-01 00:05:00'),(3,'Consolidated Messenger',6,25,26,0,30378,30378,'209340283','Consolidated Messenger','Woodgrove Bank San Francisco','354269','2147483647','45698',30,'','(415) 555-0100','(415) 555-0101','http://www.consolidatedmessenger.com','','894 Market Day Street','94101','','PO Box 1014','West Mont','94101',1,'2013-01-01 00:00:00','2013-01-01 00:05:00'),(7,'Litware, Inc.',5,33,34,2,22602,22602,'BC0280982','Litware Inc','Woodgrove Bank Mokelumne Hill','358769','2147483647','21445',30,'','(209) 555-0108','(209) 555-0104','http://www.litwareinc.com','Level 3','19 Le Church Street','95245','','PO Box 20290','Jackson','95245',1,'2013-01-01 00:00:00','2013-01-01 00:05:00'),(6,'Humongous Insurance',9,31,32,0,18656,18656,'082420938','Humongous Insurance','Woodgrove Bank Lancing','325001','2147483647','32569',14,'','(423) 555-0105','(423) 555-0100','http://www.humongousinsurance.com','','9893 Mount Norris Road','37770','','PO Box 94829','Boxville','37770',1,'2013-01-01 00:00:00','2013-01-01 00:05:00'),(5,'Graphic Design Institute',2,29,30,10,18634,18634,'08803922','Graphic Design Institute','Woodgrove Bank Lanagan','563215','1025869354','32587',14,'','(406) 555-0105','(406) 555-0106','http://www.graphicdesigninstitute.com','','45th Street','64847','','PO Box 393','Willow','64847',1,'2013-01-01 00:00:00','2013-01-01 00:05:00'),(4,'Fabrikam, Inc.',4,27,28,7,18557,18557,'293092','Fabrikam Inc','Woodgrove Bank Lakeview Heights','789568','2147483647','12546',30,'','(203) 555-0104','(203) 555-0108','http://www.fabrikam.com','Level 2','393999 Woodberg Road','40351','','PO Box 301','Eaglemont','40351',1,'2013-01-01 00:00:00','2013-01-01 00:05:00'),(12,'The Phone Company',2,43,44,7,17346,17346,'237408032','The Phone Company','Woodgrove Bank Karlstad','214568','2147483647','25478',30,'','(218) 555-0105','(218) 555-0105','http://www.thephone-company.com','Level 83','339 Toorak Road','56732','','PO Box 3837','Ferny Wood','56732',1,'2013-01-01 00:00:00','2013-01-01 00:05:00'),(11,'Trey Research',8,41,42,0,17277,17277,'082304822','Trey Research','Woodgrove Bank Kadoka','658968','1254785321','56958',7,'','(605) 555-0103','(605) 555-0101','http://www.treyresearch.net','Level 43','9401 Polar Avenue','57543','','PO  Box 595','Port Fairy','57543',1,'2013-01-01 00:00:00','2013-01-01 00:05:00'),(8,'Lucerne Publishing',2,35,36,10,17161,17161,'JQ082304802','Lucerne Publishing','Woodgrove Bank Jonesborough','654789','2147483647','21569',30,'','(423) 555-0103','(423) 555-0105','http://www.lucernepublishing.com','Suite 34','949482 Miller Boulevard','37659','','PO Box 8747','Westerfold','37659',1,'2013-01-01 00:00:00','2013-01-01 00:05:00'),(2,'Contoso, Ltd.',2,23,24,9,13870,13870,'B2084020','Contoso Ltd','Woodgrove Bank Greenbank','358698','2147483647','25868',7,'','(360) 555-0100','(360) 555-0101','http://www.contoso.com','Unit 2','2934 Night Road','98253','','PO Box 1012','Jolimont','98253',1,'2013-01-01 00:00:00','2013-01-01 00:05:00'),(9,'Nod Publishers',2,37,38,10,10346,10346,'GL08029802','Nod Publishers','Woodgrove Bank Elizabeth City','365985','2021545878','48758',7,'Marcos is not in on Mondays','(252) 555-0100','(252) 555-0101','http://www.nodpublishers.com','Level 1','389 King Street','27906','','PO Box 3390','Anderson','27906',1,'2013-01-01 00:00:00','2013-01-01 00:05:00'),(10,'Northwind Electric Cars',3,39,40,8,7899,7899,'ML0300202','Northwind Electric Cars','Woodgrove Bank Crandon Lakes','325447','2147483647','36214',30,'','(201) 555-0105','(201) 555-0104','http://www.northwindelectriccars.com','','440 New Road','7860','','PO Box 30920','Arlington','7860',1,'2013-01-01 00:00:00','2013-01-01 00:05:00');
/*!40000 ALTER TABLE `suppliers_archive` ENABLE KEYS */;
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
