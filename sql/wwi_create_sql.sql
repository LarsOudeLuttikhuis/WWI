-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema wideworldimporters
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema wideworldimporters
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `wideworldimporters` DEFAULT CHARACTER SET latin1 ;
USE `wideworldimporters` ;

-- -----------------------------------------------------
-- Table `wideworldimporters`.`people`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wideworldimporters`.`people` (
  `PersonID` INT(11) NOT NULL DEFAULT '0',
  `FullName` VARCHAR(50) NULL DEFAULT NULL,
  `PreferredName` VARCHAR(50) NULL DEFAULT NULL,
  `SearchName` VARCHAR(101) NULL DEFAULT NULL,
  `IsPermittedToLogon` TINYINT(1) NULL DEFAULT NULL,
  `LogonName` VARCHAR(50) NULL DEFAULT NULL,
  `IsExternalLogonProvider` TINYINT(1) NULL DEFAULT NULL,
  `HashedPassword` VARCHAR(254) NULL DEFAULT NULL,
  `IsSystemUser` TINYINT(1) NULL DEFAULT NULL,
  `IsEmployee` TINYINT(1) NULL DEFAULT NULL,
  `IsSalesperson` TINYINT(1) NULL DEFAULT NULL,
  `UserPreferences` LONGTEXT NULL DEFAULT NULL,
  `PhoneNumber` VARCHAR(20) NULL DEFAULT NULL,
  `FaxNumber` VARCHAR(20) NULL DEFAULT NULL,
  `EmailAddress` VARCHAR(256) NULL DEFAULT NULL,
  `Photo` LONGBLOB NULL DEFAULT NULL,
  `CustomFields` LONGTEXT NULL DEFAULT NULL,
  `OtherLanguages` LONGTEXT NULL DEFAULT NULL,
  `LastEditedBy` INT(11) NULL DEFAULT NULL,
  `ValidFrom` DATETIME NULL DEFAULT NULL,
  `ValidTo` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`PersonID`),
  INDEX `IX_Application_People_IsEmployee` (`IsEmployee` ASC),
  INDEX `IX_Application_People_IsSalesperson` (`IsSalesperson` ASC),
  INDEX `IX_Application_People_FullName` (`FullName` ASC),
  INDEX `IX_Application_People_Perf_20160301_05` (`IsPermittedToLogon` ASC, `PersonID` ASC, `FullName` ASC, `EmailAddress`(255) ASC),
  INDEX `FK_Application_People_Application_People` (`LastEditedBy` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `wideworldimporters`.`buyinggroups`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wideworldimporters`.`buyinggroups` (
  `BuyingGroupID` INT(11) NOT NULL,
  `BuyingGroupName` VARCHAR(50) NOT NULL,
  `LastEditedBy` INT(11) NOT NULL,
  `ValidFrom` DATETIME NOT NULL,
  `ValidTo` DATETIME NOT NULL,
  PRIMARY KEY (`BuyingGroupID`),
  UNIQUE INDEX `UQ_Sales_BuyingGroups_BuyingGroupName` (`BuyingGroupName` ASC),
  INDEX `FK_Sales_BuyingGroups_Application_People` (`LastEditedBy` ASC),
  CONSTRAINT `FK_Sales_BuyingGroups_Application_People`
    FOREIGN KEY (`LastEditedBy`)
    REFERENCES `wideworldimporters`.`people` (`PersonID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `wideworldimporters`.`buyinggroups_archive`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wideworldimporters`.`buyinggroups_archive` (
  `BuyingGroupID` INT(11) NOT NULL,
  `BuyingGroupName` VARCHAR(50) NOT NULL,
  `LastEditedBy` INT(11) NOT NULL,
  `ValidFrom` DATETIME NOT NULL,
  `ValidTo` DATETIME NOT NULL,
  INDEX `ix_BuyingGroups_Archive` (`ValidFrom` ASC, `ValidTo` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `wideworldimporters`.`countries`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wideworldimporters`.`countries` (
  `CountryID` INT(11) NOT NULL,
  `CountryName` VARCHAR(60) NOT NULL,
  `FormalName` VARCHAR(60) NOT NULL,
  `IsoAlpha3Code` VARCHAR(3) NULL DEFAULT NULL,
  `IsoNumericCode` INT(11) NULL DEFAULT NULL,
  `CountryType` VARCHAR(20) NULL DEFAULT NULL,
  `LatestRecordedPopulation` BIGINT(20) NULL DEFAULT NULL,
  `Continent` VARCHAR(30) NOT NULL,
  `Region` VARCHAR(30) NOT NULL,
  `Subregion` VARCHAR(30) NOT NULL,
  `Border` VARCHAR(100) NULL DEFAULT NULL,
  `LastEditedBy` INT(11) NOT NULL,
  `ValidFrom` DATETIME NOT NULL,
  `ValidTo` DATETIME NOT NULL,
  PRIMARY KEY (`CountryID`),
  UNIQUE INDEX `UQ_Application_Countries_FormalName` (`FormalName` ASC),
  UNIQUE INDEX `UQ_Application_Countries_CountryName` (`CountryName` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `wideworldimporters`.`stateprovinces`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wideworldimporters`.`stateprovinces` (
  `StateProvinceID` INT(11) NOT NULL,
  `StateProvinceCode` VARCHAR(5) NOT NULL,
  `StateProvinceName` VARCHAR(50) NOT NULL,
  `CountryID` INT(11) NOT NULL,
  `SalesTerritory` VARCHAR(50) NOT NULL,
  `Border` VARCHAR(100) NULL DEFAULT NULL,
  `LatestRecordedPopulation` BIGINT(20) NULL DEFAULT NULL,
  `LastEditedBy` INT(11) NOT NULL,
  `ValidFrom` DATETIME NOT NULL,
  `ValidTo` DATETIME NOT NULL,
  PRIMARY KEY (`StateProvinceID`),
  UNIQUE INDEX `UQ_Application_StateProvinces_StateProvinceName` (`StateProvinceName` ASC),
  INDEX `FK_Application_StateProvinces_CountryID` (`CountryID` ASC),
  INDEX `IX_Application_StateProvinces_SalesTerritory` (`SalesTerritory` ASC),
  CONSTRAINT `FK_Application_StateProvinces_CountryID_Application_Countries`
    FOREIGN KEY (`CountryID`)
    REFERENCES `wideworldimporters`.`countries` (`CountryID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `wideworldimporters`.`cities`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wideworldimporters`.`cities` (
  `CityID` INT(11) NOT NULL,
  `CityName` VARCHAR(50) NOT NULL,
  `StateProvinceID` INT(11) NOT NULL,
  `Location` VARCHAR(100) NULL DEFAULT NULL,
  `LatestRecordedPopulation` BIGINT(20) NULL DEFAULT NULL,
  `LastEditedBy` INT(11) NOT NULL,
  `ValidFrom` DATETIME NOT NULL,
  `ValidTo` DATETIME NOT NULL,
  PRIMARY KEY (`CityID`),
  INDEX `FK_Application_Cities_StateProvinceID` (`StateProvinceID` ASC),
  CONSTRAINT `FK_Application_Cities_StateProvinceID_Application_StateProvinces`
    FOREIGN KEY (`StateProvinceID`)
    REFERENCES `wideworldimporters`.`stateprovinces` (`StateProvinceID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `wideworldimporters`.`cities_archive`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wideworldimporters`.`cities_archive` (
  `CityID` INT(11) NOT NULL,
  `CityName` VARCHAR(50) NOT NULL,
  `StateProvinceID` INT(11) NOT NULL,
  `Location` VARCHAR(100) NULL DEFAULT NULL,
  `LatestRecordedPopulation` BIGINT(20) NULL DEFAULT NULL,
  `LastEditedBy` INT(11) NOT NULL,
  `ValidFrom` DATETIME NOT NULL,
  `ValidTo` DATETIME NOT NULL,
  INDEX `ix_Cities_Archive` (`ValidFrom` ASC, `ValidTo` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `wideworldimporters`.`coldroomtemperatures`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wideworldimporters`.`coldroomtemperatures` (
  `ColdRoomTemperatureID` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `ColdRoomSensorNumber` INT(11) NOT NULL,
  `RecordedWhen` DATETIME NOT NULL,
  `Temperature` DECIMAL(10,2) NOT NULL,
  `ValidFrom` DATETIME NOT NULL,
  `ValidTo` DATETIME NOT NULL,
  PRIMARY KEY (`ColdRoomTemperatureID`),
  INDEX `IX_Warehouse_ColdRoomTemperatures_ColdRoomSensorNumber` (`ColdRoomSensorNumber` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 3654741
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `wideworldimporters`.`coldroomtemperatures_archive`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wideworldimporters`.`coldroomtemperatures_archive` (
  `ColdRoomTemperatureID` BIGINT(20) NOT NULL,
  `ColdRoomSensorNumber` INT(11) NOT NULL,
  `RecordedWhen` DATETIME NOT NULL,
  `Temperature` DECIMAL(10,2) NOT NULL,
  `ValidFrom` DATETIME NOT NULL,
  `ValidTo` DATETIME NOT NULL,
  INDEX `ix_ColdRoomTemperatures_Archive` (`ValidFrom` ASC, `ValidTo` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `wideworldimporters`.`colors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wideworldimporters`.`colors` (
  `ColorID` INT(11) NOT NULL,
  `ColorName` VARCHAR(20) NOT NULL,
  `LastEditedBy` INT(11) NOT NULL,
  `ValidFrom` DATETIME NOT NULL,
  `ValidTo` DATETIME NOT NULL,
  PRIMARY KEY (`ColorID`),
  UNIQUE INDEX `UQ_Warehouse_Colors_ColorName` (`ColorName` ASC),
  INDEX `FK_Warehouse_Colors_Application_People` (`LastEditedBy` ASC),
  CONSTRAINT `FK_Warehouse_Colors_Application_People`
    FOREIGN KEY (`LastEditedBy`)
    REFERENCES `wideworldimporters`.`people` (`PersonID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `wideworldimporters`.`colors_archive`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wideworldimporters`.`colors_archive` (
  `ColorID` INT(11) NOT NULL,
  `ColorName` VARCHAR(20) NOT NULL,
  `LastEditedBy` INT(11) NOT NULL,
  `ValidFrom` DATETIME NOT NULL,
  `ValidTo` DATETIME NOT NULL,
  INDEX `ix_Colors_Archive` (`ValidFrom` ASC, `ValidTo` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `wideworldimporters`.`countries_archive`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wideworldimporters`.`countries_archive` (
  `CountryID` INT(11) NOT NULL,
  `CountryName` VARCHAR(60) NOT NULL,
  `FormalName` VARCHAR(60) NOT NULL,
  `IsoAlpha3Code` VARCHAR(3) NULL DEFAULT NULL,
  `IsoNumericCode` INT(11) NULL DEFAULT NULL,
  `CountryType` VARCHAR(20) NULL DEFAULT NULL,
  `LatestRecordedPopulation` BIGINT(20) NULL DEFAULT NULL,
  `Continent` VARCHAR(30) NOT NULL,
  `Region` VARCHAR(30) NOT NULL,
  `Subregion` VARCHAR(30) NOT NULL,
  `Border` VARCHAR(100) NULL DEFAULT NULL,
  `LastEditedBy` INT(11) NOT NULL,
  `ValidFrom` DATETIME NOT NULL,
  `ValidTo` DATETIME NOT NULL,
  INDEX `ix_Countries_Archive` (`ValidFrom` ASC, `ValidTo` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `wideworldimporters`.`customercategories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wideworldimporters`.`customercategories` (
  `CustomerCategoryID` INT(11) NOT NULL,
  `CustomerCategoryName` VARCHAR(50) NOT NULL,
  `LastEditedBy` INT(11) NOT NULL,
  `ValidFrom` DATETIME NOT NULL,
  `ValidTo` DATETIME NOT NULL,
  PRIMARY KEY (`CustomerCategoryID`),
  UNIQUE INDEX `UQ_Sales_CustomerCategories_CustomerCategoryName` (`CustomerCategoryName` ASC),
  INDEX `FK_Sales_CustomerCategories_Application_People` (`LastEditedBy` ASC),
  CONSTRAINT `FK_Sales_CustomerCategories_Application_People`
    FOREIGN KEY (`LastEditedBy`)
    REFERENCES `wideworldimporters`.`people` (`PersonID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `wideworldimporters`.`customercategories_archive`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wideworldimporters`.`customercategories_archive` (
  `CustomerCategoryID` INT(11) NOT NULL,
  `CustomerCategoryName` VARCHAR(50) NOT NULL,
  `LastEditedBy` INT(11) NOT NULL,
  `ValidFrom` DATETIME NOT NULL,
  `ValidTo` DATETIME NOT NULL,
  INDEX `ix_CustomerCategories_Archive` (`ValidFrom` ASC, `ValidTo` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `wideworldimporters`.`deliverymethods`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wideworldimporters`.`deliverymethods` (
  `DeliveryMethodID` INT(11) NOT NULL,
  `DeliveryMethodName` VARCHAR(50) NOT NULL,
  `LastEditedBy` INT(11) NOT NULL,
  `ValidFrom` DATETIME NOT NULL,
  `ValidTo` DATETIME NOT NULL,
  PRIMARY KEY (`DeliveryMethodID`),
  UNIQUE INDEX `UQ_Application_DeliveryMethods_DeliveryMethodName` (`DeliveryMethodName` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `wideworldimporters`.`customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wideworldimporters`.`customers` (
  `CustomerID` INT(11) NOT NULL,
  `CustomerName` VARCHAR(100) NOT NULL,
  `BillToCustomerID` INT(11) NOT NULL,
  `CustomerCategoryID` INT(11) NOT NULL,
  `BuyingGroupID` INT(11) NULL DEFAULT NULL,
  `PrimaryContactPersonID` INT(11) NOT NULL,
  `AlternateContactPersonID` INT(11) NULL DEFAULT NULL,
  `DeliveryMethodID` INT(11) NOT NULL,
  `DeliveryCityID` INT(11) NOT NULL,
  `PostalCityID` INT(11) NOT NULL,
  `CreditLimit` DECIMAL(18,2) NULL DEFAULT NULL,
  `AccountOpenedDate` DATE NOT NULL,
  `StandardDiscountPercentage` DECIMAL(18,3) NOT NULL,
  `IsStatementSent` TINYINT(1) NOT NULL,
  `IsOnCreditHold` TINYINT(1) NOT NULL,
  `PaymentDays` INT(11) NOT NULL,
  `PhoneNumber` VARCHAR(20) NOT NULL,
  `FaxNumber` VARCHAR(20) NOT NULL,
  `DeliveryRun` VARCHAR(5) NULL DEFAULT NULL,
  `RunPosition` VARCHAR(5) NULL DEFAULT NULL,
  `WebsiteURL` VARCHAR(256) NOT NULL,
  `DeliveryAddressLine1` VARCHAR(60) NOT NULL,
  `DeliveryAddressLine2` VARCHAR(60) NULL DEFAULT NULL,
  `DeliveryPostalCode` VARCHAR(10) NOT NULL,
  `DeliveryLocation` VARCHAR(100) NULL DEFAULT NULL,
  `PostalAddressLine1` VARCHAR(60) NOT NULL,
  `PostalAddressLine2` VARCHAR(60) NULL DEFAULT NULL,
  `PostalPostalCode` VARCHAR(10) NOT NULL,
  `LastEditedBy` INT(11) NOT NULL,
  `ValidFrom` DATETIME NOT NULL,
  `ValidTo` DATETIME NOT NULL,
  PRIMARY KEY (`CustomerID`),
  UNIQUE INDEX `UQ_Sales_Customers_CustomerName` (`CustomerName` ASC),
  INDEX `FK_Sales_Customers_CustomerCategoryID` (`CustomerCategoryID` ASC),
  INDEX `FK_Sales_Customers_BuyingGroupID` (`BuyingGroupID` ASC),
  INDEX `FK_Sales_Customers_PrimaryContactPersonID` (`PrimaryContactPersonID` ASC),
  INDEX `FK_Sales_Customers_AlternateContactPersonID` (`AlternateContactPersonID` ASC),
  INDEX `FK_Sales_Customers_DeliveryMethodID` (`DeliveryMethodID` ASC),
  INDEX `FK_Sales_Customers_DeliveryCityID` (`DeliveryCityID` ASC),
  INDEX `FK_Sales_Customers_PostalCityID` (`PostalCityID` ASC),
  INDEX `IX_Sales_Customers_Perf_20160301_06` (`IsOnCreditHold` ASC, `CustomerID` ASC, `BillToCustomerID` ASC, `PrimaryContactPersonID` ASC),
  INDEX `FK_Sales_Customers_BillToCustomerID_Sales_Customers` (`BillToCustomerID` ASC),
  INDEX `FK_Sales_Customers_Application_People` (`LastEditedBy` ASC),
  CONSTRAINT `FK_Sales_Customers_AlternateContactPersonID_Application_People`
    FOREIGN KEY (`AlternateContactPersonID`)
    REFERENCES `wideworldimporters`.`people` (`PersonID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Sales_Customers_Application_People`
    FOREIGN KEY (`LastEditedBy`)
    REFERENCES `wideworldimporters`.`people` (`PersonID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Sales_Customers_BillToCustomerID_Sales_Customers`
    FOREIGN KEY (`BillToCustomerID`)
    REFERENCES `wideworldimporters`.`customers` (`CustomerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Sales_Customers_BuyingGroupID_Sales_BuyingGroups`
    FOREIGN KEY (`BuyingGroupID`)
    REFERENCES `wideworldimporters`.`buyinggroups` (`BuyingGroupID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Sales_Customers_CustomerCategoryID_Sales_CustomerCategories`
    FOREIGN KEY (`CustomerCategoryID`)
    REFERENCES `wideworldimporters`.`customercategories` (`CustomerCategoryID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Sales_Customers_DeliveryCityID_Application_Cities`
    FOREIGN KEY (`DeliveryCityID`)
    REFERENCES `wideworldimporters`.`cities` (`CityID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Sales_Customers_DeliveryMethodID_Application_DeliveryMethods`
    FOREIGN KEY (`DeliveryMethodID`)
    REFERENCES `wideworldimporters`.`deliverymethods` (`DeliveryMethodID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Sales_Customers_PostalCityID_Application_Cities`
    FOREIGN KEY (`PostalCityID`)
    REFERENCES `wideworldimporters`.`cities` (`CityID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Sales_Customers_PrimaryContactPersonID_Application_People`
    FOREIGN KEY (`PrimaryContactPersonID`)
    REFERENCES `wideworldimporters`.`people` (`PersonID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `wideworldimporters`.`customers_archive`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wideworldimporters`.`customers_archive` (
  `CustomerID` INT(11) NOT NULL,
  `CustomerName` VARCHAR(100) NOT NULL,
  `BillToCustomerID` INT(11) NOT NULL,
  `CustomerCategoryID` INT(11) NOT NULL,
  `BuyingGroupID` INT(11) NULL DEFAULT NULL,
  `PrimaryContactPersonID` INT(11) NOT NULL,
  `AlternateContactPersonID` INT(11) NULL DEFAULT NULL,
  `DeliveryMethodID` INT(11) NOT NULL,
  `DeliveryCityID` INT(11) NOT NULL,
  `PostalCityID` INT(11) NOT NULL,
  `CreditLimit` DECIMAL(18,2) NULL DEFAULT NULL,
  `AccountOpenedDate` DATE NOT NULL,
  `StandardDiscountPercentage` DECIMAL(18,3) NOT NULL,
  `IsStatementSent` TINYINT(1) NOT NULL,
  `IsOnCreditHold` TINYINT(1) NOT NULL,
  `PaymentDays` INT(11) NOT NULL,
  `PhoneNumber` VARCHAR(20) NOT NULL,
  `FaxNumber` VARCHAR(20) NOT NULL,
  `DeliveryRun` VARCHAR(5) NULL DEFAULT NULL,
  `RunPosition` VARCHAR(5) NULL DEFAULT NULL,
  `WebsiteURL` VARCHAR(256) NOT NULL,
  `DeliveryAddressLine1` VARCHAR(60) NOT NULL,
  `DeliveryAddressLine2` VARCHAR(60) NULL DEFAULT NULL,
  `DeliveryPostalCode` VARCHAR(10) NOT NULL,
  `DeliveryLocation` VARCHAR(100) NULL DEFAULT NULL,
  `PostalAddressLine1` VARCHAR(60) NOT NULL,
  `PostalAddressLine2` VARCHAR(60) NULL DEFAULT NULL,
  `PostalPostalCode` VARCHAR(10) NOT NULL,
  `LastEditedBy` INT(11) NOT NULL,
  `ValidFrom` DATETIME NOT NULL,
  `ValidTo` DATETIME NOT NULL,
  INDEX `ix_Customers_Archive` (`ValidFrom` ASC, `ValidTo` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `wideworldimporters`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wideworldimporters`.`orders` (
  `OrderID` INT(11) NOT NULL,
  `CustomerID` INT(11) NOT NULL,
  `SalespersonPersonID` INT(11) NOT NULL,
  `PickedByPersonID` INT(11) NULL DEFAULT NULL,
  `ContactPersonID` INT(11) NOT NULL,
  `BackorderOrderID` INT(11) NULL DEFAULT NULL,
  `OrderDate` DATE NOT NULL,
  `ExpectedDeliveryDate` DATE NOT NULL,
  `CustomerPurchaseOrderNumber` VARCHAR(20) NULL DEFAULT NULL,
  `IsUndersupplyBackordered` TINYINT(1) NOT NULL,
  `Comments` LONGTEXT NULL DEFAULT NULL,
  `DeliveryInstructions` LONGTEXT NULL DEFAULT NULL,
  `InternalComments` LONGTEXT NULL DEFAULT NULL,
  `PickingCompletedWhen` DATETIME NULL DEFAULT NULL,
  `LastEditedBy` INT(11) NOT NULL,
  `LastEditedWhen` DATETIME NOT NULL,
  PRIMARY KEY (`OrderID`),
  INDEX `FK_Sales_Orders_CustomerID` (`CustomerID` ASC),
  INDEX `FK_Sales_Orders_SalespersonPersonID` (`SalespersonPersonID` ASC),
  INDEX `FK_Sales_Orders_PickedByPersonID` (`PickedByPersonID` ASC),
  INDEX `FK_Sales_Orders_ContactPersonID` (`ContactPersonID` ASC),
  INDEX `FK_Sales_Orders_BackorderOrderID_Sales_Orders` (`BackorderOrderID` ASC),
  INDEX `FK_Sales_Orders_Application_People` (`LastEditedBy` ASC),
  CONSTRAINT `FK_Sales_Orders_Application_People`
    FOREIGN KEY (`LastEditedBy`)
    REFERENCES `wideworldimporters`.`people` (`PersonID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Sales_Orders_BackorderOrderID_Sales_Orders`
    FOREIGN KEY (`BackorderOrderID`)
    REFERENCES `wideworldimporters`.`orders` (`OrderID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Sales_Orders_ContactPersonID_Application_People`
    FOREIGN KEY (`ContactPersonID`)
    REFERENCES `wideworldimporters`.`people` (`PersonID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Sales_Orders_CustomerID_Sales_Customers`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `wideworldimporters`.`customers` (`CustomerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Sales_Orders_PickedByPersonID_Application_People`
    FOREIGN KEY (`PickedByPersonID`)
    REFERENCES `wideworldimporters`.`people` (`PersonID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Sales_Orders_SalespersonPersonID_Application_People`
    FOREIGN KEY (`SalespersonPersonID`)
    REFERENCES `wideworldimporters`.`people` (`PersonID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `wideworldimporters`.`invoices`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wideworldimporters`.`invoices` (
  `InvoiceID` INT(11) NOT NULL,
  `CustomerID` INT(11) NOT NULL,
  `BillToCustomerID` INT(11) NOT NULL,
  `OrderID` INT(11) NULL DEFAULT NULL,
  `DeliveryMethodID` INT(11) NOT NULL,
  `ContactPersonID` INT(11) NOT NULL,
  `AccountsPersonID` INT(11) NOT NULL,
  `SalespersonPersonID` INT(11) NOT NULL,
  `PackedByPersonID` INT(11) NOT NULL,
  `InvoiceDate` DATE NOT NULL,
  `CustomerPurchaseOrderNumber` VARCHAR(20) NULL DEFAULT NULL,
  `IsCreditNote` TINYINT(1) NOT NULL,
  `CreditNoteReason` LONGTEXT NULL DEFAULT NULL,
  `Comments` LONGTEXT NULL DEFAULT NULL,
  `DeliveryInstructions` LONGTEXT NULL DEFAULT NULL,
  `InternalComments` LONGTEXT NULL DEFAULT NULL,
  `TotalDryItems` INT(11) NOT NULL,
  `TotalChillerItems` INT(11) NOT NULL,
  `DeliveryRun` VARCHAR(5) NULL DEFAULT NULL,
  `RunPosition` VARCHAR(5) NULL DEFAULT NULL,
  `ReturnedDeliveryData` LONGTEXT NULL DEFAULT NULL,
  `ConfirmedDeliveryTime` DATETIME NULL DEFAULT NULL,
  `ConfirmedReceivedBy` VARCHAR(4000) NULL DEFAULT NULL,
  `LastEditedBy` INT(11) NOT NULL,
  `LastEditedWhen` DATETIME NOT NULL,
  PRIMARY KEY (`InvoiceID`),
  INDEX `FK_Sales_Invoices_CustomerID` (`CustomerID` ASC),
  INDEX `FK_Sales_Invoices_BillToCustomerID` (`BillToCustomerID` ASC),
  INDEX `FK_Sales_Invoices_OrderID` (`OrderID` ASC),
  INDEX `FK_Sales_Invoices_DeliveryMethodID` (`DeliveryMethodID` ASC),
  INDEX `FK_Sales_Invoices_ContactPersonID` (`ContactPersonID` ASC),
  INDEX `FK_Sales_Invoices_AccountsPersonID` (`AccountsPersonID` ASC),
  INDEX `FK_Sales_Invoices_SalespersonPersonID` (`SalespersonPersonID` ASC),
  INDEX `FK_Sales_Invoices_PackedByPersonID` (`PackedByPersonID` ASC),
  INDEX `IX_Sales_Invoices_ConfirmedDeliveryTime` (`ConfirmedDeliveryTime` ASC, `ConfirmedReceivedBy`(255) ASC),
  INDEX `FK_Sales_Invoices_Application_People` (`LastEditedBy` ASC),
  CONSTRAINT `FK_Sales_Invoices_AccountsPersonID_Application_People`
    FOREIGN KEY (`AccountsPersonID`)
    REFERENCES `wideworldimporters`.`people` (`PersonID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Sales_Invoices_Application_People`
    FOREIGN KEY (`LastEditedBy`)
    REFERENCES `wideworldimporters`.`people` (`PersonID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Sales_Invoices_BillToCustomerID_Sales_Customers`
    FOREIGN KEY (`BillToCustomerID`)
    REFERENCES `wideworldimporters`.`customers` (`CustomerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Sales_Invoices_ContactPersonID_Application_People`
    FOREIGN KEY (`ContactPersonID`)
    REFERENCES `wideworldimporters`.`people` (`PersonID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Sales_Invoices_CustomerID_Sales_Customers`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `wideworldimporters`.`customers` (`CustomerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Sales_Invoices_DeliveryMethodID_Application_DeliveryMethods`
    FOREIGN KEY (`DeliveryMethodID`)
    REFERENCES `wideworldimporters`.`deliverymethods` (`DeliveryMethodID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Sales_Invoices_OrderID_Sales_Orders`
    FOREIGN KEY (`OrderID`)
    REFERENCES `wideworldimporters`.`orders` (`OrderID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Sales_Invoices_PackedByPersonID_Application_People`
    FOREIGN KEY (`PackedByPersonID`)
    REFERENCES `wideworldimporters`.`people` (`PersonID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Sales_Invoices_SalespersonPersonID_Application_People`
    FOREIGN KEY (`SalespersonPersonID`)
    REFERENCES `wideworldimporters`.`people` (`PersonID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `wideworldimporters`.`paymentmethods`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wideworldimporters`.`paymentmethods` (
  `PaymentMethodID` INT(11) NOT NULL,
  `PaymentMethodName` VARCHAR(50) NOT NULL,
  `LastEditedBy` INT(11) NOT NULL,
  `ValidFrom` DATETIME NOT NULL,
  `ValidTo` DATETIME NOT NULL,
  PRIMARY KEY (`PaymentMethodID`),
  UNIQUE INDEX `UQ_Application_PaymentMethods_PaymentMethodName` (`PaymentMethodName` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `wideworldimporters`.`transactiontypes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wideworldimporters`.`transactiontypes` (
  `TransactionTypeID` INT(11) NOT NULL,
  `TransactionTypeName` VARCHAR(50) NOT NULL,
  `LastEditedBy` INT(11) NOT NULL,
  `ValidFrom` DATETIME NOT NULL,
  `ValidTo` DATETIME NOT NULL,
  PRIMARY KEY (`TransactionTypeID`),
  UNIQUE INDEX `UQ_Application_TransactionTypes_TransactionTypeName` (`TransactionTypeName` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `wideworldimporters`.`customertransactions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wideworldimporters`.`customertransactions` (
  `CustomerTransactionID` INT(11) NOT NULL,
  `CustomerID` INT(11) NOT NULL,
  `TransactionTypeID` INT(11) NOT NULL,
  `InvoiceID` INT(11) NULL DEFAULT NULL,
  `PaymentMethodID` INT(11) NULL DEFAULT NULL,
  `TransactionDate` DATE NOT NULL,
  `AmountExcludingTax` DECIMAL(18,2) NOT NULL,
  `TaxAmount` DECIMAL(18,2) NOT NULL,
  `TransactionAmount` DECIMAL(18,2) NOT NULL,
  `OutstandingBalance` DECIMAL(18,2) NOT NULL,
  `FinalizationDate` DATE NULL DEFAULT NULL,
  `IsFinalized` TINYINT(1) NULL DEFAULT NULL,
  `LastEditedBy` INT(11) NOT NULL,
  `LastEditedWhen` DATETIME NOT NULL,
  PRIMARY KEY (`CustomerTransactionID`),
  INDEX `CX_Sales_CustomerTransactions` (`TransactionDate` ASC),
  INDEX `FK_Sales_CustomerTransactions_CustomerID` (`CustomerID` ASC, `TransactionDate` ASC),
  INDEX `FK_Sales_CustomerTransactions_TransactionTypeID` (`TransactionTypeID` ASC, `TransactionDate` ASC),
  INDEX `FK_Sales_CustomerTransactions_InvoiceID` (`InvoiceID` ASC, `TransactionDate` ASC),
  INDEX `FK_Sales_CustomerTransactions_PaymentMethodID` (`PaymentMethodID` ASC, `TransactionDate` ASC),
  INDEX `IX_Sales_CustomerTransactions_IsFinalized` (`IsFinalized` ASC, `TransactionDate` ASC),
  INDEX `FK_Sales_CustomerTransactions_Application_People` (`LastEditedBy` ASC),
  CONSTRAINT `FK_Sales_CustomerTransactions_Application_People`
    FOREIGN KEY (`LastEditedBy`)
    REFERENCES `wideworldimporters`.`people` (`PersonID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Sales_CustomerTransactions_CustomerID_Sales_Customers`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `wideworldimporters`.`customers` (`CustomerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Sales_CustomerTransactions_InvoiceID_Sales_Invoices`
    FOREIGN KEY (`InvoiceID`)
    REFERENCES `wideworldimporters`.`invoices` (`InvoiceID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Sales_CustomerTransactions_PaymentMethodID_Application_Paym15`
    FOREIGN KEY (`PaymentMethodID`)
    REFERENCES `wideworldimporters`.`paymentmethods` (`PaymentMethodID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Sales_CustomerTransactions_TransactionTypeID_Application_Tr14`
    FOREIGN KEY (`TransactionTypeID`)
    REFERENCES `wideworldimporters`.`transactiontypes` (`TransactionTypeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `wideworldimporters`.`deliverymethods_archive`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wideworldimporters`.`deliverymethods_archive` (
  `DeliveryMethodID` INT(11) NOT NULL,
  `DeliveryMethodName` VARCHAR(50) NOT NULL,
  `LastEditedBy` INT(11) NOT NULL,
  `ValidFrom` DATETIME NOT NULL,
  `ValidTo` DATETIME NOT NULL,
  INDEX `ix_DeliveryMethods_Archive` (`ValidFrom` ASC, `ValidTo` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `wideworldimporters`.`gebruikers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wideworldimporters`.`gebruikers` (
  `id` INT(10) NOT NULL AUTO_INCREMENT,
  `Voornaam` VARCHAR(45) NULL DEFAULT NULL,
  `Tussenvoegsels` VARCHAR(45) NULL DEFAULT NULL,
  `Achternaam` VARCHAR(45) NULL DEFAULT NULL,
  `Straat` VARCHAR(45) NULL DEFAULT NULL,
  `Huisnummer` VARCHAR(45) NULL DEFAULT NULL,
  `Postcode` VARCHAR(45) NULL DEFAULT NULL,
  `Plaats` VARCHAR(45) NULL DEFAULT NULL,
  `Email` VARCHAR(45) NOT NULL,
  `Wachtwoord` VARCHAR(45) NOT NULL,
  `Telefoonnummer` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 41
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `wideworldimporters`.`packagetypes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wideworldimporters`.`packagetypes` (
  `PackageTypeID` INT(11) NOT NULL,
  `PackageTypeName` VARCHAR(50) NOT NULL,
  `LastEditedBy` INT(11) NOT NULL,
  `ValidFrom` DATETIME NOT NULL,
  `ValidTo` DATETIME NOT NULL,
  PRIMARY KEY (`PackageTypeID`),
  UNIQUE INDEX `UQ_Warehouse_PackageTypes_PackageTypeName` (`PackageTypeName` ASC),
  INDEX `FK_Warehouse_PackageTypes_Application_People` (`LastEditedBy` ASC),
  CONSTRAINT `FK_Warehouse_PackageTypes_Application_People`
    FOREIGN KEY (`LastEditedBy`)
    REFERENCES `wideworldimporters`.`people` (`PersonID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `wideworldimporters`.`suppliercategories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wideworldimporters`.`suppliercategories` (
  `SupplierCategoryID` INT(11) NOT NULL,
  `SupplierCategoryName` VARCHAR(50) NOT NULL,
  `LastEditedBy` INT(11) NOT NULL,
  `ValidFrom` DATETIME NOT NULL,
  `ValidTo` DATETIME NOT NULL,
  PRIMARY KEY (`SupplierCategoryID`),
  UNIQUE INDEX `UQ_Purchasing_SupplierCategories_SupplierCategoryName` (`SupplierCategoryName` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `wideworldimporters`.`suppliers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wideworldimporters`.`suppliers` (
  `SupplierID` INT(11) NOT NULL,
  `SupplierName` VARCHAR(100) NOT NULL,
  `SupplierCategoryID` INT(11) NOT NULL,
  `PrimaryContactPersonID` INT(11) NOT NULL,
  `AlternateContactPersonID` INT(11) NOT NULL,
  `DeliveryMethodID` INT(11) NULL DEFAULT NULL,
  `DeliveryCityID` INT(11) NOT NULL,
  `PostalCityID` INT(11) NOT NULL,
  `SupplierReference` VARCHAR(20) NULL DEFAULT NULL,
  `BankAccountName` VARCHAR(50) NULL DEFAULT NULL,
  `BankAccountBranch` VARCHAR(50) NULL DEFAULT NULL,
  `BankAccountCode` VARCHAR(20) NULL DEFAULT NULL,
  `BankAccountNumber` VARCHAR(20) NULL DEFAULT NULL,
  `BankInternationalCode` VARCHAR(20) NULL DEFAULT NULL,
  `PaymentDays` INT(11) NOT NULL,
  `InternalComments` LONGTEXT NULL DEFAULT NULL,
  `PhoneNumber` VARCHAR(20) NOT NULL,
  `FaxNumber` VARCHAR(20) NOT NULL,
  `WebsiteURL` VARCHAR(256) NOT NULL,
  `DeliveryAddressLine1` VARCHAR(60) NOT NULL,
  `DeliveryAddressLine2` VARCHAR(60) NULL DEFAULT NULL,
  `DeliveryPostalCode` VARCHAR(10) NOT NULL,
  `DeliveryLocation` VARCHAR(100) NULL DEFAULT NULL,
  `PostalAddressLine1` VARCHAR(60) NOT NULL,
  `PostalAddressLine2` VARCHAR(60) NULL DEFAULT NULL,
  `PostalPostalCode` VARCHAR(10) NOT NULL,
  `LastEditedBy` INT(11) NOT NULL,
  `ValidFrom` DATETIME NOT NULL,
  `ValidTo` DATETIME NOT NULL,
  PRIMARY KEY (`SupplierID`),
  UNIQUE INDEX `UQ_Purchasing_Suppliers_SupplierName` (`SupplierName` ASC),
  INDEX `FK_Purchasing_Suppliers_SupplierCategoryID` (`SupplierCategoryID` ASC),
  INDEX `FK_Purchasing_Suppliers_PrimaryContactPersonID` (`PrimaryContactPersonID` ASC),
  INDEX `FK_Purchasing_Suppliers_AlternateContactPersonID` (`AlternateContactPersonID` ASC),
  INDEX `FK_Purchasing_Suppliers_DeliveryMethodID` (`DeliveryMethodID` ASC),
  INDEX `FK_Purchasing_Suppliers_DeliveryCityID` (`DeliveryCityID` ASC),
  INDEX `FK_Purchasing_Suppliers_PostalCityID` (`PostalCityID` ASC),
  INDEX `FK_Purchasing_Suppliers_Application_People` (`LastEditedBy` ASC),
  CONSTRAINT `FK_Purchasing_Suppliers_AlternateContactPersonID_Application_P4`
    FOREIGN KEY (`AlternateContactPersonID`)
    REFERENCES `wideworldimporters`.`people` (`PersonID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Purchasing_Suppliers_Application_People`
    FOREIGN KEY (`LastEditedBy`)
    REFERENCES `wideworldimporters`.`people` (`PersonID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Purchasing_Suppliers_DeliveryCityID_Application_Cities`
    FOREIGN KEY (`DeliveryCityID`)
    REFERENCES `wideworldimporters`.`cities` (`CityID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Purchasing_Suppliers_DeliveryMethodID_Application_DeliveryM5`
    FOREIGN KEY (`DeliveryMethodID`)
    REFERENCES `wideworldimporters`.`deliverymethods` (`DeliveryMethodID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Purchasing_Suppliers_PostalCityID_Application_Cities`
    FOREIGN KEY (`PostalCityID`)
    REFERENCES `wideworldimporters`.`cities` (`CityID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Purchasing_Suppliers_PrimaryContactPersonID_Application_Peo3`
    FOREIGN KEY (`PrimaryContactPersonID`)
    REFERENCES `wideworldimporters`.`people` (`PersonID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Purchasing_Suppliers_SupplierCategoryID_Purchasing_Supplier2`
    FOREIGN KEY (`SupplierCategoryID`)
    REFERENCES `wideworldimporters`.`suppliercategories` (`SupplierCategoryID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `wideworldimporters`.`stockitems`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wideworldimporters`.`stockitems` (
  `StockItemID` INT(11) NOT NULL,
  `StockItemName` VARCHAR(100) NOT NULL,
  `SupplierID` INT(11) NOT NULL,
  `ColorID` INT(11) NULL DEFAULT NULL,
  `UnitPackageID` INT(11) NOT NULL,
  `OuterPackageID` INT(11) NOT NULL,
  `Brand` VARCHAR(50) NULL DEFAULT NULL,
  `Size` VARCHAR(20) NULL DEFAULT NULL,
  `LeadTimeDays` INT(11) NOT NULL,
  `QuantityPerOuter` INT(11) NOT NULL,
  `IsChillerStock` TINYINT(1) NOT NULL,
  `Barcode` VARCHAR(50) NULL DEFAULT NULL,
  `TaxRate` DECIMAL(18,3) NOT NULL,
  `UnitPrice` DECIMAL(18,2) NOT NULL,
  `RecommendedRetailPrice` DECIMAL(18,2) NULL DEFAULT NULL,
  `TypicalWeightPerUnit` DECIMAL(18,3) NOT NULL,
  `MarketingComments` LONGTEXT NULL DEFAULT NULL,
  `InternalComments` LONGTEXT NULL DEFAULT NULL,
  `Photo` LONGBLOB NULL DEFAULT NULL,
  `CustomFields` LONGTEXT NULL DEFAULT NULL,
  `Tags` LONGTEXT NULL DEFAULT NULL,
  `SearchDetails` LONGTEXT NOT NULL,
  `LastEditedBy` INT(11) NOT NULL,
  `ValidFrom` DATETIME NOT NULL,
  `ValidTo` DATETIME NOT NULL,
  PRIMARY KEY (`StockItemID`),
  UNIQUE INDEX `UQ_Warehouse_StockItems_StockItemName` (`StockItemName` ASC),
  INDEX `FK_Warehouse_StockItems_SupplierID` (`SupplierID` ASC),
  INDEX `FK_Warehouse_StockItems_ColorID` (`ColorID` ASC),
  INDEX `FK_Warehouse_StockItems_UnitPackageID` (`UnitPackageID` ASC),
  INDEX `FK_Warehouse_StockItems_OuterPackageID` (`OuterPackageID` ASC),
  INDEX `FK_Warehouse_StockItems_Application_People` (`LastEditedBy` ASC),
  CONSTRAINT `FK_Warehouse_StockItems_Application_People`
    FOREIGN KEY (`LastEditedBy`)
    REFERENCES `wideworldimporters`.`people` (`PersonID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Warehouse_StockItems_ColorID_Warehouse_Colors`
    FOREIGN KEY (`ColorID`)
    REFERENCES `wideworldimporters`.`colors` (`ColorID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Warehouse_StockItems_OuterPackageID_Warehouse_PackageTypes`
    FOREIGN KEY (`OuterPackageID`)
    REFERENCES `wideworldimporters`.`packagetypes` (`PackageTypeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Warehouse_StockItems_SupplierID_Purchasing_Suppliers`
    FOREIGN KEY (`SupplierID`)
    REFERENCES `wideworldimporters`.`suppliers` (`SupplierID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Warehouse_StockItems_UnitPackageID_Warehouse_PackageTypes`
    FOREIGN KEY (`UnitPackageID`)
    REFERENCES `wideworldimporters`.`packagetypes` (`PackageTypeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `wideworldimporters`.`invoicelines`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wideworldimporters`.`invoicelines` (
  `InvoiceLineID` INT(11) NOT NULL,
  `InvoiceID` INT(11) NOT NULL,
  `StockItemID` INT(11) NOT NULL,
  `Description` VARCHAR(100) NOT NULL,
  `PackageTypeID` INT(11) NOT NULL,
  `Quantity` INT(11) NOT NULL,
  `UnitPrice` DECIMAL(18,2) NULL DEFAULT NULL,
  `TaxRate` DECIMAL(18,3) NOT NULL,
  `TaxAmount` DECIMAL(18,2) NOT NULL,
  `LineProfit` DECIMAL(18,2) NOT NULL,
  `ExtendedPrice` DECIMAL(18,2) NOT NULL,
  `LastEditedBy` INT(11) NOT NULL,
  `LastEditedWhen` DATETIME NOT NULL,
  PRIMARY KEY (`InvoiceLineID`),
  INDEX `FK_Sales_InvoiceLines_InvoiceID` (`InvoiceID` ASC),
  INDEX `FK_Sales_InvoiceLines_StockItemID` (`StockItemID` ASC),
  INDEX `FK_Sales_InvoiceLines_PackageTypeID` (`PackageTypeID` ASC),
  INDEX `NCCX_Sales_InvoiceLines` (`InvoiceID` ASC, `StockItemID` ASC, `Quantity` ASC, `UnitPrice` ASC, `LineProfit` ASC, `LastEditedWhen` ASC),
  INDEX `FK_Sales_InvoiceLines_Application_People` (`LastEditedBy` ASC),
  CONSTRAINT `FK_Sales_InvoiceLines_Application_People`
    FOREIGN KEY (`LastEditedBy`)
    REFERENCES `wideworldimporters`.`people` (`PersonID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Sales_InvoiceLines_InvoiceID_Sales_Invoices`
    FOREIGN KEY (`InvoiceID`)
    REFERENCES `wideworldimporters`.`invoices` (`InvoiceID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Sales_InvoiceLines_PackageTypeID_Warehouse_PackageTypes`
    FOREIGN KEY (`PackageTypeID`)
    REFERENCES `wideworldimporters`.`packagetypes` (`PackageTypeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Sales_InvoiceLines_StockItemID_Warehouse_StockItems`
    FOREIGN KEY (`StockItemID`)
    REFERENCES `wideworldimporters`.`stockitems` (`StockItemID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `wideworldimporters`.`orderlines`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wideworldimporters`.`orderlines` (
  `OrderLineID` INT(11) NOT NULL,
  `OrderID` INT(11) NOT NULL,
  `StockItemID` INT(11) NOT NULL,
  `Description` VARCHAR(100) NOT NULL,
  `PackageTypeID` INT(11) NOT NULL,
  `Quantity` INT(11) NOT NULL,
  `UnitPrice` DECIMAL(18,2) NULL DEFAULT NULL,
  `TaxRate` DECIMAL(18,3) NOT NULL,
  `PickedQuantity` INT(11) NOT NULL,
  `PickingCompletedWhen` DATETIME NULL DEFAULT NULL,
  `LastEditedBy` INT(11) NOT NULL,
  `LastEditedWhen` DATETIME NOT NULL,
  PRIMARY KEY (`OrderLineID`),
  INDEX `FK_Sales_OrderLines_OrderID` (`OrderID` ASC),
  INDEX `FK_Sales_OrderLines_PackageTypeID` (`PackageTypeID` ASC),
  INDEX `IX_Sales_OrderLines_AllocatedStockItems` (`StockItemID` ASC, `PickedQuantity` ASC),
  INDEX `IX_Sales_OrderLines_Perf_20160301_01` (`PickingCompletedWhen` ASC, `OrderID` ASC, `OrderLineID` ASC, `Quantity` ASC, `StockItemID` ASC),
  INDEX `IX_Sales_OrderLines_Perf_20160301_02` (`StockItemID` ASC, `PickingCompletedWhen` ASC, `OrderID` ASC, `PickedQuantity` ASC),
  INDEX `NCCX_Sales_OrderLines` (`OrderID` ASC, `StockItemID` ASC, `Description` ASC, `Quantity` ASC, `UnitPrice` ASC, `PickedQuantity` ASC),
  INDEX `FK_Sales_OrderLines_Application_People` (`LastEditedBy` ASC),
  CONSTRAINT `FK_Sales_OrderLines_Application_People`
    FOREIGN KEY (`LastEditedBy`)
    REFERENCES `wideworldimporters`.`people` (`PersonID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Sales_OrderLines_OrderID_Sales_Orders`
    FOREIGN KEY (`OrderID`)
    REFERENCES `wideworldimporters`.`orders` (`OrderID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Sales_OrderLines_PackageTypeID_Warehouse_PackageTypes`
    FOREIGN KEY (`PackageTypeID`)
    REFERENCES `wideworldimporters`.`packagetypes` (`PackageTypeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Sales_OrderLines_StockItemID_Warehouse_StockItems`
    FOREIGN KEY (`StockItemID`)
    REFERENCES `wideworldimporters`.`stockitems` (`StockItemID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `wideworldimporters`.`packagetypes_archive`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wideworldimporters`.`packagetypes_archive` (
  `PackageTypeID` INT(11) NOT NULL,
  `PackageTypeName` VARCHAR(50) NOT NULL,
  `LastEditedBy` INT(11) NOT NULL,
  `ValidFrom` DATETIME NOT NULL,
  `ValidTo` DATETIME NOT NULL,
  INDEX `ix_PackageTypes_Archive` (`ValidFrom` ASC, `ValidTo` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `wideworldimporters`.`paymentmethods_archive`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wideworldimporters`.`paymentmethods_archive` (
  `PaymentMethodID` INT(11) NOT NULL,
  `PaymentMethodName` VARCHAR(50) NOT NULL,
  `LastEditedBy` INT(11) NOT NULL,
  `ValidFrom` DATETIME NOT NULL,
  `ValidTo` DATETIME NOT NULL,
  INDEX `ix_PaymentMethods_Archive` (`ValidFrom` ASC, `ValidTo` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `wideworldimporters`.`people_archive`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wideworldimporters`.`people_archive` (
  `PersonID` INT(11) NOT NULL,
  `FullName` VARCHAR(50) NOT NULL,
  `PreferredName` VARCHAR(50) NOT NULL,
  `SearchName` VARCHAR(101) NOT NULL,
  `IsPermittedToLogon` TINYINT(1) NOT NULL,
  `LogonName` VARCHAR(50) NULL DEFAULT NULL,
  `IsExternalLogonProvider` TINYINT(1) NOT NULL,
  `HashedPassword` LONGBLOB NULL DEFAULT NULL,
  `IsSystemUser` TINYINT(1) NOT NULL,
  `IsEmployee` TINYINT(1) NOT NULL,
  `IsSalesperson` TINYINT(1) NOT NULL,
  `UserPreferences` LONGTEXT NULL DEFAULT NULL,
  `PhoneNumber` VARCHAR(20) NULL DEFAULT NULL,
  `FaxNumber` VARCHAR(20) NULL DEFAULT NULL,
  `EmailAddress` VARCHAR(256) NULL DEFAULT NULL,
  `Photo` LONGBLOB NULL DEFAULT NULL,
  `CustomFields` LONGTEXT NULL DEFAULT NULL,
  `OtherLanguages` LONGTEXT NULL DEFAULT NULL,
  `LastEditedBy` INT(11) NOT NULL,
  `ValidFrom` DATETIME NOT NULL,
  `ValidTo` DATETIME NOT NULL,
  INDEX `ix_People_Archive` (`ValidFrom` ASC, `ValidTo` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `wideworldimporters`.`purchaseorders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wideworldimporters`.`purchaseorders` (
  `PurchaseOrderID` INT(11) NOT NULL,
  `SupplierID` INT(11) NOT NULL,
  `OrderDate` DATE NOT NULL,
  `DeliveryMethodID` INT(11) NOT NULL,
  `ContactPersonID` INT(11) NOT NULL,
  `ExpectedDeliveryDate` DATE NULL DEFAULT NULL,
  `SupplierReference` VARCHAR(20) NULL DEFAULT NULL,
  `IsOrderFinalized` TINYINT(1) NOT NULL,
  `Comments` LONGTEXT NULL DEFAULT NULL,
  `InternalComments` LONGTEXT NULL DEFAULT NULL,
  `LastEditedBy` INT(11) NOT NULL,
  `LastEditedWhen` DATETIME NOT NULL,
  PRIMARY KEY (`PurchaseOrderID`),
  INDEX `FK_Purchasing_PurchaseOrders_SupplierID` (`SupplierID` ASC),
  INDEX `FK_Purchasing_PurchaseOrders_DeliveryMethodID` (`DeliveryMethodID` ASC),
  CONSTRAINT `FK_Purchasing_PurchaseOrders_DeliveryMethodID_Application_Deli6`
    FOREIGN KEY (`DeliveryMethodID`)
    REFERENCES `wideworldimporters`.`deliverymethods` (`DeliveryMethodID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Purchasing_PurchaseOrders_SupplierID_Purchasing_Suppliers`
    FOREIGN KEY (`SupplierID`)
    REFERENCES `wideworldimporters`.`suppliers` (`SupplierID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `wideworldimporters`.`purchaseorderlines`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wideworldimporters`.`purchaseorderlines` (
  `PurchaseOrderLineID` INT(11) NOT NULL,
  `PurchaseOrderID` INT(11) NOT NULL,
  `StockItemID` INT(11) NOT NULL,
  `OrderedOuters` INT(11) NOT NULL,
  `Description` VARCHAR(100) NOT NULL,
  `ReceivedOuters` INT(11) NOT NULL,
  `PackageTypeID` INT(11) NOT NULL,
  `ExpectedUnitPricePerOuter` DECIMAL(18,2) NULL DEFAULT NULL,
  `LastReceiptDate` DATE NULL DEFAULT NULL,
  `IsOrderLineFinalized` TINYINT(1) NOT NULL,
  `LastEditedBy` INT(11) NOT NULL,
  `LastEditedWhen` DATETIME NOT NULL,
  PRIMARY KEY (`PurchaseOrderLineID`),
  INDEX `FK_Purchasing_PurchaseOrderLines_PurchaseOrderID` (`PurchaseOrderID` ASC),
  INDEX `FK_Purchasing_PurchaseOrderLines_StockItemID` (`StockItemID` ASC),
  INDEX `FK_Purchasing_PurchaseOrderLines_PackageTypeID` (`PackageTypeID` ASC),
  INDEX `IX_Purchasing_PurchaseOrderLines_Perf_20160301_4` (`IsOrderLineFinalized` ASC, `StockItemID` ASC, `OrderedOuters` ASC, `ReceivedOuters` ASC),
  CONSTRAINT `FK_Purchasing_PurchaseOrderLines_PackageTypeID_Warehouse_Packa9`
    FOREIGN KEY (`PackageTypeID`)
    REFERENCES `wideworldimporters`.`packagetypes` (`PackageTypeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Purchasing_PurchaseOrderLines_PurchaseOrderID_Purchasing_Pu7`
    FOREIGN KEY (`PurchaseOrderID`)
    REFERENCES `wideworldimporters`.`purchaseorders` (`PurchaseOrderID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Purchasing_PurchaseOrderLines_StockItemID_Warehouse_StockIt8`
    FOREIGN KEY (`StockItemID`)
    REFERENCES `wideworldimporters`.`stockitems` (`StockItemID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `wideworldimporters`.`stockgroups`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wideworldimporters`.`stockgroups` (
  `StockGroupID` INT(11) NOT NULL,
  `StockGroupName` VARCHAR(50) NOT NULL,
  `LastEditedBy` INT(11) NOT NULL,
  `ValidFrom` DATETIME NOT NULL,
  `ValidTo` DATETIME NOT NULL,
  PRIMARY KEY (`StockGroupID`),
  UNIQUE INDEX `UQ_Warehouse_StockGroups_StockGroupName` (`StockGroupName` ASC),
  INDEX `FK_Warehouse_StockGroups_Application_People` (`LastEditedBy` ASC),
  CONSTRAINT `FK_Warehouse_StockGroups_Application_People`
    FOREIGN KEY (`LastEditedBy`)
    REFERENCES `wideworldimporters`.`people` (`PersonID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `wideworldimporters`.`specialdeals`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wideworldimporters`.`specialdeals` (
  `SpecialDealID` INT(11) NOT NULL,
  `StockItemID` INT(11) NULL DEFAULT NULL,
  `CustomerID` INT(11) NULL DEFAULT NULL,
  `BuyingGroupID` INT(11) NULL DEFAULT NULL,
  `CustomerCategoryID` INT(11) NULL DEFAULT NULL,
  `StockGroupID` INT(11) NULL DEFAULT NULL,
  `DealDescription` VARCHAR(30) NOT NULL,
  `StartDate` DATE NOT NULL,
  `EndDate` DATE NOT NULL,
  `DiscountAmount` DECIMAL(18,2) NULL DEFAULT NULL,
  `DiscountPercentage` DECIMAL(18,3) NULL DEFAULT NULL,
  `UnitPrice` DECIMAL(18,2) NULL DEFAULT NULL,
  `LastEditedBy` INT(11) NOT NULL,
  `LastEditedWhen` DATETIME NOT NULL,
  PRIMARY KEY (`SpecialDealID`),
  INDEX `FK_Sales_SpecialDeals_StockItemID` (`StockItemID` ASC),
  INDEX `FK_Sales_SpecialDeals_CustomerID` (`CustomerID` ASC),
  INDEX `FK_Sales_SpecialDeals_BuyingGroupID` (`BuyingGroupID` ASC),
  INDEX `FK_Sales_SpecialDeals_CustomerCategoryID` (`CustomerCategoryID` ASC),
  INDEX `FK_Sales_SpecialDeals_StockGroupID` (`StockGroupID` ASC),
  INDEX `FK_Sales_SpecialDeals_Application_People` (`LastEditedBy` ASC),
  CONSTRAINT `FK_Sales_SpecialDeals_Application_People`
    FOREIGN KEY (`LastEditedBy`)
    REFERENCES `wideworldimporters`.`people` (`PersonID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Sales_SpecialDeals_BuyingGroupID_Sales_BuyingGroups`
    FOREIGN KEY (`BuyingGroupID`)
    REFERENCES `wideworldimporters`.`buyinggroups` (`BuyingGroupID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Sales_SpecialDeals_CustomerCategoryID_Sales_CustomerCategor16`
    FOREIGN KEY (`CustomerCategoryID`)
    REFERENCES `wideworldimporters`.`customercategories` (`CustomerCategoryID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Sales_SpecialDeals_CustomerID_Sales_Customers`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `wideworldimporters`.`customers` (`CustomerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Sales_SpecialDeals_StockGroupID_Warehouse_StockGroups`
    FOREIGN KEY (`StockGroupID`)
    REFERENCES `wideworldimporters`.`stockgroups` (`StockGroupID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Sales_SpecialDeals_StockItemID_Warehouse_StockItems`
    FOREIGN KEY (`StockItemID`)
    REFERENCES `wideworldimporters`.`stockitems` (`StockItemID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `wideworldimporters`.`stateprovinces_archive`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wideworldimporters`.`stateprovinces_archive` (
  `StateProvinceID` INT(11) NOT NULL,
  `StateProvinceCode` VARCHAR(5) NOT NULL,
  `StateProvinceName` VARCHAR(50) NOT NULL,
  `CountryID` INT(11) NOT NULL,
  `SalesTerritory` VARCHAR(50) NOT NULL,
  `Border` VARCHAR(100) NULL DEFAULT NULL,
  `LatestRecordedPopulation` BIGINT(20) NULL DEFAULT NULL,
  `LastEditedBy` INT(11) NOT NULL,
  `ValidFrom` DATETIME NOT NULL,
  `ValidTo` DATETIME NOT NULL,
  INDEX `ix_StateProvinces_Archive` (`ValidFrom` ASC, `ValidTo` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `wideworldimporters`.`stockgroups_archive`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wideworldimporters`.`stockgroups_archive` (
  `StockGroupID` INT(11) NOT NULL,
  `StockGroupName` VARCHAR(50) NOT NULL,
  `LastEditedBy` INT(11) NOT NULL,
  `ValidFrom` DATETIME NOT NULL,
  `ValidTo` DATETIME NOT NULL,
  INDEX `ix_StockGroups_Archive` (`ValidFrom` ASC, `ValidTo` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `wideworldimporters`.`stockitemholdings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wideworldimporters`.`stockitemholdings` (
  `StockItemID` INT(11) NOT NULL,
  `QuantityOnHand` INT(11) NOT NULL,
  `BinLocation` VARCHAR(20) NOT NULL,
  `LastStocktakeQuantity` INT(11) NOT NULL,
  `LastCostPrice` DECIMAL(18,2) NOT NULL,
  `ReorderLevel` INT(11) NOT NULL,
  `TargetStockLevel` INT(11) NOT NULL,
  `LastEditedBy` INT(11) NOT NULL,
  `LastEditedWhen` DATETIME NOT NULL,
  PRIMARY KEY (`StockItemID`),
  INDEX `FK_Warehouse_StockItemHoldings_Application_People` (`LastEditedBy` ASC),
  CONSTRAINT `FK_Warehouse_StockItemHoldings_Application_People`
    FOREIGN KEY (`LastEditedBy`)
    REFERENCES `wideworldimporters`.`people` (`PersonID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `PKFK_Warehouse_StockItemHoldings_StockItemID_Warehouse_StockIt23`
    FOREIGN KEY (`StockItemID`)
    REFERENCES `wideworldimporters`.`stockitems` (`StockItemID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `wideworldimporters`.`stockitems_archive`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wideworldimporters`.`stockitems_archive` (
  `StockItemID` INT(11) NOT NULL,
  `StockItemName` VARCHAR(100) NOT NULL,
  `SupplierID` INT(11) NOT NULL,
  `ColorID` INT(11) NULL DEFAULT NULL,
  `UnitPackageID` INT(11) NOT NULL,
  `OuterPackageID` INT(11) NOT NULL,
  `Brand` VARCHAR(50) NULL DEFAULT NULL,
  `Size` VARCHAR(20) NULL DEFAULT NULL,
  `LeadTimeDays` INT(11) NOT NULL,
  `QuantityPerOuter` INT(11) NOT NULL,
  `IsChillerStock` TINYINT(1) NOT NULL,
  `Barcode` VARCHAR(50) NULL DEFAULT NULL,
  `TaxRate` DECIMAL(18,3) NOT NULL,
  `UnitPrice` DECIMAL(18,2) NOT NULL,
  `RecommendedRetailPrice` DECIMAL(18,2) NULL DEFAULT NULL,
  `TypicalWeightPerUnit` DECIMAL(18,3) NOT NULL,
  `MarketingComments` LONGTEXT NULL DEFAULT NULL,
  `InternalComments` LONGTEXT NULL DEFAULT NULL,
  `Photo` LONGBLOB NULL DEFAULT NULL,
  `CustomFields` LONGTEXT NULL DEFAULT NULL,
  `Tags` LONGTEXT NULL DEFAULT NULL,
  `SearchDetails` LONGTEXT NOT NULL,
  `LastEditedBy` INT(11) NOT NULL,
  `ValidFrom` DATETIME NOT NULL,
  `ValidTo` DATETIME NOT NULL,
  INDEX `ix_StockItems_Archive` (`ValidFrom` ASC, `ValidTo` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `wideworldimporters`.`stockitemstockgroups`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wideworldimporters`.`stockitemstockgroups` (
  `StockItemStockGroupID` INT(11) NOT NULL,
  `StockItemID` INT(11) NOT NULL,
  `StockGroupID` INT(11) NOT NULL,
  `LastEditedBy` INT(11) NOT NULL,
  `LastEditedWhen` DATETIME NOT NULL,
  PRIMARY KEY (`StockItemStockGroupID`),
  UNIQUE INDEX `UQ_StockItemStockGroups_StockItemID_Lookup` (`StockItemID` ASC, `StockGroupID` ASC),
  UNIQUE INDEX `UQ_StockItemStockGroups_StockGroupID_Lookup` (`StockGroupID` ASC, `StockItemID` ASC),
  INDEX `FK_Warehouse_StockItemStockGroups_Application_People` (`LastEditedBy` ASC),
  CONSTRAINT `FK_Warehouse_StockItemStockGroups_Application_People`
    FOREIGN KEY (`LastEditedBy`)
    REFERENCES `wideworldimporters`.`people` (`PersonID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Warehouse_StockItemStockGroups_StockGroupID_Warehouse_Stock18`
    FOREIGN KEY (`StockGroupID`)
    REFERENCES `wideworldimporters`.`stockgroups` (`StockGroupID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Warehouse_StockItemStockGroups_StockItemID_Warehouse_StockI17`
    FOREIGN KEY (`StockItemID`)
    REFERENCES `wideworldimporters`.`stockitems` (`StockItemID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `wideworldimporters`.`stockitemtransactions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wideworldimporters`.`stockitemtransactions` (
  `StockItemTransactionID` INT(11) NOT NULL,
  `StockItemID` INT(11) NOT NULL,
  `TransactionTypeID` INT(11) NOT NULL,
  `CustomerID` INT(11) NULL DEFAULT NULL,
  `InvoiceID` INT(11) NULL DEFAULT NULL,
  `SupplierID` INT(11) NULL DEFAULT NULL,
  `PurchaseOrderID` INT(11) NULL DEFAULT NULL,
  `TransactionOccurredWhen` DATETIME NOT NULL,
  `Quantity` DECIMAL(18,3) NOT NULL,
  `LastEditedBy` INT(11) NOT NULL,
  `LastEditedWhen` DATETIME NOT NULL,
  PRIMARY KEY (`StockItemTransactionID`),
  INDEX `CCX_Warehouse_StockItemTransactions` (`StockItemTransactionID` ASC, `StockItemID` ASC, `TransactionTypeID` ASC, `CustomerID` ASC, `InvoiceID` ASC, `SupplierID` ASC, `PurchaseOrderID` ASC, `TransactionOccurredWhen` ASC, `Quantity` ASC, `LastEditedBy` ASC, `LastEditedWhen` ASC),
  INDEX `FK_Warehouse_StockItemTransactions_StockItemID` (`StockItemID` ASC),
  INDEX `FK_Warehouse_StockItemTransactions_TransactionTypeID` (`TransactionTypeID` ASC),
  INDEX `FK_Warehouse_StockItemTransactions_CustomerID` (`CustomerID` ASC),
  INDEX `FK_Warehouse_StockItemTransactions_InvoiceID` (`InvoiceID` ASC),
  INDEX `FK_Warehouse_StockItemTransactions_SupplierID` (`SupplierID` ASC),
  INDEX `FK_Warehouse_StockItemTransactions_PurchaseOrderID` (`PurchaseOrderID` ASC),
  INDEX `FK_Warehouse_StockItemTransactions_Application_People` (`LastEditedBy` ASC),
  CONSTRAINT `FK_Warehouse_StockItemTransactions_Application_People`
    FOREIGN KEY (`LastEditedBy`)
    REFERENCES `wideworldimporters`.`people` (`PersonID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Warehouse_StockItemTransactions_CustomerID_Sales_Customers`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `wideworldimporters`.`customers` (`CustomerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Warehouse_StockItemTransactions_InvoiceID_Sales_Invoices`
    FOREIGN KEY (`InvoiceID`)
    REFERENCES `wideworldimporters`.`invoices` (`InvoiceID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Warehouse_StockItemTransactions_PurchaseOrderID_Purchasing_22`
    FOREIGN KEY (`PurchaseOrderID`)
    REFERENCES `wideworldimporters`.`purchaseorders` (`PurchaseOrderID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Warehouse_StockItemTransactions_StockItemID_Warehouse_Stock19`
    FOREIGN KEY (`StockItemID`)
    REFERENCES `wideworldimporters`.`stockitems` (`StockItemID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Warehouse_StockItemTransactions_SupplierID_Purchasing_Suppl21`
    FOREIGN KEY (`SupplierID`)
    REFERENCES `wideworldimporters`.`suppliers` (`SupplierID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Warehouse_StockItemTransactions_TransactionTypeID_Applicati20`
    FOREIGN KEY (`TransactionTypeID`)
    REFERENCES `wideworldimporters`.`transactiontypes` (`TransactionTypeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `wideworldimporters`.`suppliercategories_archive`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wideworldimporters`.`suppliercategories_archive` (
  `SupplierCategoryID` INT(11) NOT NULL,
  `SupplierCategoryName` VARCHAR(50) NOT NULL,
  `LastEditedBy` INT(11) NOT NULL,
  `ValidFrom` DATETIME NOT NULL,
  `ValidTo` DATETIME NOT NULL,
  INDEX `ix_SupplierCategories_Archive` (`ValidFrom` ASC, `ValidTo` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `wideworldimporters`.`suppliers_archive`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wideworldimporters`.`suppliers_archive` (
  `SupplierID` INT(11) NOT NULL,
  `SupplierName` VARCHAR(100) NOT NULL,
  `SupplierCategoryID` INT(11) NOT NULL,
  `PrimaryContactPersonID` INT(11) NOT NULL,
  `AlternateContactPersonID` INT(11) NOT NULL,
  `DeliveryMethodID` INT(11) NULL DEFAULT NULL,
  `DeliveryCityID` INT(11) NOT NULL,
  `PostalCityID` INT(11) NOT NULL,
  `SupplierReference` VARCHAR(20) NULL DEFAULT NULL,
  `BankAccountName` VARCHAR(50) NULL DEFAULT NULL,
  `BankAccountBranch` VARCHAR(50) NULL DEFAULT NULL,
  `BankAccountCode` VARCHAR(20) NULL DEFAULT NULL,
  `BankAccountNumber` VARCHAR(20) NULL DEFAULT NULL,
  `BankInternationalCode` VARCHAR(20) NULL DEFAULT NULL,
  `PaymentDays` INT(11) NOT NULL,
  `InternalComments` LONGTEXT NULL DEFAULT NULL,
  `PhoneNumber` VARCHAR(20) NOT NULL,
  `FaxNumber` VARCHAR(20) NOT NULL,
  `WebsiteURL` VARCHAR(256) NOT NULL,
  `DeliveryAddressLine1` VARCHAR(60) NOT NULL,
  `DeliveryAddressLine2` VARCHAR(60) NULL DEFAULT NULL,
  `DeliveryPostalCode` VARCHAR(10) NOT NULL,
  `DeliveryLocation` VARCHAR(100) NULL DEFAULT NULL,
  `PostalAddressLine1` VARCHAR(60) NOT NULL,
  `PostalAddressLine2` VARCHAR(60) NULL DEFAULT NULL,
  `PostalPostalCode` VARCHAR(10) NOT NULL,
  `LastEditedBy` INT(11) NOT NULL,
  `ValidFrom` DATETIME NOT NULL,
  `ValidTo` DATETIME NOT NULL,
  INDEX `ix_Suppliers_Archive` (`ValidFrom` ASC, `ValidTo` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `wideworldimporters`.`suppliertransactions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wideworldimporters`.`suppliertransactions` (
  `SupplierTransactionID` INT(11) NOT NULL,
  `SupplierID` INT(11) NOT NULL,
  `TransactionTypeID` INT(11) NOT NULL,
  `PurchaseOrderID` INT(11) NULL DEFAULT NULL,
  `PaymentMethodID` INT(11) NULL DEFAULT NULL,
  `SupplierInvoiceNumber` VARCHAR(20) NULL DEFAULT NULL,
  `TransactionDate` DATE NOT NULL,
  `AmountExcludingTax` DECIMAL(18,2) NOT NULL,
  `TaxAmount` DECIMAL(18,2) NOT NULL,
  `TransactionAmount` DECIMAL(18,2) NOT NULL,
  `OutstandingBalance` DECIMAL(18,2) NOT NULL,
  `FinalizationDate` DATE NULL DEFAULT NULL,
  `IsFinalized` TINYINT(1) NULL DEFAULT NULL,
  `LastEditedBy` INT(11) NOT NULL,
  `LastEditedWhen` DATETIME NOT NULL,
  PRIMARY KEY (`SupplierTransactionID`),
  INDEX `CX_Purchasing_SupplierTransactions` (`TransactionDate` ASC),
  INDEX `FK_Purchasing_SupplierTransactions_SupplierID` (`SupplierID` ASC, `TransactionDate` ASC),
  INDEX `FK_Purchasing_SupplierTransactions_TransactionTypeID` (`TransactionTypeID` ASC, `TransactionDate` ASC),
  INDEX `FK_Purchasing_SupplierTransactions_PurchaseOrderID` (`PurchaseOrderID` ASC, `TransactionDate` ASC),
  INDEX `FK_Purchasing_SupplierTransactions_PaymentMethodID` (`PaymentMethodID` ASC, `TransactionDate` ASC),
  INDEX `IX_Purchasing_SupplierTransactions_IsFinalized` (`IsFinalized` ASC, `TransactionDate` ASC),
  CONSTRAINT `FK_Purchasing_SupplierTransactions_PaymentMethodID_Application13`
    FOREIGN KEY (`PaymentMethodID`)
    REFERENCES `wideworldimporters`.`paymentmethods` (`PaymentMethodID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Purchasing_SupplierTransactions_PurchaseOrderID_Purchasing_12`
    FOREIGN KEY (`PurchaseOrderID`)
    REFERENCES `wideworldimporters`.`purchaseorders` (`PurchaseOrderID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Purchasing_SupplierTransactions_SupplierID_Purchasing_Suppl10`
    FOREIGN KEY (`SupplierID`)
    REFERENCES `wideworldimporters`.`suppliers` (`SupplierID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Purchasing_SupplierTransactions_TransactionTypeID_Applicati11`
    FOREIGN KEY (`TransactionTypeID`)
    REFERENCES `wideworldimporters`.`transactiontypes` (`TransactionTypeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `wideworldimporters`.`sysdiagrams`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wideworldimporters`.`sysdiagrams` (
  `name` VARCHAR(160) NOT NULL,
  `principal_id` INT(11) NOT NULL,
  `diagram_id` INT(11) NOT NULL AUTO_INCREMENT,
  `version` INT(11) NULL DEFAULT NULL,
  `definition` LONGBLOB NULL DEFAULT NULL,
  PRIMARY KEY (`diagram_id`),
  UNIQUE INDEX `UK_principal_name` (`principal_id` ASC, `name` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `wideworldimporters`.`systemparameters`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wideworldimporters`.`systemparameters` (
  `SystemParameterID` INT(11) NOT NULL,
  `DeliveryAddressLine1` VARCHAR(60) NOT NULL,
  `DeliveryAddressLine2` VARCHAR(60) NULL DEFAULT NULL,
  `DeliveryCityID` INT(11) NOT NULL,
  `DeliveryPostalCode` VARCHAR(10) NOT NULL,
  `DeliveryLocation` VARCHAR(100) NOT NULL,
  `PostalAddressLine1` VARCHAR(60) NOT NULL,
  `PostalAddressLine2` VARCHAR(60) NULL DEFAULT NULL,
  `PostalCityID` INT(11) NOT NULL,
  `PostalPostalCode` VARCHAR(10) NOT NULL,
  `ApplicationSettings` LONGTEXT NOT NULL,
  `LastEditedBy` INT(11) NOT NULL,
  `LastEditedWhen` DATETIME NOT NULL,
  PRIMARY KEY (`SystemParameterID`),
  INDEX `FK_Application_SystemParameters_DeliveryCityID` (`DeliveryCityID` ASC),
  INDEX `FK_Application_SystemParameters_PostalCityID` (`PostalCityID` ASC),
  CONSTRAINT `FK_Application_SystemParameters_DeliveryCityID_Application_Cit1`
    FOREIGN KEY (`DeliveryCityID`)
    REFERENCES `wideworldimporters`.`cities` (`CityID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Application_SystemParameters_PostalCityID_Application_Cities`
    FOREIGN KEY (`PostalCityID`)
    REFERENCES `wideworldimporters`.`cities` (`CityID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `wideworldimporters`.`transactiontypes_archive`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wideworldimporters`.`transactiontypes_archive` (
  `TransactionTypeID` INT(11) NOT NULL,
  `TransactionTypeName` VARCHAR(50) NOT NULL,
  `LastEditedBy` INT(11) NOT NULL,
  `ValidFrom` DATETIME NOT NULL,
  `ValidTo` DATETIME NOT NULL,
  INDEX `ix_TransactionTypes_Archive` (`ValidFrom` ASC, `ValidTo` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `wideworldimporters`.`vehicletemperatures`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wideworldimporters`.`vehicletemperatures` (
  `VehicleTemperatureID` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `VehicleRegistration` VARCHAR(20) NOT NULL,
  `ChillerSensorNumber` INT(11) NOT NULL,
  `RecordedWhen` DATETIME NOT NULL,
  `Temperature` DECIMAL(10,2) NOT NULL,
  `FullSensorData` VARCHAR(1000) NULL DEFAULT NULL,
  `IsCompressed` TINYINT(1) NOT NULL,
  `CompressedSensorData` LONGBLOB NULL DEFAULT NULL,
  PRIMARY KEY (`VehicleTemperatureID`))
ENGINE = InnoDB
AUTO_INCREMENT = 65999
DEFAULT CHARACTER SET = latin1;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
