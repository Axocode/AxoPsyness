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
  `pubcont` TEXT(1250) NULL DEFAULT NULL,
  `pubmg` INT NULL DEFAULT '0',
  `pubdate` TEXT NULL DEFAULT NULL,
  `pubhour` TEXT NULL DEFAULT NULL,
  `pubnum` INT NULL DEFAULT '0',
  PRIMARY KEY (`pubnumid`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;

-- -----------------------------------------------------
-- Table `axobasepsy`.`interpsico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `axobasepsy`.`interpsico` (
  `psiconum` INT NULL DEFAULT NULL,
  `psicodescription` TEXT(1250) NULL DEFAULT NULL,
  `psicoimg` TEXT NULL DEFAULT NULL,
  `psicocali` FLOAT NULL DEFAULT 5,
  INDEX `psiconum` (`psiconum` ASC) ,
  CONSTRAINT `interpsico_ibfk_1`
    FOREIGN KEY (`psiconum`)
    REFERENCES `axobasepsy`.`interusers` (`iusernum`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
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
  `iimgnum` VARCHAR(20) NULL DEFAULT 'profilesidebar3.png',
  `iuserseguidores` INT NULL DEFAULT '0',
  `iuserseguidos` INT NULL DEFAULT '0',
  `iuserdescription` VARCHAR(100) NULL DEFAULT 'Esta es mi descripcion',
  PRIMARY KEY (`iusernum`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;

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

-- -----------------------------------------------------
-- Table `axobasepsy`.`interlove`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `axobasepsy`.`interlove` (
  `loveidpub` INT NULL DEFAULT NULL,
  `loveiduser` INT NULL DEFAULT NULL,
  INDEX `loveidpub` (`loveidpub` ASC) ,
  INDEX `loveiduser` (`loveiduser` ASC) ,
  CONSTRAINT `interlove_ibfk_1`
    FOREIGN KEY (`loveidpub`)
    REFERENCES `axobasepsy`.`interpub` (`pubnumid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `interlove_ibfk_2`
    FOREIGN KEY (`loveiduser`)
    REFERENCES `axobasepsy`.`interusers` (`iusernum`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `axobasepsy`.`intercoment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `axobasepsy`.`intercoment` (
    `idcoment` INT NOT NULL AUTO_INCREMENT,
    `comentcontenido` TEXT(500) NULL DEFAULT NULL,
    `comentlikes` INT NULL DEFAULT 0,
    `comentdislikes` INT NULL DEFAULT 0,
	`comentdate` TEXT NULL DEFAULT NULL,
    `comenthour` TEXT NULL DEFAULT NULL,
    `iusernum` INT NULL DEFAULT NULL,
    `pubnumid` INT NULL DEFAULT NULL,
    INDEX `pubnumid_idx` (`pubnumid` ASC),
    CONSTRAINT `intercoment_ibfk_1` FOREIGN KEY (`pubnumid`)
        REFERENCES `axobasepsy`.`interpub` (`pubnumid`)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `intercoment_ibfk_2` FOREIGN KEY (`iusernum`)
        REFERENCES `axobasepsy`.`interusers` (`iusernum`)
        ON DELETE CASCADE ON UPDATE CASCADE,
    PRIMARY KEY (`idcoment`)
)  ENGINE=INNODB DEFAULT CHARACTER SET=UTF8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

insert into interusers(iuser,iage,iemail,ipassword,irol) values('Axocode','99','axocode0@gmail.como','losquieromuchoaxocode','Administrador');

insert into intercodes(codescode) values('1234567890'),('0123456789'),('9012345678'),('8901234567'),('7890123456')