-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema axobase
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema axobase
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `axobase` DEFAULT CHARACTER SET utf8mb4 COLLATE=utf8_general_ci;
USE `axobase` ;

-- -----------------------------------------------------
-- Table `axobase`.`interpub`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `axobase`.`interpub` (
  `PubNumId` INT NOT NULL AUTO_INCREMENT,
  `PubCont` TEXT NULL DEFAULT NULL,
  `PubMg` INT NULL DEFAULT NULL,
  PRIMARY KEY (`PubNumId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE=utf8_general_ci;


-- -----------------------------------------------------
-- Table `axobase`.`interusers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `axobase`.`interusers` (
  `IUserNum` INT NOT NULL AUTO_INCREMENT,
  `IUser` VARCHAR(15) NULL DEFAULT NULL,
  `IAge` VARCHAR(2) NULL DEFAULT NULL,
  `IEmail` VARCHAR(40) NULL DEFAULT NULL,
  `IPassword` VARCHAR(25) NULL DEFAULT NULL,
  `IImgNum` VARCHAR(1) NULL DEFAULT NULL,
  PRIMARY KEY (`IUserNum`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE=utf8_general_ci;


-- -----------------------------------------------------
-- Table `axobase`.`interuserspub`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `axobase`.`interuserspub` (
  `PubNumId` INT NOT NULL AUTO_INCREMENT,
  `IUserNum` INT NULL DEFAULT NULL,
  INDEX `PubNumId` (`PubNumId` ASC) ,
  INDEX `IUserNum` (`IUserNum` ASC) ,
  CONSTRAINT `interuserspub_ibfk_1`
    FOREIGN KEY (`PubNumId`)
    REFERENCES `axobase`.`interpub` (`PubNumId`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `interuserspub_ibfk_2`
    FOREIGN KEY (`IUserNum`)
    REFERENCES `axobase`.`interusers` (`IUserNum`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE=utf8_general_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
