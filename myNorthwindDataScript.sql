SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;

USE `northwind`;

INSERT INTO `Categories`(`CategoryID`,`CategoryName`,`Description`) VALUES(1,'Beverages','Soft drinks, coffees, teas, beers, and ales');
INSERT INTO `Categories`(`CategoryID`,`CategoryName`,`Description`) VALUES(2,'Condiments','Sweet and savory sauces, relishes, spreads, and seasonings');
INSERT INTO `Categories`(`CategoryID`,`CategoryName`,`Description`) VALUES(3,'Confections','Desserts, candies, and sweet breads');
INSERT INTO `Categories`(`CategoryID`,`CategoryName`,`Description`) VALUES(4,'Dairy Products','Cheeses');
INSERT INTO `Categories`(`CategoryID`,`CategoryName`,`Description`) VALUES(5,'Grains/Cereals','Breads, crackers, pasta, and cereal');
INSERT INTO `Categories`(`CategoryID`,`CategoryName`,`Description`) VALUES(6,'Meat/Poultry','Prepared meats');
INSERT INTO `Categories`(`CategoryID`,`CategoryName`,`Description`) VALUES(7,'Produce','Dried fruit and bean curd');
INSERT INTO `Categories`(`CategoryID`,`CategoryName`,`Description`) VALUES(8,'Seafood','Seaweed and fish');

SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
