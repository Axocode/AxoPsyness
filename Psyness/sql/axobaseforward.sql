-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema axobasepsy
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema axobasepsy
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `axobasepsy` DEFAULT CHARACTER SET utf8;
USE `axobasepsy` ;

-- -----------------------------------------------------
-- Table `axobasepsy`.`intercodes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `axobasepsy`.`intercodes` (
  `codescode` VARCHAR(10) NOT NULL,
  `codesstatus` VARCHAR(15) NULL DEFAULT 'unused',
  PRIMARY KEY (`codescode`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `axobasepsy`.`interpub`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `axobasepsy`.`interpub` (
  `pubnumid` INT NOT NULL AUTO_INCREMENT,
  `pubcont` TEXT NULL DEFAULT NULL,
  `pubmg` INT NULL DEFAULT '0',
  `pubdate` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`pubnumid`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `axobasepsy`.`interusers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `axobasepsy`.`interusers` (
  `iusernum` INT NOT NULL AUTO_INCREMENT,
  `iuser` VARCHAR(15) NULL DEFAULT NULL,
  `iage` VARCHAR(2) NULL DEFAULT NULL,
  `iemail` VARCHAR(40) NULL DEFAULT NULL,
  `ipassword` VARCHAR(25) NULL DEFAULT NULL,
  `irol` VARCHAR(20) NULL DEFAULT NULL,
  `iimgnum` VARCHAR(20) NULL DEFAULT NULL,
  `iuserseguidores` INT NULL DEFAULT '0',
  `iuserseguidos` INT NULL DEFAULT '0',
  PRIMARY KEY (`iusernum`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;

insert into interusers(iuser,iage,iemail,ipassword,irol) values('Axocode','99','axocode0@gmail.como','losquieromuchoaxocode','Administrador');
-- -----------------------------------------------------
-- Table `axobasepsy`.`interfav`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `axobasepsy`.`interfav` (
  `favidpub` INT NULL DEFAULT NULL,
  `faviduser` INT NULL DEFAULT NULL,
  INDEX `favidpub` (`favidpub` ASC) ,
  INDEX `faviduser` (`faviduser` ASC) ,
  CONSTRAINT `interfav_ibfk_1`
    FOREIGN KEY (`favidpub`)
    REFERENCES `axobasepsy`.`interpub` (`pubnumid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `interfav_ibfk_2`
    FOREIGN KEY (`faviduser`)
    REFERENCES `axobasepsy`.`interusers` (`iusernum`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `axobasepsy`.`interflow`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `axobasepsy`.`interflow` (
  `flowseguidoresid` INT NULL DEFAULT NULL,
  `flowseguidoid` INT NULL DEFAULT NULL,
  INDEX `flowseguidoresid` (`flowseguidoresid` ASC) ,
  INDEX `flowseguidoid` (`flowseguidoid` ASC) ,
  CONSTRAINT `interflow_ibfk_1`
    FOREIGN KEY (`flowseguidoresid`)
    REFERENCES `axobasepsy`.`interusers` (`iusernum`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `interflow_ibfk_2`
    FOREIGN KEY (`flowseguidoid`)
    REFERENCES `axobasepsy`.`interusers` (`iusernum`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- -----------------------------------------------------
-- Table `axobasepsy`.`interuserscode`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `axobasepsy`.`interuserscode` (
  `iusernum` INT NULL DEFAULT NULL,
  `codescode` VARCHAR(10) NULL DEFAULT NULL,
  INDEX `iusernum` (`iusernum` ASC) ,
  INDEX `codescode` (`codescode` ASC) ,
  CONSTRAINT `interuserscode_ibfk_1`
    FOREIGN KEY (`iusernum`)
    REFERENCES `axobasepsy`.`interusers` (`iusernum`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `interuserscode_ibfk_2`
    FOREIGN KEY (`codescode`)
    REFERENCES `axobasepsy`.`intercodes` (`codescode`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- -----------------------------------------------------
-- Table `axobasepsy`.`interuserspub`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `axobasepsy`.`interuserspub` (
  `pubnumid` INT NOT NULL AUTO_INCREMENT,
  `iusernum` INT NULL DEFAULT NULL,
  INDEX `pubnumid` (`pubnumid` ASC) ,
  INDEX `iusernum` (`iusernum` ASC) ,
  CONSTRAINT `interuserspub_ibfk_1`
    FOREIGN KEY (`pubnumid`)
    REFERENCES `axobasepsy`.`interpub` (`pubnumid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `interuserspub_ibfk_2`
    FOREIGN KEY (`iusernum`)
    REFERENCES `axobasepsy`.`interusers` (`iusernum`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

insert into intercodes(codescode) values('1234567890'),('0123456789'),('9012345678'),('8901234567'),('7890123456')