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
-- Table `axobasepsy`.`interusers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `axobasepsy`.`interusers` (
  `iusernum` INT NOT NULL AUTO_INCREMENT,
  `iuser` VARCHAR(20) NULL DEFAULT NULL,
  `iage` INT(2) NULL DEFAULT NULL,
  `iemail` VARCHAR(70) NULL DEFAULT NULL,
  `ipassword` VARCHAR(25) NULL DEFAULT NULL,
  `irol` VARCHAR(20) NULL DEFAULT NULL,
  `iimgnum` VARCHAR(20) NULL DEFAULT 'profilesidebar3.png',
  `iuserseguidores` INT NULL DEFAULT '0',
  `iuserseguidos` INT NULL DEFAULT '0',
  `iuserdescription` VARCHAR(500) NULL DEFAULT 'Esta es mi descripcion',
  `iuserdate` VARCHAR(70) NULL DEFAULT 'lunes 4 de marzo 2024',
  `iuserhour` VARCHAR(70) NULL DEFAULT '00:00:00',
  PRIMARY KEY (`iusernum`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;

-- -----------------------------------------------------
-- Table `axobasepsy`.`interclinic`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `axobasepsy`.`interclinic` (
  `clinicnum` INT NOT NULL AUTO_INCREMENT,
  `clinic` VARCHAR(70) NULL DEFAULT NULL,
  `clinicimgnum` VARCHAR(20) NULL DEFAULT 'profilesidebar3.png',
  `clinictel` VARCHAR(25) NOT NULL,
  `clinicstreetnum` VARCHAR(30) NOT NULL, 
  `clinicstate` VARCHAR(30) NOT NULL,
  `cliniccode` VARCHAR(15) NOT NULL,
  `clinicdate` VARCHAR(70) NOT NULL DEFAULT 'lunes 4 de marzo 2024',
  `clinichour` VARCHAR(70) NOT NULL DEFAULT '00:00:00',
  `cliniclatitud` VARCHAR(30) NOT NULL,
  `cliniclongitud` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`clinicnum`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;

-- -----------------------------------------------------
-- Table `axobasepsy`.`interclinicusers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `axobasepsy`.`interclinicusers` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `iusernum` INT NOT NULL,
  `clinicnum` INT NOT NULL,
  `rol` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_iusernum_idx` (`iusernum` ASC),
  INDEX `fk_clinicnum_idx` (`clinicnum` ASC),
  CONSTRAINT `fk_iusernum`
    FOREIGN KEY (`iusernum`)
    REFERENCES `axobasepsy`.`interusers` (`iusernum`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_clinicnum`
    FOREIGN KEY (`clinicnum`)
    REFERENCES `axobasepsy`.`interclinic` (`clinicnum`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- -----------------------------------------------------
-- Table `axobasepsy`.`interpsico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `axobasepsy`.`interpsico` (
  `psiconum` INT NOT NULL AUTO_INCREMENT,
  `psiconom` VARCHAR(50) NULL DEFAULT NULL,
  `psicotel` INT(25) NOT NULL,
  `psicostreetnum` VARCHAR(30) NOT NULL,
  `psicostate` VARCHAR(30) NOT NULL,
  `psicocode` VARCHAR(15) NOT NULL,
  `psicoidiom` VARCHAR(30) NOT NULL,
  `psicolatitud` VARCHAR(30) NOT NULL,
  `psicolongitud` VARCHAR(30) NOT NULL,
  `psicocal` FLOAT NULL DEFAULT 5,
  PRIMARY KEY (`psiconum`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;

-- -----------------------------------------------------
-- Table `axobasepsy`.`interemotion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `axobasepsy`.`interemotion` (
  `emotionnum` BIGINT NOT NULL AUTO_INCREMENT,
  `emotionnumuser` INT NOT NULL,
  `emotion` VARCHAR(10) NULL DEFAULT NULL,
  `emotiontagemotion` VARCHAR(50) NOT NULL,
  `emotiontagsituation` VARCHAR(50) NOT NULL,
  `emotioncoment` VARCHAR(100) DEFAULT NULL,
  `emotiondate` TEXT NULL DEFAULT NULL,
  `emotionhour` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`emotionnum`),
  CONSTRAINT `fk_emotionnumuser`
    FOREIGN KEY (`emotionnumuser`)
    REFERENCES `axobasepsy`.`interusers` (`iusernum`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `axobasepsy`.`interpub`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `axobasepsy`.`interpub` (
  `pubnumid` INT NOT NULL AUTO_INCREMENT,
  `pubcont` TEXT(1250) NULL DEFAULT NULL,
  `pubmg` INT NULL DEFAULT '0',
  `pubfavs` INT NULL DEFAULT '0',
  `pubcoment` INT NULL DEFAULT '0',
  `pubdate` TEXT NULL DEFAULT NULL,
  `pubhour` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`pubnumid`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
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
)  ENGINE=INNODB DEFAULT CHARACTER SET= utf8;



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


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
