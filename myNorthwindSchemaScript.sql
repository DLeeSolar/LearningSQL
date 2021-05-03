SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

DROP SCHEMA IF EXISTS `northwind` ;
CREATE SCHEMA IF NOT EXISTS `northwind` DEFAULT CHARACTER SET latin1 ;
USE `northwind` ;

-- -----------------------------------------------------
-- Table `northwind`.`employees`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `northwind`.`employees` (
  `EmployeeID` INT NOT NULL AUTO_INCREMENT,
  `LastName` VARCHAR(20) NOT NULL,
  `FirstName` VARCHAR(10) NOT NULL,
  `Title` VARCHAR(30) NULL DEFAULT NULL,
  `TitleOfCourtesy` VARCHAR(25) NULL DEFAULT NULL,
  `BirthDate` DATETIME NULL DEFAULT NULL,
  `HireDate` DATETIME NULL DEFAULT NULL,
  `Address` VARCHAR(60) NULL DEFAULT NULL,
  `City` VARCHAR(15) NULL DEFAULT NULL,
  `Region` VARCHAR(15) NULL DEFAULT NULL,
  `PostalCode` VARCHAR(10) NULL DEFAULT NULL,
  `Country` VARCHAR(15) NULL DEFAULT NULL,
  `HomePhone` VARCHAR(24) NULL DEFAULT NULL,
  `Extension` VARCHAR(4) NULL DEFAULT NULL,
  `Photo` BLOB NULL DEFAULT NULL,
  `Notes` LONGTEXT NULL DEFAULT NULL,
  `ReportsTo` INT NULL DEFAULT NULL,
  `PhotoPath` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY CLUSTERED (`EmployeeID`),
  FOREIGN KEY (`ReportsTo`) REFERENCES `northwind`.`employees` (`EmployeeID`),
  -- Northwind has a check here, see below
  -- CONSTRAINT "CK_Birthdate" CHECK (BirthDate < getdate())
  INDEX `LastName` (`LastName` ASC),
  INDEX `PostalCode` (`PostalCode` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `northwind`.`categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `northwind`.`categories` (
  `CategoryID` INT NOT NULL AUTO_INCREMENT,
  `CategoryName` VARCHAR(15) NOT NULL,
  `Description` TEXT NULL DEFAULT NULL,
  `Picture` BLOB NULL DEFAULT NULL,
  PRIMARY KEY CLUSTERED (`CategoryID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `northwind`.`customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `northwind`.`customers` (
  `CustomerID` INT NOT NULL AUTO_INCREMENT,
  `CompanyName` VARCHAR(40) NOT NULL,
  `ContactName` VARCHAR(30) NULL DEFAULT NULL,
  `ContactTitle` VARCHAR(30) NULL DEFAULT NULL,
  `Address` VARCHAR(60) NULL DEFAULT NULL,
  `City` VARCHAR(15) NULL DEFAULT NULL,
  `Region` VARCHAR(15) NULL DEFAULT NULL,
  `PostalCode` VARCHAR(10) NULL DEFAULT NULL,
  `Country` VARCHAR(15) NULL DEFAULT NULL,
  `Phone` VARCHAR(24) NULL DEFAULT NULL,
  `Fax` VARCHAR(24) NULL DEFAULT NULL,
  PRIMARY KEY CLUSTERED (`CustomerId`),
  INDEX `City` (`City` ASC),
  INDEX `CompanyName` (`CompanyName` ASC),
  INDEX `PostalCode` (`PostalCode` ASC),
  INDEX `Region` (`Region` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `northwind`.`shippers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `northwind`.`shippers` (
  `ShipperID` INT NOT NULL AUTO_INCREMENT,
  `CompanyName` VARCHAR(40) NOT NULL,
  `Phone` VARCHAR(24) NULL DEFAULT NULL,
  PRIMARY KEY CLUSTERED (`ShipperID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `northwind`.`suppliers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `northwind`.`suppliers` (
  `SupplierID` INT NOT NULL AUTO_INCREMENT,
  `CompanyName` VARCHAR(40) NOT NULL,
  `ContactName` VARCHAR(30) NULL DEFAULT NULL,
  `ContactTitle` VARCHAR(30) NULL DEFAULT NULL,
  `Address` VARCHAR(60) NULL DEFAULT NULL,
  `City` VARCHAR(15) NULL DEFAULT NULL,
  `Region` VARCHAR(15) NULL DEFAULT NULL,
  `PostalCode` VARCHAR(10) NULL DEFAULT NULL,
  `Country` VARCHAR(15) NULL DEFAULT NULL,
  `Phone` VARCHAR(24) NULL DEFAULT NULL,
  `Fax` VARCHAR(24) NULL DEFAULT NULL,
  `HomePage` LONGTEXT NULL DEFAULT NULL,
  PRIMARY KEY CLUSTERED (`SupplierID`),
  INDEX `CompanyName` (`CompanyName` ASC),
  INDEX `PostalCode` (`PostalCode` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;