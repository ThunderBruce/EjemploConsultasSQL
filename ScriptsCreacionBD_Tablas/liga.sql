-- MySQL dump 10.13  Distrib 5.5.16, for Win32 (x86)
--
-- Host: localhost    Database: liga
-- ------------------------------------------------------
-- Server version	5.5.16

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
-- Table structure for table `equipo`
--

DROP TABLE IF EXISTS `equipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `equipo` (
  `nombre` char(8) NOT NULL DEFAULT '',
  `ciudad` char(20) DEFAULT NULL,
  `puesto` int(2) DEFAULT '0',
  `pg` int(2) DEFAULT '0',
  `pp` int(2) DEFAULT '0',
  `pf` int(6) DEFAULT '0',
  `pc` int(6) DEFAULT '0',
  `dif` int(6) DEFAULT '0',
  PRIMARY KEY (`nombre`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipo`
--

LOCK TABLES `equipo` WRITE;
/*!40000 ALTER TABLE `equipo` DISABLE KEYS */;
INSERT INTO `equipo` VALUES ('bar','Barcelona',6,1,5,531,623,-92),('mad','Madrid',5,1,4,411,469,-58),('cai','Zaragoza',1,7,0,690,511,179),('penas','Huesca',2,5,1,579,514,65),('tau','Madrid',8,0,3,230,302,-72),('juv','Badalona',4,1,2,243,259,-16),('ali','Alicante',3,1,0,80,73,7),('sev','Sevilla',7,2,1,80,93,-13);
/*!40000 ALTER TABLE `equipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jugador`
--

DROP TABLE IF EXISTS `jugador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jugador` (
  `id_jugador` char(8) NOT NULL DEFAULT '',
  `puntos_total` int(9) DEFAULT NULL,
  `minutos` int(4) DEFAULT NULL,
  `altura` int(5) DEFAULT NULL,
  `equipo` char(8) DEFAULT NULL,
  PRIMARY KEY (`id_jugador`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jugador`
--

LOCK TABLES `jugador` WRITE;
/*!40000 ALTER TABLE `jugador` DISABLE KEYS */;
INSERT INTO `jugador` VALUES ('ant',100,300,200,'cai'),('fel',22,200,185,'cai'),('gen',111,120,199,'cai'),('cas',212,250,210,'cai'),('arc',90,320,200,'cai'),('jav',999,245,198,'mad'),('vic',442,166,205,'mad'),('jan',999,245,206,'mad'),('ars',99,311,190,'mad'),('cor',320,213,193,'mad'),('jua',234,20,198,'bar'),('jai',444,300,198,'bar'),('edu',54,299,179,'bar'),('lui',67,212,188,'bar'),('raf',232,201,199,'bar'),('pac',999,245,198,'tau'),('jau',354,21,167,'tau'),('fra',655,333,209,'tau'),('fal',311,277,213,'tau'),('fab',412,24,187,'tau'),('amt',333,260,190,'penas'),('jor',243,423,177,'penas');
/*!40000 ALTER TABLE `jugador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partido`
--

DROP TABLE IF EXISTS `partido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `partido` (
  `fecha` date DEFAULT NULL,
  `local` char(8) NOT NULL DEFAULT '',
  `visitante` char(8) NOT NULL DEFAULT '',
  `reslocal` int(9) DEFAULT NULL,
  `resvisit` int(9) DEFAULT NULL,
  `max_enc` char(8) DEFAULT NULL,
  PRIMARY KEY (`local`,`visitante`),
  KEY `visitante` (`visitante`),
  KEY `max_enc` (`max_enc`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partido`
--

LOCK TABLES `partido` WRITE;
/*!40000 ALTER TABLE `partido` DISABLE KEYS */;
INSERT INTO `partido` VALUES ('2009-01-01','mad','bar',100,80,'jav'),('2009-01-01','mad','cai',67,80,'ant'),('2009-01-01','mad','penas',67,80,'ant'),('2009-02-08','bar','cai',77,90,'edu'),('2009-02-18','bar','penas',77,120,'amt'),('2009-02-18','bar','tau',77,50,'fab'),('2009-02-18','juv','ali',73,80,NULL),('2009-03-18','juv','sev',93,80,NULL),('2009-03-18','penas','tau',103,70,NULL),('2009-04-18','penas','cai',13,70,NULL),('2009-05-18','penas','mad',130,100,NULL),('2009-05-18','penas','bar',133,130,'jor'),('2009-05-06','cai','bar',130,90,'gen'),('2009-05-22','cai','tau',122,110,'gen'),('2009-12-22','cai','mad',99,77,'cas'),('2009-07-01','cai','juv',99,77,'edu');
/*!40000 ALTER TABLE `partido` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-06-02 14:14:08
