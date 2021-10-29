CREATE DATABASE Baloncesto;
use baloncesto;
DROP TABLE IF EXISTS `equipo`;
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

LOCK TABLES `equipo` WRITE;
INSERT INTO `equipo` VALUES ('bar','Barcelona',0,0,0,0,0,0),('mad','Madrid',0,0,0,0,0,0),('cai','Zaragoza',0,0,0,0,0,0),('penas','Huesca',0,0,0,0,0,0),('tau','Madrid',0,0,0,0,0,0),('juv','Badalona',0,0,0,0,0,0),('ali','Alicante',0,0,0,0,0,0),('sev','Sevilla',0,0,0,0,0,0);
UNLOCK TABLES;
DROP TABLE IF EXISTS `jugador`;
CREATE TABLE `jugador` (
  `id_jugador` char(8) NOT NULL DEFAULT '',
  `puntos_total` int(9) DEFAULT NULL,
  `minutos` int(4) DEFAULT NULL,
  `altura` int(5) DEFAULT NULL,
  `equipo` char(8) DEFAULT NULL,
  PRIMARY KEY (`id_jugador`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `jugador` WRITE;
INSERT INTO `jugador` VALUES ('ant',100,300,200,'cai'),('fel',22,200,185,'cai'),('gen',111,120,199,'cai'),('cas',212,250,210,'cai'),('arc',90,320,200,'cai'),('jav',999,245,198,'mad'),('vic',442,166,205,'mad'),('jan',999,245,206,'mad'),('ars',99,311,190,'mad'),('cor',320,213,193,'mad'),('jua',234,20,198,'bar'),('jai',444,300,198,'bar'),('edu',54,299,179,'bar'),('lui',67,212,188,'bar'),('raf',232,201,199,'bar'),('pac',999,245,198,'tau'),('jau',354,21,167,'tau'),('fra',655,333,209,'tau'),('fal',311,277,213,'tau'),('fab',412,24,187,'tau'),('amt',333,260,190,'penas'),('jor',243,423,177,'penas');
UNLOCK TABLES;

DROP TABLE IF EXISTS `partido`;CREATE TABLE `partido` (
  `fecha` date DEFAULT NULL,
  `local` char(8) NOT NULL DEFAULT '',
  `visitante` char(8) NOT NULL DEFAULT '',
  `reslocal` varchar(7) DEFAULT NULL,
  `resvisit` varchar(7) DEFAULT NULL,
  `max_enc` char(8) DEFAULT NULL,
  PRIMARY KEY (`local`,`visitante`),
  KEY `visitante` (`visitante`),
  KEY `max_enc` (`max_enc`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
LOCK TABLES `partido` WRITE;
INSERT INTO `partido` VALUES ('2009-01-01','mad','bar','100','80','jav'),('2009-01-01','mad','cai','67','80','ant'),('2009-01-01','mad','penas','67','80','ant'),('2009-02-08','bar','cai','77','90','edu'),('2009-02-18','bar','penas','77','120','amt'),('2009-02-18','bar','tau','77','50','fab'),('2009-02-18','juv','ali','73','80',NULL),('2009-03-18','juv','sev','93','80',NULL),('2009-03-18','penas','tau','103','70',NULL),('2009-04-18','penas','cai','13','70',NULL),('2009-05-18','penas','mad','130','100',NULL),('2009-05-18','penas','bar','133','130','jor'),('2009-05-06','cai','bar','130','90','gen'),('2009-05-22','cai','tau','122','110','gen'),('2009-12-22','cai','mad','99','77','cas'),('2009-07-01','cai','juv','99','77','edu');
UNLOCK TABLES;