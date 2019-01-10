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
-- Table `wideworldimporters`.`bezoeken`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wideworldimporters`.`bezoeken` (
  `idbezoeken` INT(11) NOT NULL AUTO_INCREMENT,
  `bezoeker` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idbezoeken`))
ENGINE = InnoDB
AUTO_INCREMENT = 10
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `wideworldimporters`.`conversie`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wideworldimporters`.`conversie` (
  `bestelling` INT(11) NOT NULL AUTO_INCREMENT,
  `bedrag` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`bestelling`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = latin1;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
