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
  `BirthDate` VARCHAR(10) NULL DEFAULT NULL,
  `HireDate` VARCHAR(10) NULL DEFAULT NULL,
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
  `CustomerID` VARCHAR(5) NOT NULL,
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


-- -----------------------------------------------------
-- Table `northwind`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `northwind`.`orders` (
  `OrderID` INT NOT NULL AUTO_INCREMENT,
  `CustomerID` VARCHAR(5) NOT NULL,
  `EmployeeID` INT NULL DEFAULT NULL,
  `OrderDate` DATETIME NULL DEFAULT NULL,
  `RequiredDate` DATETIME NULL DEFAULT NULL,
  `ShippedDate` DATETIME NULL DEFAULT NULL,
  `ShipVia` INT NULL DEFAULT NULL,
  `Freight` DECIMAL(15,2) NULL DEFAULT 0,
  `ShipName` VARCHAR(40) NULL DEFAULT NULL,
  `ShipAddress` VARCHAR(60) NULL DEFAULT NULL,
  `ShipCity` VARCHAR(15) NULL DEFAULT NULL,
  `ShipRegion` VARCHAR(15) NULL DEFAULT NULL,
  `ShipPostalCode` VARCHAR(10) NULL DEFAULT NULL,
  `ShipCountry` VARCHAR(15) NULL DEFAULT NULL,
  PRIMARY KEY CLUSTERED (`OrderID`),
  FOREIGN KEY (`CustomerID`) REFERENCES `northwind`.`customers` (`CustomerID`),
  FOREIGN KEY (`EmployeeID`) REFERENCES `northwind`.`employees` (`EmployeeID`),
  FOREIGN KEY (`ShipVia`) REFERENCES `northwind`.`shippers` (`ShipperID`),
  INDEX `CustomerID` (`CustomerID` ASC),
  INDEX `CustomersOrders` (`CustomerID` ASC),
  INDEX `EmployeeID` (`EmployeeID` ASC),
  INDEX `EmployeesOrders` (`EmployeeID` ASC),
  INDEX `OrderDate` (`OrderDate` ASC),
  INDEX `ShippedDate` (`ShippedDate` ASC),
  INDEX `ShippersOrders` (`ShipVia` ASC),
  INDEX `ShipPostalCode` (`ShipPostalCode` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `northwind`.`products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `northwind`.`products` (
  `ProductID` INT NOT NULL AUTO_INCREMENT,
  `ProductName` VARCHAR(40) NOT NULL,
  `SupplierID` INT NULL DEFAULT NULL,
  `CategoryID` INT NULL DEFAULT NULL,
  `QuantityPerUnit` VARCHAR(20) NULL DEFAULT NULL,
  `UnitPrice` DECIMAL(15,2) NULL DEFAULT 0,
  `UnitsInStock` SMALLINT NULL DEFAULT 0,
  `UnitsOnOrder` SMALLINT NULL DEFAULT 0,
  `ReorderLevel` SMALLINT NULL DEFAULT 0,
  `Discontinued` BIT NOT NULL DEFAULT 0,
  PRIMARY KEY CLUSTERED (`ProductID`),
  FOREIGN KEY (`CategoryID`) REFERENCES `northwind`.`categories` (`CategoryID`),
  FOREIGN KEY (`SupplierID`) REFERENCES `northwind`.`suppliers` (`SupplierID`),
  -- Northwind has some CHECKs here too
  -- CONSTRAINT "CK_Products_UnitPrice" CHECK (UnitPrice >= 0),
  -- CONSTRAINT "CK_ReorderLevel" CHECK (ReorderLevel >= 0),
  -- CONSTRAINT "CK_UnitsInStock" CHECK (UnitsInStock >= 0),
  -- CONSTRAINT "CK_UnitsOnOrder" CHECK (UnitsOnOrder >= 0)
  INDEX `CategoryProducts` (`CategoryID` ASC),
  INDEX `CategoryID` (`CategoryID` ASC),
  INDEX `ProductName` (`ProductName` ASC),
  INDEX `SupplierID` (`SupplierID` ASC),
  INDEX `SuppliersProducts` (`SupplierID` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `northwind`.`order details`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `northwind`.`order details` (
  `OrderID` INT NOT NULL,
  `ProductID` INT NOT NULL,
  `UnitPrice` DECIMAL(15,2) NOT NULL DEFAULT 0,
  `Quantity` SMALLINT NOT NULL DEFAULT 1,
  `Discount` REAL NOT NULL DEFAULT 0,
  PRIMARY KEY CLUSTERED (`OrderID`,`ProductID`),
  FOREIGN KEY (`OrderID`) REFERENCES `northwind`.`orders` (`OrderID`),
  FOREIGN KEY (`ProductID`) REFERENCES `northwind`.`products` (`ProductID`),
  -- Northwind has some CHECKs here too
  -- CONSTRAINT "CK_Discount" CHECK (Discount >= 0 and (Discount <= 1)),
  -- CONSTRAINT "CK_Quantity" CHECK (Quantity > 0),
  -- CONSTRAINT "CK_UnitPrice" CHECK (UnitPrice >= 0)
  INDEX `OrderID` (`OrderID` ASC),
  INDEX `Orders_Order_Details` (`OrderID` ASC),
  INDEX `ProductID` (`ProductID` ASC),
  INDEX `Products_Order_Details` (`ProductID` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- Northwind then creates a bunch of VIEWS, but I'll skip this for now.


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
