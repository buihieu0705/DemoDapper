-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema test1
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema test1
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `test1` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `test1` ;

-- -----------------------------------------------------
-- Table `test1`.`category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `test1`.`category` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `categoryname` VARCHAR(45) NULL DEFAULT NULL,
  `status` TINYINT NULL DEFAULT '1',
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `test1`.`products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `test1`.`products` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `productname` VARCHAR(45) NULL DEFAULT NULL,
  `price` DOUBLE NULL DEFAULT NULL,
  `description` LONGTEXT NULL DEFAULT NULL,
  `categoryid` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `categoryid_idx` (`categoryid` ASC) VISIBLE,
  CONSTRAINT `categoryid`
    FOREIGN KEY (`categoryid`)
    REFERENCES `test1`.`category` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
