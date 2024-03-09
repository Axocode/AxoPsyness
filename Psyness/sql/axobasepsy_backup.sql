-- MySQL dump 10.13  Distrib 5.7.42, for Linux (x86_64)
--
-- Host: localhost    Database: axobasepsy
-- ------------------------------------------------------
-- Server version	5.7.42-0ubuntu0.18.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `interclinic`
--

DROP TABLE IF EXISTS `interclinic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `interclinic` (
  `clinicnum` int(11) NOT NULL AUTO_INCREMENT,
  `clinic` varchar(70) DEFAULT NULL,
  `clinicimgnum` varchar(20) DEFAULT 'profilesidebar3.png',
  `clinictel` varchar(25) NOT NULL,
  `clinicstreetnum` varchar(30) NOT NULL,
  `clinicstate` varchar(30) NOT NULL,
  `cliniccode` varchar(15) NOT NULL,
  `clinicdate` varchar(70) NOT NULL DEFAULT 'lunes 4 de marzo 2024',
  `clinichour` varchar(70) NOT NULL DEFAULT '00:00:00',
  `cliniclatitud` varchar(30) NOT NULL,
  `cliniclongitud` varchar(30) NOT NULL,
  PRIMARY KEY (`clinicnum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interclinic`
--

LOCK TABLES `interclinic` WRITE;
/*!40000 ALTER TABLE `interclinic` DISABLE KEYS */;
/*!40000 ALTER TABLE `interclinic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interclinicusers`
--

DROP TABLE IF EXISTS `interclinicusers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `interclinicusers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `iusernum` int(11) NOT NULL,
  `clinicnum` int(11) NOT NULL,
  `rol` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_iusernum_idx` (`iusernum`),
  KEY `fk_clinicnum_idx` (`clinicnum`),
  CONSTRAINT `fk_clinicnum` FOREIGN KEY (`clinicnum`) REFERENCES `interclinic` (`clinicnum`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_iusernum` FOREIGN KEY (`iusernum`) REFERENCES `interusers` (`iusernum`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interclinicusers`
--

LOCK TABLES `interclinicusers` WRITE;
/*!40000 ALTER TABLE `interclinicusers` DISABLE KEYS */;
/*!40000 ALTER TABLE `interclinicusers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `intercodes`
--

DROP TABLE IF EXISTS `intercodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `intercodes` (
  `codescode` varchar(10) NOT NULL,
  `codesstatus` varchar(15) DEFAULT 'unused',
  PRIMARY KEY (`codescode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `intercodes`
--

LOCK TABLES `intercodes` WRITE;
/*!40000 ALTER TABLE `intercodes` DISABLE KEYS */;
INSERT INTO `intercodes` VALUES ('0123456789','unused'),('1234567890','Yojan UwUñ'),('7890123456','unused'),('8901234567','Axel5136'),('9012345678','Cebollita24');
/*!40000 ALTER TABLE `intercodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `intercoment`
--

DROP TABLE IF EXISTS `intercoment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `intercoment` (
  `idcoment` int(11) NOT NULL AUTO_INCREMENT,
  `comentcontenido` text,
  `comentlikes` int(11) DEFAULT '0',
  `comentdislikes` int(11) DEFAULT '0',
  `comentdate` text,
  `comenthour` text,
  `iusernum` int(11) DEFAULT NULL,
  `pubnumid` int(11) DEFAULT NULL,
  PRIMARY KEY (`idcoment`),
  KEY `pubnumid_idx` (`pubnumid`),
  KEY `intercoment_ibfk_2` (`iusernum`),
  CONSTRAINT `intercoment_ibfk_1` FOREIGN KEY (`pubnumid`) REFERENCES `interpub` (`pubnumid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `intercoment_ibfk_2` FOREIGN KEY (`iusernum`) REFERENCES `interusers` (`iusernum`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `intercoment`
--

LOCK TABLES `intercoment` WRITE;
/*!40000 ALTER TABLE `intercoment` DISABLE KEYS */;
INSERT INTO `intercoment` VALUES (1,'Hola mel te quiero',0,0,'viernes 1 de diciembre 2023','00:54:19',2,31),(2,'Hola',0,0,'viernes 1 de diciembre 2023','10:14:38',18,38),(3,'Hola ',0,0,'viernes 1 de diciembre 2023','19:39:59',3,45),(4,'Quien es avi?',0,0,'sábado 2 de diciembre 2023','23:45:00',2,48),(5,'Los odio a todos',0,0,'domingo 3 de diciembre 2023','00:26:35',23,48),(6,'Los odio a todos',0,0,'domingo 3 de diciembre 2023','00:26:35',23,48),(7,'Los odio a todos',0,0,'domingo 3 de diciembre 2023','00:26:35',23,48),(8,'Los odio a todos',0,0,'domingo 3 de diciembre 2023','00:26:35',23,48),(9,'Los odio a todos',0,0,'domingo 3 de diciembre 2023','00:26:35',23,48),(10,'Los odio a todos',0,0,'domingo 3 de diciembre 2023','00:26:35',23,48),(11,'Los odio a todos',0,0,'domingo 3 de diciembre 2023','00:26:35',23,48),(14,'ok?',0,0,'domingo 3 de diciembre 2023','01:36:57',2,48),(15,'oye  cham que grosero',0,0,'domingo 3 de diciembre 2023','16:18:03',4,48),(17,'La nariz polveando, me siento viajado',0,0,'domingo 3 de diciembre 2023','22:16:45',2,50),(19,'Traigo buena clika, me la rolo con los morros',0,0,'lunes 4 de diciembre 2023','11:15:37',22,50),(22,'Hola',0,0,'martes 5 de diciembre 2023','10:41:08',4,48),(23,'Hola',0,0,'martes 5 de diciembre 2023','10:41:08',4,48),(24,'Hola',0,0,'martes 5 de diciembre 2023','10:41:08',4,48),(25,'Hola',0,0,'martes 5 de diciembre 2023','10:41:08',4,48),(26,'Hola',0,0,'martes 5 de diciembre 2023','10:41:08',4,48),(27,'Hola',0,0,'martes 5 de diciembre 2023','10:41:08',4,48),(28,'Hola',0,0,'martes 5 de diciembre 2023','10:41:08',4,48),(29,'Hola',0,0,'martes 5 de diciembre 2023','10:41:08',4,48),(30,'Hola',0,0,'martes 5 de diciembre 2023','10:41:08',4,48),(31,'Hola',0,0,'martes 5 de diciembre 2023','10:41:08',4,48),(32,'Hola',0,0,'martes 5 de diciembre 2023','10:41:08',4,48),(33,'Hola',0,0,'martes 5 de diciembre 2023','10:41:08',4,48),(34,'Hola',0,0,'martes 5 de diciembre 2023','10:41:08',4,48),(35,'Hola',0,0,'martes 5 de diciembre 2023','10:41:08',4,48),(36,'Hola',0,0,'martes 5 de diciembre 2023','10:41:08',4,48),(37,'Hola',0,0,'martes 5 de diciembre 2023','10:41:08',4,48),(38,'Hola',0,0,'martes 5 de diciembre 2023','10:41:08',4,48),(39,'Hola',0,0,'martes 5 de diciembre 2023','10:41:08',4,48),(40,'Hola',0,0,'martes 5 de diciembre 2023','10:41:08',4,48),(41,'Hola',0,0,'martes 5 de diciembre 2023','10:41:08',4,48),(42,'Hola',0,0,'martes 5 de diciembre 2023','10:41:08',4,48),(43,'Hola',0,0,'martes 5 de diciembre 2023','10:41:08',4,48),(45,'como estas?',0,0,'miércoles 6 de diciembre 2023','10:37:36',1,67),(46,'I love axocode',0,0,'miércoles 6 de diciembre 2023','10:38:02',29,67),(47,'Ojala te mueras',0,0,'miércoles 6 de diciembre 2023','13:20:06',2,8),(48,'Manjarrez tirando factos\r\n',0,0,'miércoles 6 de diciembre 2023','13:44:17',33,73),(49,'Hola a todos si pase Química',0,0,'martes 12 de diciembre 2023','14:09:44',2,83),(50,'también las tortas batiz',0,0,'martes 12 de diciembre 2023','14:39:51',37,84),(51,'Si we?',0,0,'martes 12 de diciembre 2023','20:52:49',43,36),(52,'para detectar discurso de odio en las publicaciones y que la gente no haga mal uso de la aplicación ',0,0,'jueves 14 de diciembre 2023','05:32:33',2,85),(53,'Holi',0,0,'jueves 14 de diciembre 2023','07:54:19',1,85),(54,'Ok. Yo odio a todos',0,0,'viernes 15 de diciembre 2023','19:14:11',46,87),(55,'gracias eres la mejor',0,0,'domingo 24 de diciembre 2023','02:24:52',2,92),(56,'no sirve la IA',0,0,'viernes 29 de diciembre 2023','03:33:54',2,93),(57,'como le doy retuit??????',0,0,'sábado 6 de enero 2024','05:28:55',2,95),(60,'https://youtu.be/2de-ZgePYf4?si=h7FYD_40K3kpWkZO',0,0,'sábado 13 de enero 2024','22:49:43',2,103),(61,'https://youtu.be/ti-8C6od6ME?si=eU-v2-oG35HrEmQP',0,0,'sábado 13 de enero 2024','22:49:58',2,103),(62,'Gracias por compartir',0,0,'sábado 13 de enero 2024','22:56:17',1,95),(63,'hola',0,0,'miércoles 17 de enero 2024','00:21:10',54,104),(64,'Holaaaaaaaaaaaaaaaaaaa',0,0,'miércoles 17 de enero 2024','17:18:13',2,106),(65,'Te juro que me siento solo',0,0,'domingo 21 de enero 2024','20:24:36',2,109),(66,'primer comentario?',0,0,'lunes 19 de febrero 2024','00:49:17',2,125),(67,'escribiendo desde Yojan UwUñ',0,0,'lunes 19 de febrero 2024','00:50:21',2,127),(68,'POR QUE COÑO DICE QUE LO PÚBLICO AXEL',0,0,'lunes 19 de febrero 2024','00:50:36',2,127),(69,'comentario desde Axocode ',0,0,'lunes 19 de febrero 2024','00:51:53',1,127),(70,'okey los comentarios están en número de persona + 1 gg',0,0,'lunes 19 de febrero 2024','00:52:10',1,127),(71,'hola',0,0,'lunes 19 de febrero 2024','00:52:36',1,127),(72,'vale',0,0,'lunes 19 de febrero 2024','00:59:27',1,127),(73,'okey ',0,0,'lunes 19 de febrero 2024','00:59:35',1,127),(74,'no entiendo el orden de los comentarios ',0,0,'lunes 19 de febrero 2024','01:00:14',1,127),(75,'no sirve esta porquería d página (la hice yo)',0,0,'lunes 19 de febrero 2024','01:00:52',1,127),(76,'vale',0,0,'lunes 19 de febrero 2024','01:01:27',1,127),(77,'ojalá hubiéramos hecho el proyecto sobre el restaurante del papá de gayosso',0,0,'lunes 19 de febrero 2024','01:01:45',1,127),(80,'gg arreglada',0,0,'lunes 19 de febrero 2024','09:35:36',2,129),(81,'ya los arregle',0,0,'lunes 19 de febrero 2024','09:36:45',2,127),(82,'ggg g g g g g gg                  gggg',0,0,'lunes 19 de febrero 2024','09:38:48',2,130),(83,'hola soy Axel',0,0,'lunes 19 de febrero 2024','11:46:12',2,130),(84,'la cabra hermano\n',0,0,'martes 20 de febrero 2024','08:26:46',67,133),(85,'dscs',0,0,'martes 20 de febrero 2024','08:28:00',1,134),(86,'hola tmb te quiero mucho',0,0,'martes 20 de febrero 2024','08:42:23',66,135),(87,'tambien los quiero :)\n',0,0,'martes 20 de febrero 2024','08:42:20',67,135),(88,'hola',0,0,'martes 20 de febrero 2024','08:42:01',1,135),(89,'no',0,0,'martes 20 de febrero 2024','08:44:56',1,136),(90,'si pero es mejor ',0,0,'miércoles 21 de febrero 2024','15:19:36',2,136),(91,'olis',0,0,'jueves 22 de febrero 2024','08:21:10',4,137),(92,'Buena, el mío también ',0,0,'domingo 25 de febrero 2024','03:02:50',2,140),(93,'no amor solo paz',0,0,'domingo 25 de febrero 2024','04:19:27',2,148),(94,'te odio',0,0,'lunes 26 de febrero 2024','00:06:29',70,146),(95,'quien eres',0,0,'martes 27 de febrero 2024','01:24:40',2,153),(96,'quien es ana',0,0,'martes 27 de febrero 2024','01:24:55',2,152),(99,'gracias psyness por',0,0,'martes 27 de febrero 2024','21:52:11',57,154),(100,'Volvio la mamá de los pollitos',0,0,'martes 27 de febrero 2024','21:56:22',2,164),(101,'pq estas trsite',0,0,'martes 27 de febrero 2024','23:45:31',2,165),(102,'No estes triste',0,0,'miércoles 28 de febrero 2024','01:38:18',1,165),(103,'fer (vargas)',0,0,'miércoles 28 de febrero 2024','12:33:45',2,167),(104,'Adios',0,0,'jueves 29 de febrero 2024','12:54:20',2,169),(105,'pensionados',0,0,'lunes 4 de marzo 2024','12:26:38',89,172),(106,'yo no puse esos emojis\n',0,0,'lunes 4 de marzo 2024','12:26:50',89,172),(107,'no nos importa',0,0,'martes 5 de marzo 2024','08:02:07',4,173),(108,'perdedora',0,0,'martes 5 de marzo 2024','09:13:36',4,173),(109,'perdedora',0,0,'martes 5 de marzo 2024','09:13:36',4,173);
/*!40000 ALTER TABLE `intercoment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interemotion`
--

DROP TABLE IF EXISTS `interemotion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `interemotion` (
  `emotionnum` bigint(20) NOT NULL AUTO_INCREMENT,
  `emotionnumuser` int(11) NOT NULL,
  `emotion` varchar(10) DEFAULT NULL,
  `emotiontagemotion` varchar(50) NOT NULL,
  `emotiontagsituation` varchar(50) NOT NULL,
  `emotioncoment` varchar(100) DEFAULT NULL,
  `emotiondate` text,
  `emotionhour` text,
  PRIMARY KEY (`emotionnum`),
  KEY `fk_emotionnumuser` (`emotionnumuser`),
  CONSTRAINT `fk_emotionnumuser` FOREIGN KEY (`emotionnumuser`) REFERENCES `interusers` (`iusernum`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interemotion`
--

LOCK TABLES `interemotion` WRITE;
/*!40000 ALTER TABLE `interemotion` DISABLE KEYS */;
/*!40000 ALTER TABLE `interemotion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interfav`
--

DROP TABLE IF EXISTS `interfav`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `interfav` (
  `favidpub` int(11) DEFAULT NULL,
  `faviduser` int(11) DEFAULT NULL,
  KEY `favidpub` (`favidpub`),
  KEY `faviduser` (`faviduser`),
  CONSTRAINT `interfav_ibfk_1` FOREIGN KEY (`favidpub`) REFERENCES `interpub` (`pubnumid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `interfav_ibfk_2` FOREIGN KEY (`faviduser`) REFERENCES `interusers` (`iusernum`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interfav`
--

LOCK TABLES `interfav` WRITE;
/*!40000 ALTER TABLE `interfav` DISABLE KEYS */;
INSERT INTO `interfav` VALUES (1,3),(29,2),(25,2),(31,2),(38,18),(45,3),(23,2),(50,22),(67,30),(87,46),(92,2),(50,2),(112,2),(119,2),(122,59),(121,59),(122,1),(127,1),(133,68),(137,4),(145,2),(140,2),(169,64),(169,2),(167,2),(135,89),(173,3);
/*!40000 ALTER TABLE `interfav` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interflow`
--

DROP TABLE IF EXISTS `interflow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `interflow` (
  `flowseguidoresid` int(11) DEFAULT NULL,
  `flowseguidoid` int(11) DEFAULT NULL,
  KEY `flowseguidoresid` (`flowseguidoresid`),
  KEY `flowseguidoid` (`flowseguidoid`),
  CONSTRAINT `interflow_ibfk_1` FOREIGN KEY (`flowseguidoresid`) REFERENCES `interusers` (`iusernum`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `interflow_ibfk_2` FOREIGN KEY (`flowseguidoid`) REFERENCES `interusers` (`iusernum`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interflow`
--

LOCK TABLES `interflow` WRITE;
/*!40000 ALTER TABLE `interflow` DISABLE KEYS */;
INSERT INTO `interflow` VALUES (2,3),(2,1),(2,7),(4,3),(2,18),(20,3),(13,4),(2,24),(4,22),(2,25),(20,25),(25,24),(28,1),(1,29),(1,31),(1,30),(1,34),(33,34),(2,37),(17,43),(43,1),(1,46);
/*!40000 ALTER TABLE `interflow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interlove`
--

DROP TABLE IF EXISTS `interlove`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `interlove` (
  `loveidpub` int(11) DEFAULT NULL,
  `loveiduser` int(11) DEFAULT NULL,
  KEY `loveidpub` (`loveidpub`),
  KEY `loveiduser` (`loveiduser`),
  CONSTRAINT `interlove_ibfk_1` FOREIGN KEY (`loveidpub`) REFERENCES `interpub` (`pubnumid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `interlove_ibfk_2` FOREIGN KEY (`loveiduser`) REFERENCES `interusers` (`iusernum`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interlove`
--

LOCK TABLES `interlove` WRITE;
/*!40000 ALTER TABLE `interlove` DISABLE KEYS */;
INSERT INTO `interlove` VALUES (2,2),(1,5),(1,6),(7,7),(7,3),(1,3),(4,8),(1,7),(7,4),(15,9),(15,4),(8,2),(17,2),(18,2),(19,9),(19,3),(1,11),(20,2),(25,2),(25,4),(16,4),(25,9),(25,12),(29,12),(29,2),(31,2),(34,4),(34,16),(31,16),(30,16),(34,17),(29,17),(38,18),(46,3),(45,3),(47,13),(47,4),(35,2),(34,2),(48,22),(23,2),(24,2),(50,4),(50,24),(46,24),(50,2),(47,22),(50,22),(1,22),(67,1),(65,2),(73,32),(73,33),(73,34),(73,2),(84,37),(84,2),(84,42),(83,43),(84,43),(85,1),(84,1),(87,46),(94,51),(103,1),(95,1),(95,2),(104,54),(92,2),(104,5),(103,5),(95,5),(94,5),(93,5),(92,5),(91,5),(90,5),(86,5),(1,2),(6,2),(103,4),(103,2),(109,3),(103,56),(15,2),(110,4),(111,57),(112,2),(111,2),(110,2),(114,2),(109,2),(90,2),(121,2),(122,59),(121,59),(122,2),(122,1),(94,2),(113,2),(16,2),(124,2),(125,2),(127,1),(127,2),(133,65),(133,4),(134,1),(135,67),(135,1),(135,66),(136,1),(136,2),(133,68),(135,2),(119,2),(137,2),(138,2),(137,4),(139,2),(139,69),(140,4),(140,2),(145,2),(148,2),(147,2),(146,2),(146,70),(137,71),(138,71),(136,71),(153,2),(152,2),(154,2),(163,75),(163,2),(163,57),(154,57),(164,2),(166,75),(165,2),(165,75),(166,1),(166,2),(163,1),(165,1),(166,79),(165,79),(166,3),(163,3),(167,2),(7,2),(169,88),(165,88),(169,2),(172,89),(67,89),(167,10),(173,3),(173,2),(173,71),(173,13),(173,4),(165,4);
/*!40000 ALTER TABLE `interlove` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interpsico`
--

DROP TABLE IF EXISTS `interpsico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `interpsico` (
  `psiconum` int(11) DEFAULT NULL,
  `psicodescription` text,
  `psicoimg` text,
  `psicocali` float DEFAULT '5',
  KEY `psiconum` (`psiconum`),
  CONSTRAINT `interpsico_ibfk_1` FOREIGN KEY (`psiconum`) REFERENCES `interusers` (`iusernum`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interpsico`
--

LOCK TABLES `interpsico` WRITE;
/*!40000 ALTER TABLE `interpsico` DISABLE KEYS */;
/*!40000 ALTER TABLE `interpsico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interpub`
--

DROP TABLE IF EXISTS `interpub`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `interpub` (
  `pubnumid` int(11) NOT NULL AUTO_INCREMENT,
  `pubcont` text,
  `pubmg` int(11) DEFAULT '0',
  `pubdate` text,
  `pubhour` text,
  PRIMARY KEY (`pubnumid`)
) ENGINE=InnoDB AUTO_INCREMENT=174 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interpub`
--

LOCK TABLES `interpub` WRITE;
/*!40000 ALTER TABLE `interpub` DISABLE KEYS */;
INSERT INTO `interpub` VALUES (1,'Primera publicacion de Psyness 2',7,'miércoles 29 de noviembre 2023','18:56:30'),(2,'queeee',1,'miércoles 29 de noviembre 2023','18:59:21'),(3,'Pues quedo Psyness',0,'miércoles 29 de noviembre 2023','19:01:51'),(4,'chula prendeme el porroooo\r\n',1,'miércoles 29 de noviembre 2023','19:04:19'),(6,'Q bnita página yuju ',1,'miércoles 29 de noviembre 2023','19:44:33'),(7,'Maquíllate otra vez, no vayan a saber lo que te hace este cholo',4,'miércoles 29 de noviembre 2023','19:44:26'),(8,'Omgg, pero qué bonito es psyness, ya me siento mejor uwu',1,'miércoles 29 de noviembre 2023','19:49:36'),(9,'Hola como estan?',0,'miércoles 29 de noviembre 2023','19:50:09'),(10,'como se cambia la foto de perfil\r\n',0,'miércoles 29 de noviembre 2023','20:59:43'),(11,'ya supe',0,'miércoles 29 de noviembre 2023','21:00:10'),(14,'no jala el modelo me voy a matar',0,'miércoles 29 de noviembre 2023','22:18:29'),(15,'Mali Clávala, Mali Clávala',3,'miércoles 29 de noviembre 2023','22:22:21'),(16,'Mali clavala, Mali clavala',2,'miércoles 29 de noviembre 2023','22:24:21'),(17,'Ola',1,'miércoles 29 de noviembre 2023','22:28:36'),(18,'Estoy harto de este proyecto\r\n',1,'miércoles 29 de noviembre 2023','23:08:05'),(19,'ELBOOOOOOO',2,'miércoles 29 de noviembre 2023','23:20:33'),(20,'Ya quedo la aplicacion ',1,'jueves 30 de noviembre 2023','01:06:03'),(21,'Estoy done, pero done bien, pq si no… pelas !',0,'jueves 30 de noviembre 2023','01:43:21'),(22,'Estamos done',0,'miércoles 29 de noviembre 2023','23:20:08'),(23,'ESTAMOS DONE BIEN CABRONES',1,'jueves 30 de noviembre 2023','01:59:31'),(24,'los amo',1,'jueves 30 de noviembre 2023','01:59:42'),(25,'la vida es muy bella feliz cumple a mi los quiero me voy a dormir gpt es el factor lainez omg estoy muy emocionado,ya quedo esta madre besos a todos no se usar comas perdon',4,'jueves 30 de noviembre 2023','02:00:04'),(26,'Tenemos fokin frikin IA',0,'jueves 30 de noviembre 2023','10:59:29'),(29,'Ya andamos también por esta nueva red social mis compas.\r\nPueden hacer preguntas, les voy a estar respondiendo a todos, pero recuerden la solución siempre es MANDARLA ALV MI COMPA.',3,'jueves 30 de noviembre 2023','21:27:27'),(30,'Chula prendeme el porro .jsp',1,'jueves 30 de noviembre 2023','22:28:21'),(31,'Muy lindo proyectooo :D',2,'jueves 30 de noviembre 2023','22:56:51'),(34,'Hola psyness',4,'viernes 1 de diciembre 2023','09:08:31'),(35,'saturno es la mejor obra de raul alejandro',1,'viernes 1 de diciembre 2023','09:28:29'),(36,'unam>>>ipn\r\n',0,'viernes 1 de diciembre 2023','09:31:07'),(37,'Holaa\r\n',0,'viernes 1 de diciembre 2023','09:10:10'),(38,'<script>alert\'hola\'</script>',1,'viernes 1 de diciembre 2023','10:04:50'),(40,'Hi Devs',0,'viernes 1 de diciembre 2023','10:17:52'),(41,'Holaa+a',0,'viernes 1 de diciembre 2023','10:18:38'),(42,'<script>alert(\"adios Axo\")</script>',0,'viernes 1 de diciembre 2023','10:18:57'),(44,'puto',0,'viernes 1 de diciembre 2023','10:37:09'),(45,'odioacham',1,'viernes 1 de diciembre 2023','10:37:39'),(46,'Hola mundo gerdoc',2,'viernes 1 de diciembre 2023','19:40:12'),(47,'Soy avi jejejejje\r\n(Desde la cuenta de mel, robo de identidad)',3,'viernes 1 de diciembre 2023','20:21:14'),(48,'ola avi feliz cum a tu novio',1,'sábado 2 de diciembre 2023','15:39:22'),(50,'ando bien tumbadooo,los ojos cerrados',4,'domingo 3 de diciembre 2023','11:54:06'),(61,'Vamoooos gente \r\n',0,'miércoles 6 de diciembre 2023','10:33:48'),(62,'10 a todos\r\n',0,'miércoles 6 de diciembre 2023','10:34:15'),(63,'Los 0d10 a todos\r\n',0,'miércoles 6 de diciembre 2023','10:34:35'),(64,'los 0d10 a todos',0,'miércoles 6 de diciembre 2023','10:32:07'),(65,'Nerfearon a axocode',1,'miércoles 6 de diciembre 2023','10:36:39'),(66,'Hola (con ansiedad)',0,'miércoles 6 de diciembre 2023','10:35:45'),(67,'Holaaaaaaaaaaaaaaaaaaaaaaaa',2,'miércoles 6 de diciembre 2023','10:36:12'),(73,'vivan las pukis',4,'miércoles 6 de diciembre 2023','13:43:10'),(83,'Si no paso Química realmente voy a redactar mi carta de suicidio aquí',1,'viernes 8 de diciembre 2023','00:43:45'),(84,'Hola, me gustan las prietas y los chetos',5,'martes 12 de diciembre 2023','14:38:44'),(85,'Pa q es la IA?',1,'martes 12 de diciembre 2023','20:53:25'),(86,'Los odio a todos',1,'jueves 14 de diciembre 2023','07:52:40'),(87,'Los quiero a todos',1,'jueves 14 de diciembre 2023','07:53:21'),(90,'Al final del día lo unico que saben hacer las computadoras solo es sumar... emojicigarro emojicigarro',2,'sábado 16 de diciembre 2023','01:29:53'),(91,'mi vida si Psyness tuviera emojis: ?',1,'viernes 22 de diciembre 2023','20:10:25'),(92,'joahan t odio',2,'domingo 24 de diciembre 2023','02:11:23'),(93,'Prueba IA',1,'viernes 29 de diciembre 2023','03:06:46'),(94,'FELIZ AÑO NUEVO A TODOOOOOS!!!!',3,'lunes 1 de enero 2024','06:15:30'),(95,'hola es mi primera publicación aquí y creo que quiero desahogarme un poco sobre mi insomnio; día con día el momento que menos quiero que llegue es el de dormir, no por que odie dormir si no por que la sensación tan horrible que siento diario al querer dormir y simplemente no poder es horrible, el estar tan cansado que tu cuerpo solo te pide descansar pero no poder, tener tantas cosas en la cabeza dando vueltas sin poder dejar de pensar, es realmente horrible, luego terminar despertando tarde (cuando solo dormiste 6 horas y son las 2 de la tarde) y darte cuenta del poco tiempo que te queda del día antes de volver a tener que vivir esa pelea interna por poder dormir… realmente te afecta mucho mentalmente :(, me gustaría solo poder dormir y descansar sin tener que vivir todo esto a diario.\r\n\r\nEs todo lo que tenía que decir, perdón si tengo faltas de ortografía y gracias.',3,'sábado 6 de enero 2024','05:12:49'),(103,'Si puedo decir que algo salvo mi vida definitivamente diría que fueron los videojuegos, más en específico Outer Wilds, a las personas que usan esta aplicación realmente se los recomiendo, cuando pase por un tiempo en el que no quería saber nada de nadie no quería hacer nada más que solo estar en mi habitación jugando videojuegos, alejándome cada vez más del mundo, hasta que Outer Wilds llego a mi lista de comprados y realmente me di cuenta de cuanto hay que valorar a nuestros seres queridos y a nuestra propia vida poniéndonos en la situación de que haríamos si solamente nos quedaran 22 minutos de vida, realmente estarías contento por todo lo que hiciste antes? que harás en esos 22 minutos? y más importante que tal si ahora mismo sucedieran esos 22 minutos y tu no lo supieras... verdaderamente una obra maestra, si no son tanto de jugar videojuegos en los comentarios les dejare 2 videos que realmente hablan de este videojuego de una manera muy hermosa.',5,'sábado 13 de enero 2024','22:27:51'),(104,'Hola a todos !',2,'sábado 13 de enero 2024','23:18:06'),(106,'olaaaa',0,'miércoles 17 de enero 2024','17:16:57'),(107,'Psynette',0,'miércoles 17 de enero 2024','17:46:34'),(109,'y lloro',2,'domingo 21 de enero 2024','20:22:58'),(110,'Axel5136.exe',2,'domingo 21 de enero 2024','20:39:34'),(111,'pisteando con unos compaaas\r\n',2,'domingo 21 de enero 2024','22:53:52'),(112,'es como twitter?',1,'lunes 22 de enero 2024','08:24:44'),(113,'y lloro',1,'lunes 22 de enero 2024','15:25:25'),(114,'prueba 1',1,'lunes 22 de enero 2024','15:25:38'),(115,'Prueba 2',0,'lunes 22 de enero 2024','15:25:38'),(116,'Prueba 3 feed final',0,'martes 23 de enero 2024','00:22:25'),(117,'Gg estamos done bien',0,'martes 23 de enero 2024','00:22:46'),(119,'si yo fuera el\n',1,'martes 23 de enero 2024','11:31:39'),(120,'Los odio a todos',0,'jueves 25 de enero 2024','16:33:24'),(121,'perdon',2,'jueves 25 de enero 2024','16:34:14'),(122,'Prueba 1',3,'jueves 25 de enero 2024','18:21:41'),(123,'prueba 2',0,'sábado 27 de enero 2024','18:55:59'),(124,'Me perdí en polanco',1,'miércoles 31 de enero 2024','19:31:41'),(125,'desenfocauuu',1,'miércoles 31 de enero 2024','19:31:58'),(126,'?',0,'lunes 19 de febrero 2024','00:49:38'),(127,'okey están rotos los comentarios ',2,'lunes 19 de febrero 2024','00:50:09'),(129,'Hola ',0,'lunes 19 de febrero 2024','07:27:43'),(130,'Arregle los comentarios saludos',0,'lunes 19 de febrero 2024','09:38:05'),(131,'probando el commit de fer',0,'martes 20 de febrero 2024','00:48:05'),(132,'ok fernando no hizo nada',0,'martes 20 de febrero 2024','00:51:12'),(133,'Mongraal y savage qualed',3,'martes 20 de febrero 2024','07:24:49'),(134,'hola',1,'martes 20 de febrero 2024','08:07:47'),(135,'los quiero',4,'martes 20 de febrero 2024','08:38:26'),(136,'Tu app se parece a X no?',3,'martes 20 de febrero 2024','08:06:54'),(137,'ola esta es una red social orientada a la Psicologia donde buscamos que se puedan desahogar y contar sus problemas, -Joahan Morales 6IM9 ',3,'miércoles 21 de febrero 2024','15:25:51'),(138,'…',2,'miércoles 21 de febrero 2024','22:07:34'),(139,'Gracias dios por otro dia ',2,'viernes 23 de febrero 2024','07:11:34'),(140,'ayuda no se  instalar tensorflow y mi equipo esta de vacaciones desde noviembre',2,'sábado 24 de febrero 2024','13:18:16'),(145,'Gracias dios por otro dia',1,'sábado 24 de febrero 2024','22:46:36'),(146,'Los odio a todos',2,'sábado 24 de febrero 2024','22:46:36'),(147,'si funciona lets go\n',1,'sábado 24 de febrero 2024','22:48:04'),(148,'estoy harto de este proyecto,el colab ya no corre,los odio a todos\n',1,'sábado 24 de febrero 2024','22:48:04'),(152,'te amo ana',1,'lunes 26 de febrero 2024','20:27:48'),(153,'los quiero',1,'lunes 26 de febrero 2024','20:42:15'),(154,'me tuve q hacer otra cuenta xq no tienen opcion de “olvide mi contraseña” ',2,'martes 27 de febrero 2024','17:44:34'),(155,'hola, estoy en buro de crédito',0,'martes 27 de febrero 2024','20:01:19'),(156,'yo no soy el de abajo, me jakearon mis fans, ayuda',0,'martes 27 de febrero 2024','20:32:12'),(157,'el de abajo miente, yo soy el verdadero unu\n',0,'martes 27 de febrero 2024','20:32:46'),(159,'perro este viernes\n',0,'martes 27 de febrero 2024','21:35:24'),(160,'no creo',0,'martes 27 de febrero 2024','21:35:34'),(162,'si\n',0,'martes 27 de febrero 2024','21:36:11'),(163,'me siento como kanye west, la gente me odia por mis pendejadas (le bajaron 630 puntos a mi equipo por mi culpa)',5,'martes 27 de febrero 2024','21:36:50'),(164,'ya pude',1,'martes 27 de febrero 2024','21:50:51'),(165,'estoy triste amigos\n',6,'martes 27 de febrero 2024','23:12:28'),(166,'ola esta es una red social orientada a la Psicologia donde buscamos que se puedan desahogar y contar sus problemas, -Joahan Morales 6IM9',5,'martes 27 de febrero 2024','23:58:22'),(167,'quiero mucho a mi novia\n',2,'miércoles 28 de febrero 2024','12:31:32'),(169,'ola',2,'jueves 29 de febrero 2024','12:51:04'),(172,'Hola tengo .. años, busco viejitos pe',1,'lunes 4 de marzo 2024','12:25:35'),(173,'quiero mucho a mi novio <3 ',5,'lunes 4 de marzo 2024','16:37:18');
/*!40000 ALTER TABLE `interpub` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interusers`
--

DROP TABLE IF EXISTS `interusers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `interusers` (
  `iusernum` int(11) NOT NULL AUTO_INCREMENT,
  `iuser` varchar(15) DEFAULT NULL,
  `iage` varchar(2) DEFAULT NULL,
  `iemail` varchar(40) DEFAULT NULL,
  `ipassword` varchar(25) DEFAULT NULL,
  `irol` varchar(20) DEFAULT NULL,
  `iimgnum` varchar(20) DEFAULT 'profilesidebar3.png',
  `iuserseguidores` int(11) DEFAULT '0',
  `iuserseguidos` int(11) DEFAULT '0',
  `iuserdescription` varchar(100) DEFAULT 'Esta es mi descripcion',
  PRIMARY KEY (`iusernum`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interusers`
--

LOCK TABLES `interusers` WRITE;
/*!40000 ALTER TABLE `interusers` DISABLE KEYS */;
INSERT INTO `interusers` VALUES (1,'Axocode','17','axocode0@gmail.como','losquieromuchoaxocode','Administrador','prof3.png',5,3,'los quiero mucho Axocode'),(2,'Yojan UwUñ','17','morales.pina.joahan.samuel09@gmail.com','1234','Administrador','prof1.png',7,0,'ay es que tu tmb vv'),(3,'Axel5136','17','axel@gmail.com','123','Administrador','prof4.png',0,3,'F <333'),(4,'Cebollita24','17','vargas.fer2442@gmail.com','4321','Administrador','prof3.png',2,1,'I Love Derrick Rose'),(5,'Mariel','16','zandypohe@gmail.com','81194','Visitante','prof1.png',0,0,'...'),(6,'daiiiiiiiiii','17','voeuxcherie@gmail.com','CR4ZY0V3Ryou','Visitante','profilesidebar3.png',0,0,'Esta es mi descripcion'),(7,'Reichita','17','pikalibi@gmail.com','papitasconqueso','Visitante','prof3.png',0,1,'Hola mundo, aquí Reichita <3'),(8,'saxon23','21','morap@gmail.com','axocode','Visitante','prof6.png',0,0,'Esta es mi descripcion'),(9,'MaliClavala','18','maliclavala@gmail.com','1234','Visitante','prof3.png',0,0,'Me gusta elBooo'),(10,'Feeerxh','17','gonzalez.orozco.camila.fernanda@gmail.co','holA09','Visitante','prof1.png',0,0,'A <33'),(11,'GayossoCesar','18','cesaremir.bernal@gmail.com','**020306**Ce','Visitante','profilesidebar3.png',0,0,'Parte de axocode '),(12,'El Temach','40','eltemach@gmail.com','MandelaALVmicompa','Visitante','prof8.png',0,0,'Esta es mi descripcion'),(13,'Mel Surikun','17','hernandez.lopez.melanie9@gmail.com','mel123','Visitante','prof1.png',1,0,'viva Skz y Conan Gray '),(15,'Nahum1','19','nahumjosael@gmail.com','1234','Visitante','prof3.png',0,0,'Hola soy nahum'),(16,'Nicojrz','17','anicolas.juarez.7@gmail.com','elnico666','Visitante','profilesidebar3.png',0,0,'Esta es mi descripcion'),(17,'vicente ¥€','18','giner.ortiz.vicente@gmail.com','ing98600129','Visitante','profilesidebar3.png',1,0,'Esta es mi descripcion'),(18,'AxelIsaias','17','axel@gmail.com','123','Visitante','prof5.png',0,1,'Los quremos mucho'),(19,'DevSolutions','17','devs@gmail.com','1234','Visitante','profilesidebar3.png',0,0,'Esta es mi descripcion'),(20,'odioacham','12','aa@gmail.com','ola','Visitante','profilesidebar3.png',2,0,'Esta es mi descripcion'),(21,'pepe123','12','pepe@gmail.com','123','Visitante','profilesidebar3.png',0,0,'Esta es mi descripcion'),(22,'Yaelico','17','morap@gmail.com','1234','Visitante','prof6.png',0,1,'Soy maricon y me gusta el pn'),(23,'Cham12','16','Cham@cham','1234','Visitante','profilesidebar3.png',0,0,'Esta es mi descripcion'),(24,'OsirisFoxyXD','17','ado95592@nezid.com','tilin123','Visitante','profilesidebar3.png',0,2,'Esta es mi descripcion'),(25,'AmorDeSuVida','25','AmorVida@gmail.com','FuckBatiz','Visitante','profilesidebar3.png',1,2,'Esta es mi descripcion'),(26,'Levy de mango','17','albertiwi26@gmail.com','olaolaola','Visitante','prof7.png',0,0,'Esta es mi descripcion'),(27,'yosoycons','17','cons@gmail.com','roqdis-faqcu2-tytgiP','Visitante','profilesidebar3.png',0,0,'Esta es mi descripcion'),(28,'Hola amigos','17','hola@gmail.com','123456','Visitante','profilesidebar3.png',1,0,'Esta es mi descripcion'),(29,'fefafefa','33','fefa@gmail.com','Nocreo','Visitante','profilesidebar3.png',0,1,'Esta es mi descripcion'),(30,'Lalito','12','asdsa@hasd.com','123455','Visitante','profilesidebar3.png',0,1,'Esta es mi descripcion'),(31,'Holagerdoc','12','axocoxd@gnqil.com','1234','Visitante','profilesidebar3.png',0,1,'Esta es mi descripcion'),(32,'manjarrez','69','manjano@gmail.com','Vivanlaspukis','Visitante','profilesidebar3.png',0,0,'Esta es mi descripcion'),(33,'PepeElToro','19','pepe@gmail.com','1234','Visitante','prof5.png',1,0,'Esta es mi descripcion'),(34,'zusuzu','17','zu@gmail.com','1234','Visitante','prof6.png',0,2,'Esta es mi descripcion'),(35,'sasdsad','23','jasjdhajsh@gmail.com','123434','Visitante','profilesidebar3.png',0,0,'Esta es mi descripcion'),(36,'Nene1224','12','Nene@gmail.com','1234','Visitante','profilesidebar3.png',0,0,'Esta es mi descripcion'),(37,'javiscript','17','javisrey26@gmail.com','holamoon','Visitante','prof1.png',0,1,'Esta es mi descripcion'),(38,'Olaaa1','16','azel@gmail.com','1223','Visitante','profilesidebar3.png',0,0,'Esta es mi descripcion'),(39,'YorchNvVh','17','YorchNvVh@gmail.com','12345','Visitante','prof3.png',0,0,'You stole my dreams'),(40,'saxon23s','17','morap@gmail.com','1234','Visitante','profilesidebar3.png',0,0,'Esta es mi descripcion'),(41,'Nahumxd1','17','nahumjosael@gmail.com','1234','Visitante','profilesidebar3.png',0,0,'Esta es mi descripcion'),(42,'Si1234','17','a@gmail.com','si123','Visitante','profilesidebar3.png',0,0,'Esta es mi descripcion'),(43,'Si12345','17','ae@gmail.com','123456','Visitante','prof3.png',1,1,'Pero si o no'),(44,'Osiris','17','tilin@gmail.com','tilin123','Visitante','prof5.png',0,0,'Hola tonotos'),(45,'Andyyyyyyy','16','andrearamossantiago09@gmail.com','Yojajangei09','Visitante','profilesidebar3.png',0,0,'Esta es mi descripcion'),(46,'Batman','50','cdgotica@gmail.com','robin','Visitante','profilesidebar3.png',0,1,'Esta es mi descripcion'),(47,'Gigiro ','19','gigi@gmail.com','jungkook97','Visitante','profilesidebar3.png',0,0,'Esta es mi descripcion'),(48,'nicotest','17','altbotnik@gmail.com','nico1234','Visitante','profilesidebar3.png',0,0,'Esta es mi descripcion'),(49,'gigy1328','18','gigys3107@gmail.com','todiojoahan','Visitante','profilesidebar3.png',0,0,'Esta es mi descripcion'),(50,'Si123456','17','a@gmail.com','123','Visitante','profilesidebar3.png',0,0,'Esta es mi descripcion'),(51,'gatonegro1234','17','gato@gmail.com','1234','Visitante','profilesidebar3.png',0,0,'Esta es mi descripcion'),(52,'YorchNvvhy','17','yorch@gmail.com','1234','Visitante','prof1.png',0,0,'Tebquiero '),(53,'July_qv','16','quiroz.ventura.julieta30@gmail.com','123456','Visitante','prof3.png',0,0,'Esta es mi descripcion'),(54,'yael23','23','morap@gmail.com','1234','Visitante','profilesidebar3.png',0,0,'Esta es mi descripcion'),(55,'richardd82','41','richardd82@gmail.com','Andr3s82','Visitante','profilesidebar3.png',0,0,'Esta es mi descripcion'),(56,'DennGom','18','denithgogo@gmail.com','EdItH1001_?','Visitante','profilesidebar3.png',0,0,'Esta es mi descripcion'),(57,'okdanimuak','18','atxdanny.led@gmail.com','Autorizo8','Visitante','profilesidebar3.png',0,0,'Esta es mi descripcion'),(58,'okidoki','17','1234@gmail.com','yuyu87','Visitante','profilesidebar3.png',0,0,'Esta es mi descripcion'),(59,'temach','38','temach.oficial@tiktok.com','ModoGuerra','Visitante','profilesidebar3.png',0,0,'Esta es mi descripcion'),(60,'Sergio Herrer','21','sergiojechu11@gmail.com','abcdefg','Visitante','profilesidebar3.png',0,0,'Esta es mi descripcion'),(61,'dasdasdasd','15','as4d5asd44@gmail.com','Morales@547','Visitante','profilesidebar3.png',0,0,'Esta es mi descripcion'),(62,'Dieguin','18','diego.vazquez13h@gmail.com','addoga12','Visitante','profilesidebar3.png',0,0,'Esta es mi descripcion'),(63,'Axel123','87','lla@gmailm.ocmm','123','Visitante','profilesidebar3.png',0,0,'Esta es mi descripcion'),(64,'Yael24','12','axocoxd@gnqil.com','1234','Visitante','profilesidebar3.png',0,0,'Esta es mi descripcion'),(65,'aaronpelon','33','l@g','piopio','Visitante','profilesidebar3.png',0,0,'Esta es mi descripcion'),(66,'DeeevS','18','devs@gmail.com','12345678','Visitante','prof1.png',0,0,'Esta es mi descripcion'),(67,'Dylan Mar','18','dylan@gmail.com','dylan','Visitante','profilesidebar3.png',0,0,'Esta es mi descripcion'),(68,'Pppppp','99','pp@gmail.com','vv123','Visitante','profilesidebar3.png',0,0,'Esta es mi descripcion'),(69,'corcho','17','javisrey26@gmail.com','holamoon','Visitante','prof1.png',0,0,'Esta es mi descripcion'),(70,'Antoniobn','14','antonio@gmail.com','1234','Visitante','prof3.png',0,0,'ola vvs'),(71,'Armando','44','armando@gmail.com','1234','Visitante','prof6.png',0,0,'Esta es mi descripcion'),(72,'okdanimuakk','17','atxdanny.ledurq@gmail.com','chocolatesrgo','Visitante','profilesidebar3.png',0,0,'Esta es mi descripcion'),(73,'Sophia0000','17','sophiasalazarm.2006@gmail.com','ola12345','Visitante','profilesidebar3.png',0,0,'Esta es mi descripcion'),(74,'intruder','99','intruder@awake.com','hiaxo','Visitante','profilesidebar3.png',0,0,'Esta es mi descripcion'),(75,'yojanmorap2','23','morap@gmail.com','1234','Visitante','prof3.png',0,0,'Esta es mi descripcion'),(76,'Zarate','18','VitoZarate.9@gmail.com','12345','Visitante','profilesidebar3.png',0,0,'Esta es mi descripcion'),(77,'Feer:)','17','123@gmail.com','ola','Visitante','prof1.png',0,0,'Esta es mi descripcion'),(78,'bGabo_mg','17','manzano.guadarrama.luisgabriel@gmail.com','juanesgei123','Visitante','profilesidebar3.png',0,0,'Esta es mi descripcion'),(79,'OsirisUwU','17','hola@gmail.com','uwu123','Visitante','profilesidebar3.png',0,0,'Esta es mi descripcion'),(80,'piniwini','17','ecervxntes@icloud.com','1234','Visitante','profilesidebar3.png',0,0,'Esta es mi descripcion'),(81,'marmaria','19','hiimfernanda@gmail.com','misquinc3','Visitante','profilesidebar3.png',0,0,'Esta es mi descripcion'),(82,'maic283832','17','mig.herh26@gmail.com','Mike19630508','Visitante','profilesidebar3.png',0,0,'Esta es mi descripcion'),(83,'EduardoCM','17','eduardocm1106@gmail.com','pepepicapapas','Visitante','profilesidebar3.png',0,0,'Esta es mi descripcion'),(84,'paolojj','17','hola1357kja@gmail.com','123456789','Visitante','profilesidebar3.png',0,0,'Esta es mi descripcion'),(85,'Alexa ','19','alemonroy0610@gmail.com','mateo','Visitante','profilesidebar3.png',0,0,'Esta es mi descripcion'),(86,'melany','17','melanyacevedoramirez@gmail.com','nyTvuh-podgyw-hobki1','Visitante','profilesidebar3.png',0,0,'Esta es mi descripcion'),(87,'Anth_tag','17','anthuanest@gmail.com','Anthuan2006','Visitante','profilesidebar3.png',0,0,'Esta es mi descripcion'),(88,'tilinhrhrr','17','suarez.gomez.alejandrom@gmail.com','conttaseña','Visitante','prof1.png',0,0,'Esta es mi descripcion'),(89,'DaniLuna','17','a@a','123','Visitante','profilesidebar3.png',0,0,'Esta es mi descripcion');
/*!40000 ALTER TABLE `interusers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interuserscode`
--

DROP TABLE IF EXISTS `interuserscode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `interuserscode` (
  `iusernum` int(11) DEFAULT NULL,
  `codescode` varchar(10) DEFAULT NULL,
  KEY `iusernum` (`iusernum`),
  KEY `codescode` (`codescode`),
  CONSTRAINT `interuserscode_ibfk_1` FOREIGN KEY (`iusernum`) REFERENCES `interusers` (`iusernum`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `interuserscode_ibfk_2` FOREIGN KEY (`codescode`) REFERENCES `intercodes` (`codescode`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interuserscode`
--

LOCK TABLES `interuserscode` WRITE;
/*!40000 ALTER TABLE `interuserscode` DISABLE KEYS */;
INSERT INTO `interuserscode` VALUES (2,'1234567890'),(3,'8901234567'),(4,'9012345678');
/*!40000 ALTER TABLE `interuserscode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interuserspub`
--

DROP TABLE IF EXISTS `interuserspub`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `interuserspub` (
  `pubnumid` int(11) NOT NULL AUTO_INCREMENT,
  `iusernum` int(11) DEFAULT NULL,
  KEY `pubnumid` (`pubnumid`),
  KEY `iusernum` (`iusernum`),
  CONSTRAINT `interuserspub_ibfk_1` FOREIGN KEY (`pubnumid`) REFERENCES `interpub` (`pubnumid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `interuserspub_ibfk_2` FOREIGN KEY (`iusernum`) REFERENCES `interusers` (`iusernum`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=174 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interuserspub`
--

LOCK TABLES `interuserspub` WRITE;
/*!40000 ALTER TABLE `interuserspub` DISABLE KEYS */;
INSERT INTO `interuserspub` VALUES (1,2),(2,3),(3,1),(4,4),(6,5),(7,2),(8,7),(9,8),(10,4),(11,4),(14,4),(15,9),(16,2),(17,10),(18,4),(19,9),(20,11),(21,2),(23,4),(24,4),(25,4),(26,2),(29,12),(30,2),(31,13),(34,16),(35,17),(36,17),(37,15),(38,1),(40,19),(41,18),(42,19),(44,20),(45,20),(46,3),(47,13),(48,4),(50,4),(61,28),(62,28),(63,28),(64,1),(65,29),(66,28),(67,1),(73,32),(83,2),(84,37),(85,43),(86,1),(87,1),(90,2),(91,2),(92,49),(93,2),(94,2),(95,51),(103,2),(104,2),(106,5),(107,2),(109,3),(110,3),(111,4),(112,57),(113,2),(114,2),(115,2),(116,2),(117,2),(119,4),(120,2),(121,2),(122,2),(123,2),(124,2),(125,2),(126,2),(127,2),(129,64),(130,2),(131,2),(132,2),(133,65),(134,4),(135,1),(136,66),(137,2),(138,2),(139,2),(140,69),(145,4),(146,4),(147,4),(148,4),(152,4),(153,71),(154,72),(155,75),(156,2),(157,75),(159,75),(160,2),(162,75),(163,2),(164,57),(165,3),(166,2),(167,3),(169,88),(172,89),(173,10);
/*!40000 ALTER TABLE `interuserspub` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-05 15:30:27
