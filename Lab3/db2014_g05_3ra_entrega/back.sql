-- MySQL dump 10.13  Distrib 5.5.38, for debian-linux-gnu (x86_64)
--
-- Host: kali    Database: db2014_g05
-- ------------------------------------------------------
-- Server version	5.5.38-0ubuntu0.14.04.1

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
-- Table structure for table `Area`
--

DROP TABLE IF EXISTS `Area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Area` (
  `Nombre_Area` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`Nombre_Area`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Area`
--

LOCK TABLES `Area` WRITE;
/*!40000 ALTER TABLE `Area` DISABLE KEYS */;
INSERT INTO `Area` VALUES ('Agricultura'),('Apicultura'),('Forrajeria'),('Ganaderia'),('Tambo');
/*!40000 ALTER TABLE `Area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AreaCliente`
--

DROP TABLE IF EXISTS `AreaCliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AreaCliente` (
  `Nombre_Area` varchar(20) NOT NULL,
  `Cuit` decimal(11,0) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Nombre_Area`,`Cuit`),
  KEY `fk_cuit` (`Cuit`),
  CONSTRAINT `fk_cuit` FOREIGN KEY (`Cuit`) REFERENCES `Cliente` (`Cuit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AreaCliente`
--

LOCK TABLES `AreaCliente` WRITE;
/*!40000 ALTER TABLE `AreaCliente` DISABLE KEYS */;
INSERT INTO `AreaCliente` VALUES ('Agricultura',20733797847),('Ganaderia',20964881694),('Apicultura',21857959152),('Ganaderia',24575097766),('Ganaderia',25224345014),('Agricultura',37395045887),('Agricultura',37634697973),('Apicultura',37842910105),('Agricultura',38421805343),('Agricultura',38817149425),('Apicultura',40054868870),('Forrajeria',41168483062),('Ganaderia',42381513522),('Ganaderia',44492424700),('Apicultura',45206904390),('Agricultura',46430152934),('Forrajeria',46690258622),('Apicultura',47157018047),('Ganaderia',48194781422),('Ganaderia',48978380447);
/*!40000 ALTER TABLE `AreaCliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Campaña`
--

DROP TABLE IF EXISTS `Campaña`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Campaña` (
  `Numero` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Fecha_Inicio` datetime DEFAULT NULL,
  `Fecha_Fin` datetime DEFAULT NULL,
  PRIMARY KEY (`Numero`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Campaña`
--

LOCK TABLES `Campaña` WRITE;
/*!40000 ALTER TABLE `Campaña` DISABLE KEYS */;
INSERT INTO `Campaña` VALUES (1,'2014-11-01 00:00:00','2015-02-01 00:00:00'),(2,'2014-10-01 06:06:06','2014-12-01 06:06:06'),(3,'2014-04-10 00:00:00','2014-05-10 00:00:00'),(4,'2014-05-10 00:00:00','2014-05-17 00:00:00'),(5,'2014-09-04 00:00:00','2014-09-11 00:00:00'),(87,'2014-11-09 00:00:00','2014-11-12 00:02:00');
/*!40000 ALTER TABLE `Campaña` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CampañaMaquina`
--

DROP TABLE IF EXISTS `CampañaMaquina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CampañaMaquina` (
  `Numero` int(10) unsigned NOT NULL DEFAULT '0',
  `ID_Maquina` int(10) unsigned NOT NULL,
  PRIMARY KEY (`Numero`,`ID_Maquina`),
  KEY `fk_id_maquina` (`ID_Maquina`),
  CONSTRAINT `fk_id_maquina` FOREIGN KEY (`ID_Maquina`) REFERENCES `Maquina` (`ID_Maquina`),
  CONSTRAINT `fk_numero` FOREIGN KEY (`Numero`) REFERENCES `Campaña` (`Numero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CampañaMaquina`
--

LOCK TABLES `CampañaMaquina` WRITE;
/*!40000 ALTER TABLE `CampañaMaquina` DISABLE KEYS */;
INSERT INTO `CampañaMaquina` VALUES (87,1),(87,7),(1,10),(2,32),(3,43),(5,44),(4,53);
/*!40000 ALTER TABLE `CampañaMaquina` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`db2014_g05`@`agni.famaf.unc.edu.ar`*/ /*!50003 TRIGGER comunicacion_por_campaña AFTER INSERT ON CampañaMaquina
FOR EACH ROW
BEGIN
    INSERT INTO Comunicacion(Cuil, Cuit, Medio, Observacion, Estado, Fecha)
    SELECT Cuil, Cuit, 'telefonico', CONCAT('Llamar por campaña ', NEW.Numero), 'pendiente', (
        SELECT Fecha_Inicio
        FROM Campaña
        WHERE Numero = NEW.Numero)
    FROM ClienteMaquina NATURAL JOIN VendedorCliente 
    WHERE ID_Maquina = NEW.ID_Maquina and NOT EXISTS (SELECT *
                                                      FROM Comunicacion AS C
                                                      WHERE C.Cuil = VendedorCliente.Cuil AND C.Cuit = ClienteMaquina.Cuit AND CONCAT('Llamar por campaña ', NEW.Numero) = C.Observacion);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `Ciudad`
--

DROP TABLE IF EXISTS `Ciudad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Ciudad` (
  `CP_Ciudad` int(4) unsigned NOT NULL DEFAULT '0',
  `CP_Provincia` char(1) DEFAULT NULL,
  `NombreCiudad` varchar(20) NOT NULL,
  PRIMARY KEY (`CP_Ciudad`,`NombreCiudad`),
  KEY `CP_Provincia` (`CP_Provincia`),
  CONSTRAINT `fk_cp_provincia` FOREIGN KEY (`CP_Provincia`) REFERENCES `Provincia` (`CP_Provincia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Ciudad`
--

LOCK TABLES `Ciudad` WRITE;
/*!40000 ALTER TABLE `Ciudad` DISABLE KEYS */;
INSERT INTO `Ciudad` VALUES (3200,'E','Concordia'),(6300,'L','Santa Rosa'),(6319,'L','Carro Quemado'),(8200,'L','General Acha'),(5000,'X','Cordoba'),(5152,'X','Villa Carlos Paz'),(5166,'X','Cosquin'),(5361,'Z','Santa Cruz');
/*!40000 ALTER TABLE `Ciudad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CiudadZona`
--

DROP TABLE IF EXISTS `CiudadZona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CiudadZona` (
  `CP_Ciudad` int(4) unsigned NOT NULL DEFAULT '0',
  `NombreCiudad` varchar(20) NOT NULL,
  `NombreZona` varchar(20) NOT NULL,
  PRIMARY KEY (`CP_Ciudad`,`NombreCiudad`,`NombreZona`),
  KEY `NombreZona` (`NombreZona`),
  CONSTRAINT `fk_nombre_zona` FOREIGN KEY (`NombreZona`) REFERENCES `Zona` (`NombreZona`),
  CONSTRAINT `fk_cp_ciudad_nombre_ciudad` FOREIGN KEY (`CP_Ciudad`, `NombreCiudad`) REFERENCES `Ciudad` (`CP_Ciudad`, `NombreCiudad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CiudadZona`
--

LOCK TABLES `CiudadZona` WRITE;
/*!40000 ALTER TABLE `CiudadZona` DISABLE KEYS */;
INSERT INTO `CiudadZona` VALUES (5000,'Cordoba','Interior'),(5152,'Villa Carlos Paz','Interior'),(5166,'Cosquin','Interior'),(3200,'Concordia','Noreste'),(6300,'Santa Rosa','Pampa'),(6319,'Carro Quemado','Pampa'),(8200,'General Acha','Pampa'),(5361,'Santa Cruz','Patagonia');
/*!40000 ALTER TABLE `CiudadZona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cliente`
--

DROP TABLE IF EXISTS `Cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cliente` (
  `Razon_Social` varchar(30) DEFAULT NULL,
  `Cuit` decimal(11,0) unsigned NOT NULL,
  `CP_Ciudad` int(4) unsigned DEFAULT NULL,
  `NombreCiudad` varchar(20) NOT NULL,
  PRIMARY KEY (`Cuit`),
  KEY `fk_cp_ciudad_nombreciudad` (`CP_Ciudad`,`NombreCiudad`),
  CONSTRAINT `fk_cp_ciudad_nombreciudad` FOREIGN KEY (`CP_Ciudad`, `NombreCiudad`) REFERENCES `Ciudad` (`CP_Ciudad`, `NombreCiudad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cliente`
--

LOCK TABLES `Cliente` WRITE;
/*!40000 ALTER TABLE `Cliente` DISABLE KEYS */;
INSERT INTO `Cliente` VALUES ('Donec Luctus Company',20733797847,5152,'Villa Carlos Paz'),('Luctus Lobortis Class LLC',20964881694,5361,'Santa Cruz'),('Erat Consulting',21857959152,5000,'Cordoba'),('Vitae Odio Corp.',24575097766,6319,'Carro Quemado'),('Et Magnis Dis PC',25224345014,8200,'General Acha'),('Ligula Aliquam Corporation',37395045887,8200,'General Acha'),('Feugiat Sed Corporation',37634697973,5152,'Villa Carlos Paz'),('Erat Associates',37842910105,8200,'General Acha'),('Sit Amet Nulla Inc.',38421805343,8200,'General Acha'),('Duis LLC',38817149425,8200,'General Acha'),('Malesuada Integer Id Associate',40054868870,5361,'Santa Cruz'),('Metus Eu Erat Foundation',41168483062,3200,'Concordia'),('Sagittis Felis Donec Institute',42381513522,6300,'Santa Rosa'),('In Ornare Sagittis Corporation',44492424700,5166,'Cosquin'),('Sed Tortor Institute',45206904390,5361,'Santa Cruz'),('Ad Litora Consulting',46430152934,6300,'Santa Rosa'),('Nisi Dictum LLC',46690258622,5000,'Cordoba'),('Elit Foundation',47157018047,5000,'Cordoba'),('Risus Corporation',48194781422,6300,'Santa Rosa'),('Ipsum Sodales Associates',48978380447,6319,'Carro Quemado');
/*!40000 ALTER TABLE `Cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ClienteMaquina`
--

DROP TABLE IF EXISTS `ClienteMaquina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ClienteMaquina` (
  `Cuit` decimal(11,0) unsigned NOT NULL DEFAULT '0',
  `ID_Maquina` int(10) unsigned NOT NULL,
  `Cantidad` int(10) unsigned NOT NULL,
  PRIMARY KEY (`Cuit`,`ID_Maquina`),
  KEY `fk_id_maquina_2` (`ID_Maquina`),
  CONSTRAINT `fk_clientemaquina_cuit` FOREIGN KEY (`Cuit`) REFERENCES `Cliente` (`Cuit`),
  CONSTRAINT `fk_id_maquina_2` FOREIGN KEY (`ID_Maquina`) REFERENCES `Maquina` (`ID_Maquina`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ClienteMaquina`
--

LOCK TABLES `ClienteMaquina` WRITE;
/*!40000 ALTER TABLE `ClienteMaquina` DISABLE KEYS */;
INSERT INTO `ClienteMaquina` VALUES (20733797847,1,3),(20733797847,7,2),(20964881694,9,6),(21857959152,20,4),(24575097766,14,5),(37395045887,16,8),(37634697973,27,7),(38421805343,30,5),(38817149425,28,2),(41168483062,7,4),(42381513522,22,12),(44492424700,21,6),(45206904390,7,2),(45206904390,13,8),(46430152934,7,21),(46690258622,8,4),(47157018047,10,1),(48194781422,14,2),(48978380447,15,10),(48978380447,22,5);
/*!40000 ALTER TABLE `ClienteMaquina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Comunicacion`
--

DROP TABLE IF EXISTS `Comunicacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Comunicacion` (
  `Numero` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Cuil` decimal(11,0) NOT NULL,
  `Cuit` decimal(11,0) NOT NULL,
  `Medio` varchar(13) DEFAULT NULL,
  `Observacion` varchar(300) DEFAULT NULL,
  `Estado` varchar(9) DEFAULT NULL,
  `Fecha` datetime DEFAULT NULL,
  PRIMARY KEY (`Numero`),
  KEY `fk_comunicacion_cuit` (`Cuit`),
  KEY `fk_comunicacion_cuil` (`Cuil`),
  CONSTRAINT `fk_comunicacion_cuil` FOREIGN KEY (`Cuil`) REFERENCES `Vendedor` (`Cuil`),
  CONSTRAINT `fk_comunicacion_cuit` FOREIGN KEY (`Cuit`) REFERENCES `Cliente` (`Cuit`)
) ENGINE=InnoDB AUTO_INCREMENT=235 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Comunicacion`
--

LOCK TABLES `Comunicacion` WRITE;
/*!40000 ALTER TABLE `Comunicacion` DISABLE KEYS */;
INSERT INTO `Comunicacion` VALUES (1,38331147320,24575097766,'telefono','acordarse de felicitarlo por el torneo Pimes','pendiente','2014-11-05 16:00:00'),(2,26048204535,38421805343,'telefono','','pendiente','2014-12-05 17:00:00'),(3,39728412060,40054868870,'telefono','','realizada','2014-03-05 17:00:00'),(4,29685802720,20964881694,'personalmente','Condolencias a la familia por la muerte de la hija','pendiente','2014-12-09 17:00:00'),(5,26213114093,37842910105,'telefono','','realizada','2014-07-02 17:00:00'),(6,21020908281,37395045887,'personalmente','','realizada','2014-05-04 17:00:00'),(9,38331147320,46430152934,'telefonico','asdasd','pendiente','2014-11-05 17:00:00'),(10,38331147320,44492424700,'mail','potencial comprador','realizada','2009-07-02 17:00:00'),(231,39728412060,20733797847,'telefonico','Llamar por campaña 87','pendiente','2014-11-09 00:00:00'),(232,21588486935,41168483062,'telefonico','Llamar por campaña 87','pendiente','2014-11-09 00:00:00'),(233,23661966184,45206904390,'telefonico','Llamar por campaña 87','pendiente','2014-11-09 00:00:00'),(234,26038334742,46430152934,'telefonico','Llamar por campaña 87','pendiente','2014-11-09 00:00:00');
/*!40000 ALTER TABLE `Comunicacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Contacto`
--

DROP TABLE IF EXISTS `Contacto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Contacto` (
  `Numero_ID` int(11) NOT NULL,
  `Cuit` decimal(11,0) DEFAULT NULL,
  `Nombre` varchar(30) DEFAULT NULL,
  `Apellido` varchar(30) DEFAULT NULL,
  `Fecha_de_Nacimiento` date DEFAULT NULL,
  `Apodo` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`Numero_ID`),
  KEY `fk_contacto_cuit` (`Cuit`),
  CONSTRAINT `fk_contacto_cuit` FOREIGN KEY (`Cuit`) REFERENCES `Cliente` (`Cuit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Contacto`
--

LOCK TABLES `Contacto` WRITE;
/*!40000 ALTER TABLE `Contacto` DISABLE KEYS */;
INSERT INTO `Contacto` VALUES (1,41168483062,'Judah','Hewitt','2014-07-27','Chiche'),(2,37395045887,'Callum','Woodward','2014-09-25','Chiche'),(3,38817149425,'Adele','Kemp','2015-08-15','Chiqui'),(4,21857959152,'Melodie','Barker','2015-09-17',''),(5,37634697973,'Yvette','Montoya','2014-08-01','Lolo'),(6,46690258622,'Keegan','Francis','2014-04-08',''),(7,46430152934,'Frances','Clark','2014-05-20','Lito'),(8,38421805343,'Kennan','Marsh','2014-12-01',''),(9,45206904390,'Jessamine','Maynard','2014-07-31','Lolo'),(10,20733797847,'Ferdinand','Cain','2013-09-24',''),(11,44492424700,'Zachary','Guerra','2015-05-25',''),(12,24575097766,'Paloma','Avery','2014-09-24','Mosca'),(13,40054868870,'Ralph','Hurst','2014-05-28',''),(14,37842910105,'Cleo','Beach','2015-08-05',''),(15,25224345014,'Marny','Pierce','2015-06-19','Lolo'),(16,25224345014,'Berk','Forbes','2014-03-02','Mosca'),(17,42381513522,'Tanya','Bowen','2014-10-12',''),(18,48194781422,'Erich','Hodge','2014-01-21','Chiche'),(19,48978380447,'Carissa','Mccullough','2014-08-09','Mosca'),(20,47157018047,'Chastity','Frazier','2015-08-07','Lito'),(21,20964881694,'Sade','Owens','2014-12-29','Chiche');
/*!40000 ALTER TABLE `Contacto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EmailContacto`
--

DROP TABLE IF EXISTS `EmailContacto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EmailContacto` (
  `Email` varchar(30) NOT NULL,
  `Numero_ID` int(11) NOT NULL,
  PRIMARY KEY (`Email`,`Numero_ID`),
  KEY `fk_ec_nid` (`Numero_ID`),
  CONSTRAINT `fk_ec_nid` FOREIGN KEY (`Numero_ID`) REFERENCES `Contacto` (`Numero_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EmailContacto`
--

LOCK TABLES `EmailContacto` WRITE;
/*!40000 ALTER TABLE `EmailContacto` DISABLE KEYS */;
INSERT INTO `EmailContacto` VALUES ('accumsan.convallis.ante@loremf',1),('eleifend@scelerisque.edu',1),('neque@arcuiaculis.com',3),('ac@Aeneangravida.ca',4),('magna.tellus.faucibus@nuncsita',4),('diam.Sed.diam@Proinvel.edu',5),('nulla.Integer.vulputate@vitaed',5),('Suspendisse@augue.edu',6),('lobortis.augue.scelerisque@nec',7),('nec@cursusetmagna.co.uk',7),('non@ornarelibero.edu',9),('tristique.senectus.et@urnaNull',10),('arcu.Vivamus@malesuadafames.ca',11),('tellus.faucibus.leo@bibendumfe',11),('vulputate@aliquam.co.uk',11),('gravida@Nunc.co.uk',12),('imperdiet.nec.leo@iaculisodioN',13),('luctus.felis.purus@auctorquist',13),('pretium@enimnisl.co.uk',13),('neque.non.quam@Aeneaneget.co.u',14),('est@sedorci.com',16),('et@ac.net',16),('id@rutrumFusce.ca',16),('sapien.gravida@ornare.net',16),('orci@lacusvariuset.com',18),('tempor@inaliquetlobortis.net',18),('eleifend.vitae.erat@aliquet.ca',19),('ultricies.adipiscing.enim@amet',19),('ut.cursus.luctus@Nullaegetmetu',20),('In@rutrum.net',21);
/*!40000 ALTER TABLE `EmailContacto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Maquina`
--

DROP TABLE IF EXISTS `Maquina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Maquina` (
  `ID_Maquina` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Marca` varchar(20) NOT NULL,
  `Modelo` varchar(20) NOT NULL,
  PRIMARY KEY (`ID_Maquina`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Maquina`
--

LOCK TABLES `Maquina` WRITE;
/*!40000 ALTER TABLE `Maquina` DISABLE KEYS */;
INSERT INTO `Maquina` VALUES (1,'A Incorporated','JA689p'),(2,'Ac Nulla Corp.','NX072l'),(3,'Aenean LLP','JP471q'),(4,'Aliquam Institute','TH723p'),(5,'Aptent Taciti Socios','PV103b'),(6,'At Sem Molestie Cons','AI421p'),(7,'Consequat Corporatio','ZT202a'),(8,'Cras Convallis Conva','KM388d'),(9,'Cursus Integer Molli','KU431w'),(10,'Diam Institute','NO991f'),(11,'Diam LLP','QW469l'),(12,'Dolor Donec Inc.','BF376b'),(13,'Dolor Tempus Inc.','BW952q'),(14,'Donec LLP','SV475o'),(15,'Duis Gravida Praesen','BO367l'),(16,'Egestas Aliquam Asso','CV085k'),(17,'Egestas Corporation','OP439y'),(18,'Eget Metus In Limite','IY922k'),(19,'Elementum Limited','WF627v'),(20,'Elit A Feugiat Incor','KV163l'),(21,'Elit Erat Vitae Indu','TG910a'),(22,'Elit Etiam Laoreet I','XM629y'),(23,'Et Tristique Pellent','FK228f'),(24,'Eu Neque Company','DX343e'),(25,'Eu Neque Incorporate','JR387o'),(26,'Fusce Aliquam LLC','EG830v'),(27,'Fusce Fermentum Indu','QI218i'),(28,'In Consulting','IB182k'),(29,'Interdum Curabitur D','LD860s'),(30,'Justo LLC','RR799m'),(31,'Lacus Cras Interdum ','WA701n'),(32,'Lectus Convallis Est','YW791h'),(33,'Lectus Convallis LLP','AA652m'),(34,'Ligula Incorporated','SL862l'),(35,'Lorem Vitae Company','DC370x'),(36,'Massa Ltd','SH165f'),(37,'Molestie Institute','GF253g'),(38,'Natoque Penatibus Et','PV702h'),(39,'Neque Foundation','LY652q'),(40,'Nibh Lacinia Orci Lt','PO207z'),(41,'Non Nisi LLP','OO653c'),(42,'Non Quam Pellentesqu','GS953l'),(43,'Nulla Tempor Augue L','RX486p'),(44,'Nunc Ltd','QX808x'),(45,'Orci In Consequat In','SG290u'),(46,'Pharetra Corporation','VJ036f'),(47,'Pretium Et Rutrum In','ET779e'),(48,'Proin LLC','YT186z'),(49,'Purus Maecenas Liber','PN222o'),(50,'Quam LLP','WI139c'),(51,'Quisque Varius Nam I','WK222e'),(52,'Sagittis Nullam Asso','MP498z'),(53,'Sed Foundation','CL042w'),(54,'Sed Sem Egestas Ltd','DO528a'),(55,'Senectus PC','WH743c'),(56,'Sit Amet Company','JX897a'),(57,'Ultrices Duis Founda','NL187p'),(58,'Ultrices Duis LLP','UO416j'),(59,'Ut Lacus Nulla LLP','CP670r'),(60,'Vel Sapien Ltd','HA703n');
/*!40000 ALTER TABLE `Maquina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `NumeroTelefonoContacto`
--

DROP TABLE IF EXISTS `NumeroTelefonoContacto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `NumeroTelefonoContacto` (
  `Numero` bigint(20) unsigned NOT NULL DEFAULT '0',
  `Numero_ID` int(11) NOT NULL,
  PRIMARY KEY (`Numero`,`Numero_ID`),
  KEY `fk_numtelcont_num_id` (`Numero_ID`),
  CONSTRAINT `fk_numtelcont_num_id` FOREIGN KEY (`Numero_ID`) REFERENCES `Contacto` (`Numero_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `NumeroTelefonoContacto`
--

LOCK TABLES `NumeroTelefonoContacto` WRITE;
/*!40000 ALTER TABLE `NumeroTelefonoContacto` DISABLE KEYS */;
INSERT INTO `NumeroTelefonoContacto` VALUES (4146262,1),(4390010,1),(4329048,3),(4425304,3),(4959217,4),(4683103,5),(4123348,6),(4544345,6),(4775479,6),(4860944,6),(4587599,7),(4827946,7),(4242845,8),(4567018,8),(4786051,8),(4817287,8),(4918122,8),(4132621,10),(4398950,10),(4049355,11),(4286350,12),(4610846,12),(4274071,14),(4205161,17),(4264954,17),(4954749,17),(4575118,18),(4049621,21),(4341290,21),(4510024,21);
/*!40000 ALTER TABLE `NumeroTelefonoContacto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Provincia`
--

DROP TABLE IF EXISTS `Provincia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Provincia` (
  `CP_Provincia` char(1) NOT NULL,
  `Nombre` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`CP_Provincia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Provincia`
--

LOCK TABLES `Provincia` WRITE;
/*!40000 ALTER TABLE `Provincia` DISABLE KEYS */;
INSERT INTO `Provincia` VALUES ('E','Entre Rios'),('L','La Pampa'),('X','Cordoba'),('Z','Santa Cruz');
/*!40000 ALTER TABLE `Provincia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Vendedor`
--

DROP TABLE IF EXISTS `Vendedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Vendedor` (
  `Cuil` decimal(11,0) unsigned NOT NULL,
  `Nombre` varchar(30) DEFAULT NULL,
  `Apellido` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`Cuil`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Vendedor`
--

LOCK TABLES `Vendedor` WRITE;
/*!40000 ALTER TABLE `Vendedor` DISABLE KEYS */;
INSERT INTO `Vendedor` VALUES (20675821714,'Aurora','Dalton'),(21020908281,'Serina','Love'),(21588486935,'Silas','Avila'),(22057905057,'Calista','Ratliff'),(22839933279,'Karleigh','Alvarez'),(23140188679,'John','Watkins'),(23661966184,'Wynter','Bush'),(26038334742,'Emery','Gilbert'),(26048204535,'Penelope','Mcleod'),(26213114093,'Jin','Terrell'),(26301106493,'Oren','Koch'),(26465204143,'Adrienne','Wong'),(27980914786,'Mira','Simmons'),(29685802720,'Charity','Silva'),(31576877022,'Yoshio','Ewing'),(33445206834,'Yuli','Little'),(34419713737,'Zeph','Stark'),(38331147320,'Demetrius','Whitney'),(39728412060,'Ira','Bonner'),(39942457508,'Jade','Coffey');
/*!40000 ALTER TABLE `Vendedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `VendedorCliente`
--

DROP TABLE IF EXISTS `VendedorCliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `VendedorCliente` (
  `Cuil` decimal(11,0) unsigned NOT NULL DEFAULT '0',
  `Cuit` decimal(11,0) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`Cuil`,`Cuit`),
  KEY `fk_vendedor_cliente_cuit` (`Cuit`),
  CONSTRAINT `fk_vendedor_cliente_cuil` FOREIGN KEY (`Cuil`) REFERENCES `Vendedor` (`Cuil`),
  CONSTRAINT `fk_vendedor_cliente_cuit` FOREIGN KEY (`Cuit`) REFERENCES `Cliente` (`Cuit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `VendedorCliente`
--

LOCK TABLES `VendedorCliente` WRITE;
/*!40000 ALTER TABLE `VendedorCliente` DISABLE KEYS */;
INSERT INTO `VendedorCliente` VALUES (39728412060,20733797847),(33445206834,20964881694),(20675821714,21857959152),(34419713737,24575097766),(29685802720,25224345014),(27980914786,37395045887),(20675821714,37634697973),(26048204535,37842910105),(21020908281,38421805343),(26213114093,38817149425),(39942457508,40054868870),(21588486935,41168483062),(20675821714,42381513522),(22057905057,44492424700),(23661966184,45206904390),(26038334742,46430152934),(34419713737,46690258622),(31576877022,47157018047),(26301106493,48194781422),(23140188679,48978380447);
/*!40000 ALTER TABLE `VendedorCliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Zona`
--

DROP TABLE IF EXISTS `Zona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Zona` (
  `NombreZona` varchar(20) NOT NULL,
  PRIMARY KEY (`NombreZona`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Zona`
--

LOCK TABLES `Zona` WRITE;
/*!40000 ALTER TABLE `Zona` DISABLE KEYS */;
INSERT INTO `Zona` VALUES ('Interior'),('Noreste'),('Pampa'),('Patagonia');
/*!40000 ALTER TABLE `Zona` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-10-17 18:01:02
