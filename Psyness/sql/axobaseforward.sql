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
CREATE SCHEMA IF NOT EXISTS `axobase` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `axobase` ;

-- -----------------------------------------------------
-- Table `axobase`.`interpub`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `axobase`.`interpub` (
  `pubnumid` INT NOT NULL AUTO_INCREMENT,
  `pubcont` TEXT NULL DEFAULT NULL,
  `pubmg` INT NULL DEFAULT '0',
  PRIMARY KEY (`pubnumid`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `axobase`.`interusers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `axobase`.`interusers` (
  `iusernum` INT NOT NULL AUTO_INCREMENT,
  `iuser` VARCHAR(15) NULL DEFAULT NULL,
  `iage` VARCHAR(2) NULL DEFAULT NULL,
  `iemail` VARCHAR(40) NULL DEFAULT NULL,
  `ipassword` VARCHAR(25) NULL DEFAULT NULL,
  `iimgnum` VARCHAR(20) NULL DEFAULT NULL,
  `iuserseguidores` INT NULL DEFAULT '0',
  `iuserseguidos` INT NULL DEFAULT '0',
  PRIMARY KEY (`iusernum`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `axobase`.`interfav`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `axobase`.`interfav` (
  `favidpub` INT NULL DEFAULT NULL,
  `faviduser` INT NULL DEFAULT NULL,
  INDEX `favidpub` (`favidpub` ASC) VISIBLE,
  INDEX `faviduser` (`faviduser` ASC) VISIBLE,
  CONSTRAINT `interfav_ibfk_1`
    FOREIGN KEY (`favidpub`)
    REFERENCES `axobase`.`interpub` (`pubnumid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `interfav_ibfk_2`
    FOREIGN KEY (`faviduser`)
    REFERENCES `axobase`.`interusers` (`iusernum`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `axobase`.`interflow`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `axobase`.`interflow` (
  `flowseguidoresid` INT NULL DEFAULT NULL,
  `flowseguidoid` INT NULL DEFAULT NULL,
  INDEX `flowseguidoresid` (`flowseguidoresid` ASC) VISIBLE,
  INDEX `flowseguidoid` (`flowseguidoid` ASC) VISIBLE,
  CONSTRAINT `interflow_ibfk_1`
    FOREIGN KEY (`flowseguidoresid`)
    REFERENCES `axobase`.`interusers` (`iusernum`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `interflow_ibfk_2`
    FOREIGN KEY (`flowseguidoid`)
    REFERENCES `axobase`.`interusers` (`iusernum`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `axobase`.`interuserspub`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `axobase`.`interuserspub` (
  `pubnumid` INT NOT NULL AUTO_INCREMENT,
  `iusernum` INT NULL DEFAULT NULL,
  INDEX `pubnumid` (`pubnumid` ASC) VISIBLE,
  INDEX `iusernum` (`iusernum` ASC) VISIBLE,
  CONSTRAINT `interuserspub_ibfk_1`
    FOREIGN KEY (`pubnumid`)
    REFERENCES `axobase`.`interpub` (`pubnumid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `interuserspub_ibfk_2`
    FOREIGN KEY (`iusernum`)
    REFERENCES `axobase`.`interusers` (`iusernum`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
