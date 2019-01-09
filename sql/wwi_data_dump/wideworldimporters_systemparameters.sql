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
-- Table structure for table `systemparameters`
--

DROP TABLE IF EXISTS `systemparameters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `systemparameters` (
  `SystemParameterID` int(11) NOT NULL,
  `DeliveryAddressLine1` varchar(60) NOT NULL,
  `DeliveryAddressLine2` varchar(60) DEFAULT NULL,
  `DeliveryCityID` int(11) NOT NULL,
  `DeliveryPostalCode` varchar(10) NOT NULL,
  `DeliveryLocation` varchar(100) NOT NULL,
  `PostalAddressLine1` varchar(60) NOT NULL,
  `PostalAddressLine2` varchar(60) DEFAULT NULL,
  `PostalCityID` int(11) NOT NULL,
  `PostalPostalCode` varchar(10) NOT NULL,
  `ApplicationSettings` longtext NOT NULL,
  `LastEditedBy` int(11) NOT NULL,
  `LastEditedWhen` datetime NOT NULL,
  PRIMARY KEY (`SystemParameterID`),
  KEY `FK_Application_SystemParameters_DeliveryCityID` (`DeliveryCityID`),
  KEY `FK_Application_SystemParameters_PostalCityID` (`PostalCityID`),
  CONSTRAINT `FK_Application_SystemParameters_DeliveryCityID_Application_Cit1` FOREIGN KEY (`DeliveryCityID`) REFERENCES `cities` (`CityID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Application_SystemParameters_PostalCityID_Application_Cities` FOREIGN KEY (`PostalCityID`) REFERENCES `cities` (`CityID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `systemparameters`
--

LOCK TABLES `systemparameters` WRITE;
/*!40000 ALTER TABLE `systemparameters` DISABLE KEYS */;
INSERT INTO `systemparameters` VALUES (1,'Suite 14','1968 Martin Luther King Junior Drive',30378,'94129','E6100000010C09DE904605E24240C617EDF142A05EC0','PO Box 201158','Golden Gate Park',30378,'94129','{\r\n	\"Site\": {\r\n		\"SEO\": {\r\n			\"Title\": \"WWI | Site\",\r\n			\"Description\": \"Wide World Importers - Site\",\r\n			\"StockItemTitleTemplate\": \"WWI | Site | StockItem {0}\",\r\n			\"StockItemDescrTemplate\": \"StockItem {0} ({1}})\"\r\n		},\r\n		\"Menu\": {\r\n			\"Home\": {\r\n				\"Url\": \"/\",\r\n				\"Alt\": \"Home\"\r\n			},\r\n			\"StockItems\": {\r\n				\"Url\": \"/stockitem\",\r\n				\"Alt\": \"Stock item search\"\r\n			},\r\n			\"Brands\": {\r\n				\"Url\": \"/brand\",\r\n				\"Alt\": \"Supplier listing\"\r\n			},\r\n			\"Contact\": {\r\n				\"Url\": \"/contact-us\",\r\n				\"Alt\": \"Contact\",\r\n				\"email\": \"jane@wideworldimporters.com\"\r\n			}\r\n		},\r\n		\"CSSTheme\": \"bootstrap-stockitems\",\r\n		\"Home\": {\r\n			\"Message\": \"New StockItems from Wide World Importers\",\r\n			\"PromoCategories\": [\"Gadgets\", \"Toys\"],\r\n			\"PromoCount\": 5,\r\n			\"NewStockItemsCount\": 5,\r\n			\"HotStockItemsCount\": 5\r\n		},\r\n		\"SearchResults\": {\r\n			\"SeoTitleTemplate\": \"WWI | Site | {0} | {1}\",\r\n			\"SeoDescrTemplate\": \"Wide World Importers | Stock Items {0} ({1}})\",\r\n			\"FacetCount\": 3\r\n		}\r\n	},\r\n	\"Customer\": {\r\n		\"SEO\": {\r\n			\"Title\": \"WWI | Customer Portal\",\r\n			\"Description\": \"Wide World Importers - Customer Site\",\r\n			\"StockItemTitleTemplate\": \"WWI | CustomerPortal | StockItem {0}\"\r\n		},\r\n		\"CSSTheme\": \"bootstrap-admin\",\r\n		\"Dashboard\": {\r\n			\"PromoCategories\": \"\",\r\n			\"PromoCount\": 5,\r\n            \"NewStockItemsCount\": 5\r\n		}\r\n	},\r\n	\"Supplier\": {\r\n		\"SEO\": {\r\n			\"Title\": \"WWI | Supplier Portal\"\r\n		},\r\n		\"CSSTheme\": \"bootstrap-admin\",\r\n		\"Dashboard\": {\r\n			\"StockItemsPerPage\": 10,\r\n			\"QuotesPerPage\": 25\r\n		},\r\n		\"Reports\": {\r\n			\"Top\": true,\r\n			\"ThisMonthSale\": true\r\n		}\r\n	},\r\n	\"\": {\r\n		\"SEO\": {\r\n			\"Title\": \"WWI | Administration\",\r\n			\"Description\": \"WorldWideImporters - Site\",\r\n			\"StockItemTitleTemplate\": \"WWI | Site | StockItem {0}\"\r\n		},\r\n		\"CSSTheme\": \"bootstrap-admin\"\r\n	},\r\n	\"Logging\": {\r\n		\"configuration\": {\r\n			\"status\": \"error\",\r\n			\"name\": \"RoutingTest\",\r\n			\"packages\": \"org.apache.logging.log4j.test\",\r\n			\"properties\": {\r\n				\"property\": {\r\n					\"name\": \"filename\",\r\n					\"value\": \"target/rolling1/rollingtest-$${sd:type}.log\"\r\n				}\r\n			},\r\n			\"ThresholdFilter\": {\r\n				\"level\": \"debug\"\r\n			},\r\n			\"appenders\": {\r\n				\"Console\": {\r\n					\"name\": \"STDOUT\",\r\n					\"PatternLayout\": {\r\n						\"pattern\": \"%m%n\"\r\n					}\r\n				},\r\n				\"List\": {\r\n					\"name\": \"List\",\r\n					\"ThresholdFilter\": {\r\n						\"level\": \"debug\"\r\n					}\r\n				},\r\n				\"Routing\": {\r\n					\"name\": \"Routing\",\r\n					\"Routes\": {\r\n						\"pattern\": \"$${sd:type}\",\r\n						\"Route\": [{\r\n							\"RollingFile\": {\r\n								\"name\": \"Rolling-${sd:type}\",\r\n								\"fileName\": \"${filename}\",\r\n								\"filePattern\": \"target/rolling1/test1-${sd:type}.%i.log.gz\",\r\n								\"PatternLayout\": {\r\n									\"pattern\": \"%d %p %c{1.} [%t] %m%n\"\r\n								},\r\n								\"SizeBasedTriggeringPolicy\": {\r\n									\"size\": \"500\"\r\n								}\r\n							}\r\n						}, {\r\n							\"AppenderRef\": \"STDOUT\",\r\n							\"key\": \"Audit\"\r\n						}, {\r\n							\"AppenderRef\": \"List\",\r\n							\"key\": \"Service\"\r\n						}]\r\n					}\r\n				}\r\n			},\r\n			\"loggers\": {\r\n				\"logger\": {\r\n					\"name\": \"EventLogger\",\r\n					\"level\": \"info\",\r\n					\"additivity\": \"false\",\r\n					\"AppenderRef\": {\r\n						\"ref\": \"Routing\"\r\n					}\r\n				},\r\n				\"root\": {\r\n					\"level\": \"error\",\r\n					\"AppenderRef\": {\r\n						\"ref\": \"STDOUT\"\r\n					}\r\n				}\r\n			}\r\n		}\r\n	}\r\n}',1,'2013-01-01 00:00:00');
/*!40000 ALTER TABLE `systemparameters` ENABLE KEYS */;
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
