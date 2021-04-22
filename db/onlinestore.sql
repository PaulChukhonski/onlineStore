-- MySQL Script generated by MySQL Workbench
-- Mon Mar 15 19:41:03 2021
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema onlinestore
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema onlinestore
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `onlinestore` DEFAULT CHARACTER SET utf8 ;
USE `onlinestore` ;

-- -----------------------------------------------------
-- Table `onlinestore`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `onlinestore`.`user` (
  `userId` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `address` VARCHAR(255) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`userId`),
  UNIQUE INDEX `id_UNIQUE` (`userId` ASC) VISIBLE,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `onlinestore`.`product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `onlinestore`.`product` (
  `productId` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `price` VARCHAR(255) NOT NULL,
  `category` VARCHAR(255) NOT NULL,
  `image` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`productId`),
  UNIQUE INDEX `productId_UNIQUE` (`productId` ASC) VISIBLE,
  UNIQUE INDEX `image_UNIQUE` (`image` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `onlinestore`.`user`
-- -----------------------------------------------------
START TRANSACTION;
USE `onlinestore`;
INSERT INTO `onlinestore`.`user` (`userId`, `name`, `email`, `address`, `password`) VALUES (1, 'ivan', 'ivanov@gmail.com', 'nemiga', 'qwerty1');
INSERT INTO `onlinestore`.`user` (`userId`, `name`, `email`, `address`, `password`) VALUES (2, 'petr', 'petrov.petr@gmail.com', 'nekrasova', '12ios52');
INSERT INTO `onlinestore`.`user` (`userId`, `name`, `email`, `address`, `password`) VALUES (3, 'pasha', 'pasha@gmail.com', 'road', '123456q');

COMMIT;


-- -----------------------------------------------------
-- Data for table `onlinestore`.`product`
-- -----------------------------------------------------
START TRANSACTION;
USE `onlinestore`;
INSERT INTO `onlinestore`.`product` (`productId`, `name`, `price`, `category`, `image`) VALUES (1, 'asus', '2000', 'laptop', 'img/asus.jpg');
INSERT INTO `onlinestore`.`product` (`productId`, `name`, `price`, `category`, `image`) VALUES (2, 'acer', '1900', 'laptop', 'img/acer.jpg');
INSERT INTO `onlinestore`.`product` (`productId`, `name`, `price`, `category`, `image`) VALUES (3, 'lenovo', '1500', 'laptop', 'img/lenovo.jpg');
INSERT INTO `onlinestore`.`product` (`productId`, `name`, `price`, `category`, `image`) VALUES (4, 'samsung', '400', 'smartphone', 'img/samsung.jpg');

COMMIT;

