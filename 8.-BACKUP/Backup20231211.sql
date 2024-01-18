CREATE DATABASE  IF NOT EXISTS `hospital_bautista` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `hospital_bautista`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: hospital_bautista
-- ------------------------------------------------------
-- Server version	8.0.34

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cita_paciente_medico`
--

DROP TABLE IF EXISTS `cita_paciente_medico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cita_paciente_medico` (
  `ID_CITA` int NOT NULL,
  `FECHA_CITA` datetime DEFAULT NULL,
  `ESTADO_CITA` varchar(50) DEFAULT NULL,
  `ID_PACIENTE` int DEFAULT NULL,
  `ID_MEDICO` int DEFAULT NULL,
  PRIMARY KEY (`ID_CITA`),
  KEY `FK_CITA_PACIENTE` (`ID_PACIENTE`),
  KEY `FK_CITA_MEDICO` (`ID_MEDICO`),
  CONSTRAINT `FK_CITA_MEDICO` FOREIGN KEY (`ID_MEDICO`) REFERENCES `medico` (`ID_MEDICO`),
  CONSTRAINT `FK_CITA_PACIENTE` FOREIGN KEY (`ID_PACIENTE`) REFERENCES `paciente` (`ID_PACIENTE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='TABLA DE CITAS MEDICA';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cita_paciente_medico`
--

LOCK TABLES `cita_paciente_medico` WRITE;
/*!40000 ALTER TABLE `cita_paciente_medico` DISABLE KEYS */;
INSERT INTO `cita_paciente_medico` VALUES (1,'2023-03-06 08:00:00','COMPLETADA',6,1),(2,'2023-05-08 10:00:00','COMPLETADA',4,12),(3,'2023-05-16 12:00:00','COMPLETADA',11,8),(4,'2023-05-26 14:00:00','COMPLETADA',1,15),(5,'2023-06-02 08:30:00','COMPLETADA',10,5),(6,'2023-07-10 09:30:00','COMPLETADA',2,5),(7,'2023-07-18 11:00:00','COMPLETADA',9,11),(8,'2023-08-30 13:00:00','COMPLETADA',12,11),(9,'2023-09-24 14:00:00','COMPLETADA',3,15),(10,'2023-10-04 15:00:00','COMPLETADA',8,2),(11,'2023-10-10 17:00:00','COMPLETADA',5,9),(12,'2023-10-16 11:30:00','COMPLETADA',15,11),(13,'2023-10-20 15:30:00','COMPLETADA',13,7),(14,'2023-11-03 16:00:00','COMPLETADA',7,3),(15,'2023-11-04 17:30:00','COMPLETADA',14,5);
/*!40000 ALTER TABLE `cita_paciente_medico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consultorio`
--

DROP TABLE IF EXISTS `consultorio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `consultorio` (
  `ID_CONSULTORIO` int NOT NULL,
  `NUMERO_CONSULTORIO` varchar(15) DEFAULT NULL,
  `UBICACION` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`ID_CONSULTORIO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='TABLA DE LOS CONSULTORIOS QUE TIENE EL HOSPITAL';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consultorio`
--

LOCK TABLES `consultorio` WRITE;
/*!40000 ALTER TABLE `consultorio` DISABLE KEYS */;
INSERT INTO `consultorio` VALUES (1,'1A','PISO 1'),(2,'2A','PISO 1'),(3,'3A','PISO 1'),(4,'1B','PISO 2'),(5,'2B','PISO 2'),(6,'3B','PISO 2'),(7,'1C','PISO 3'),(8,'2C','PISO 3'),(9,'3C','PISO 3'),(10,'1D','PISO 4'),(11,'2D','PISO 4'),(12,'3D','PISO 4'),(13,'1E','PISO 5'),(14,'2E','PISO 5'),(15,'3E','PISO 5');
/*!40000 ALTER TABLE `consultorio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consultorio_medico`
--

DROP TABLE IF EXISTS `consultorio_medico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `consultorio_medico` (
  `CONSULTORIO_MEDICO_ID` int NOT NULL,
  `ID_CONSULTORIO` int DEFAULT NULL,
  `ID_MEDICO` int DEFAULT NULL,
  PRIMARY KEY (`CONSULTORIO_MEDICO_ID`),
  KEY `FK_CONSULTORIO_MEDICO_MEDICO` (`ID_MEDICO`),
  KEY `FK_CONSULTORIO_MEDICO_CONSULTORIO` (`ID_CONSULTORIO`),
  CONSTRAINT `FK_CONSULTORIO_MEDICO_CONSULTORIO` FOREIGN KEY (`ID_CONSULTORIO`) REFERENCES `consultorio` (`ID_CONSULTORIO`),
  CONSTRAINT `FK_CONSULTORIO_MEDICO_MEDICO` FOREIGN KEY (`ID_MEDICO`) REFERENCES `medico` (`ID_MEDICO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='TABLA CON INFORMACION QUE RELACIONA AL MEDICO CON EL CONSULTORIO EN DONDE ATIENDE';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consultorio_medico`
--

LOCK TABLES `consultorio_medico` WRITE;
/*!40000 ALTER TABLE `consultorio_medico` DISABLE KEYS */;
INSERT INTO `consultorio_medico` VALUES (1,1,1),(2,2,4),(3,3,9),(4,4,12),(5,5,5),(6,6,15),(7,7,13),(8,8,6),(9,9,8),(10,10,3),(11,11,10),(12,12,2),(13,13,11),(14,14,14),(15,15,7);
/*!40000 ALTER TABLE `consultorio_medico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `especialidad_medico`
--

DROP TABLE IF EXISTS `especialidad_medico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `especialidad_medico` (
  `ID_ESPECIALIDAD` int NOT NULL,
  `NOMBRE_ESPECIALIDAD` varchar(100) DEFAULT NULL,
  `ID_MEDICO` int DEFAULT NULL,
  PRIMARY KEY (`ID_ESPECIALIDAD`),
  KEY `FK_ESPECIALIDAD_MEDICO_MEDICO` (`ID_MEDICO`),
  CONSTRAINT `FK_ESPECIALIDAD_MEDICO_MEDICO` FOREIGN KEY (`ID_MEDICO`) REFERENCES `medico` (`ID_MEDICO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='TABLA CON INFORMACION DE LA ESPECIALIDAD DE LOS MEDICOS DEL HOSPITAL';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `especialidad_medico`
--

LOCK TABLES `especialidad_medico` WRITE;
/*!40000 ALTER TABLE `especialidad_medico` DISABLE KEYS */;
INSERT INTO `especialidad_medico` VALUES (1,'CARDIOLOGIA',1),(2,'CIRUGIA GENERAL',4),(3,'DERMATOLOGIA',9),(4,'ENDOCRINOLOGIA',12),(5,'GINECOLOGIA Y OBSTETRICIA',5),(6,'MEDICINA INTERNA',15),(7,'NEFROLOGIA',13),(8,'NEUROLOGIA',6),(9,'OFTALMOLOGIA',8),(10,'ONCOLOGIA',3),(11,'OTORRINOLARINGOLOGIA',10),(12,'PEDIATRIA',2),(13,'PSIQUIATRIA',11),(14,'RADIOLOGIA',14),(15,'TRAUMATOLOGIA',7);
/*!40000 ALTER TABLE `especialidad_medico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factura`
--

DROP TABLE IF EXISTS `factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `factura` (
  `ID_FACTURA` int NOT NULL,
  `NUMERO_FACTURA` varchar(30) DEFAULT NULL,
  `FECHA_FACTURA` date DEFAULT NULL,
  `MONTO_PAGADO_CLP` varchar(100) DEFAULT NULL,
  `METODO_PAGO` varchar(30) DEFAULT NULL,
  `ID_PACIENTE` int NOT NULL,
  `ID_ESPECIALIDAD` int DEFAULT NULL,
  PRIMARY KEY (`ID_FACTURA`),
  KEY `FK_FACTURA_PACIENTE` (`ID_PACIENTE`),
  KEY `FK_FACTURA_ESPECIALIDAD` (`ID_ESPECIALIDAD`),
  CONSTRAINT `FK_FACTURA_ESPECIALIDAD` FOREIGN KEY (`ID_ESPECIALIDAD`) REFERENCES `especialidad_medico` (`ID_ESPECIALIDAD`),
  CONSTRAINT `FK_FACTURA_PACIENTE` FOREIGN KEY (`ID_PACIENTE`) REFERENCES `paciente` (`ID_PACIENTE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='TABLA DE FACTURA CON EL PAGO DE LOS DATOS DE PAGO DE LA CONSULTA';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura`
--

LOCK TABLES `factura` WRITE;
/*!40000 ALTER TABLE `factura` DISABLE KEYS */;
INSERT INTO `factura` VALUES (1,'F101','2023-03-06','20000',' DEBITO ',1,6),(2,'F102','2023-05-08','20000',' CREDITO ',2,5),(3,'F103','2023-05-16','20000',' EFECTIVO ',3,6),(4,'F104','2023-05-26','20000',' EFECTIVO ',4,4),(5,'F105','2023-06-02','20000',' DEBITO ',5,3),(6,'F106','2023-07-10','20000',' DEBITO ',6,1),(7,'F107','2023-07-18','20000',' CREDITO ',7,10),(8,'F108','2023-08-30','25000',' EFECTIVO ',8,12),(9,'F109','2023-09-24','25000',' DEBITO ',9,13),(10,'F1010','2023-10-04','25000',' DEBITO ',10,5),(11,'F1011','2023-10-10','25000',' CREDITO ',11,9),(12,'F1012','2023-10-16','25000',' EFECTIVO ',12,13),(13,'F1013','2023-10-20','25000',' DEBITO ',13,15),(14,'F1014','2023-11-03','25000',' DEBITO ',14,5),(15,'F1015','2023-11-04','25000',' DEBITO ',15,13);
/*!40000 ALTER TABLE `factura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `farmacia`
--

DROP TABLE IF EXISTS `farmacia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `farmacia` (
  `ID_MEDICAMENTO` int NOT NULL,
  `NOMBRE_MEDICAMENTO` varchar(30) DEFAULT NULL,
  `LOTE` varchar(30) DEFAULT NULL,
  `FECHA_CADUCIDAD` date DEFAULT NULL,
  `STOCK_MEDICAMENTO` int DEFAULT NULL,
  `NOTAS` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID_MEDICAMENTO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='TABLA CON INFORMACION DE LOS MEDICAMENTOS QUE TIENE EL HOSPITAL';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `farmacia`
--

LOCK TABLES `farmacia` WRITE;
/*!40000 ALTER TABLE `farmacia` DISABLE KEYS */;
INSERT INTO `farmacia` VALUES (1,'PARACETAMOL','A12056','2025-04-12',30,'VIA ORAL'),(2,'IBUPROFENO','B12157','2025-05-14',42,'VIA ORAL'),(3,'TRAMADOL','C12258','2025-06-16',40,'VIA ORAL'),(4,'CIPROFLOXACINO OTICO','D12359','2026-01-10',35,'VIA OTICA'),(5,'SERTRALINA','E12460','2024-12-20',55,'VIA ORAL'),(6,'METOTREXATO','F12561','2025-10-08',34,'VIA ORAL'),(7,'KETOROLACO','G12662','2026-07-28',68,'VIA ORAL'),(8,'SALBUTAMOL','H12763','2025-04-15',14,'VIA RESPIRATORIA'),(9,'AMOXICILINA','I12864','2026-01-05',70,'VIA ORAL'),(10,'ASPIRINA','J12965','2024-12-12',200,'VIA ORAL'),(11,'METRONIDAZOL-OVULOS','K13066','2025-04-09',50,'VAGINAL'),(12,'ISOTRETINOINA','L13167','2026-02-17',15,'VIA ORAL'),(13,'LOSARTAN','M13268','2024-10-19',80,'VIA ORAL'),(14,'DICLOFENACO','N13369','2025-05-24',65,'VIA ORAL'),(15,'METFORMINA','P13470','2026-06-15',25,'VIA ORAL'),(16,'CIPROFLOXACINO OCULAR','Q13571','2026-07-30',40,'VIA OCULAR'),(17,'FLUOXETINA','R13672','2025-06-01',45,' VIA ORAL   ');
/*!40000 ALTER TABLE `farmacia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historia_paciente`
--

DROP TABLE IF EXISTS `historia_paciente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historia_paciente` (
  `ID_HISTORIA` int NOT NULL,
  `HORA_ENTRADA` time DEFAULT NULL,
  `HORA_SALIDA` time DEFAULT NULL,
  `DIAGNOSTICO` varchar(500) DEFAULT NULL,
  `OBSERVACIONES` varchar(1000) DEFAULT NULL,
  `ID_PACIENTE` int DEFAULT NULL,
  `ID_MEDICO` int DEFAULT NULL,
  PRIMARY KEY (`ID_HISTORIA`),
  KEY `FK_HISTORIA_PACIENTE_PACIENTE` (`ID_PACIENTE`),
  KEY `FK_HISTORIA_PACIENTE_MEDICO` (`ID_MEDICO`),
  CONSTRAINT `FK_HISTORIA_PACIENTE_MEDICO` FOREIGN KEY (`ID_MEDICO`) REFERENCES `medico` (`ID_MEDICO`),
  CONSTRAINT `FK_HISTORIA_PACIENTE_PACIENTE` FOREIGN KEY (`ID_PACIENTE`) REFERENCES `paciente` (`ID_PACIENTE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='TABLA DE HISTORIA MEDICA';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historia_paciente`
--

LOCK TABLES `historia_paciente` WRITE;
/*!40000 ALTER TABLE `historia_paciente` DISABLE KEYS */;
INSERT INTO `historia_paciente` VALUES (1,'08:00:00','08:30:00','HIPERTENSION','RETIRO DE MEDICAMENTOS EN FARMACIA',6,1),(2,'10:00:00','10:30:00','DIABETES','CAMBIO DE DOSIS DEL MEDICAMENTO',4,12),(3,'12:00:00','12:30:00','INFECCION OCULAR','RETIRO DE MEDICAMENTOS EN FARMACIA',11,8),(4,'14:00:00','14:30:00','MIGRAÃ‘A','RETIRO DE MEDICAMENTOS EN FARMACIA',1,15),(5,'08:30:00','09:00:00',NULL,'REALIZAR EXAMENES COMPLEMENTARIOS ',10,5),(6,'09:30:00','10:00:00',NULL,'REALIZAR EXAMENES COMPLEMENTARIOS EN LABORATORIO',2,5),(7,'11:00:00','11:30:00','DEPRESION','RETIRO DE MEDICAMENTOS EN FARMACIA',9,11),(8,'13:00:00','13:30:00','ATAQUE DE PANICO','RETIRO DE MEDICAMENTOS EN FARMACIA',12,11),(9,'14:00:00','14:30:00','BRONQUITIS','LICENCIA POR 2 DIAS, RETIRO DE MEDICAMENTOS EN FARMACIA',3,15),(10,'15:00:00','15:30:00','INFECCION VIRAL','RETIRO DE MEDICAMENTOS EN FARMACIA',8,2),(11,'17:00:00','17:30:00','ACNE','REALIZAR EXAMENES COMPLEMENTARIOS EN LABORATORIO',5,9),(12,'11:30:00','12:00:00','BIPOLARIDAD','RETIRO DE MEDICAMENTOS EN FARMACIA',15,11),(13,'15:30:00','16:00:00','TENDINITIS ROTULIANA','LICENCIA POR 5 DIAS Y ASISTIR A KINESIOLOGIA',13,7),(14,'16:00:00','16:30:00','CANCER DE PROSTATA','REALIZAR EXAMENES COMPLEMENTARIOS',7,3),(15,'17:30:00','18:00:00','SINDROME PREMENSTRUAL','RETIRO DE MEDICAMENTOS EN FARMACIA',14,5);
/*!40000 ALTER TABLE `historia_paciente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medico`
--

DROP TABLE IF EXISTS `medico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medico` (
  `ID_MEDICO` int NOT NULL,
  `NOMBRE_MEDICO` varchar(15) DEFAULT NULL,
  `APELLIDO_MEDICO` varchar(15) DEFAULT NULL,
  `EMAIL_MEDICO` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID_MEDICO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='TABLA CON INFORMACION DEL MEDICO';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medico`
--

LOCK TABLES `medico` WRITE;
/*!40000 ALTER TABLE `medico` DISABLE KEYS */;
INSERT INTO `medico` VALUES (1,'SOFIA','GONZALEZ','SOFIA.GONZALEZ@EMAIL.COM'),(2,'MARTIN','SOTO','MARTIN.SOTO@EMAIL.COM'),(3,'VALENTINA','TORRES','VALENTINA.TORRES@EMAIL.COM'),(4,'MATIAS','DIAZ','MATIAS.DIAZ@EMAIL.COM'),(5,'ANTONIA','HERRERA','ANTONIA.HERRERA@EMAIL.COM'),(6,'SEBASTIAN','CASTRO','SEBASTIAN.CASTRO@EMAIL.COM'),(7,'ISABELLA','MUÃ‘OZ','ISABELLA.MUNOZ@EMAIL.COM'),(8,'NICOLAS','CONTRERAS','NICOLAS.CONTRERAS@EMAIL.COM'),(9,'RENATA','ROJAS','RENATA.ROJAS@EMAIL.COM'),(10,'FRANCISCO','PEREZ','FRANCISCO.PEREZ@EMAIL.COM'),(11,'FAUSTINO','GUEVARA','FAUSTINO.GUEVARA@GMAIL.COM'),(12,'AMANCIO','CARDOZO','AMANCIO.CARDOZO@GMAIL.COM'),(13,'ARTEMIO','FARINELLO','ARTEMIO.FARINELLO@GMAIL.COM'),(14,'DELFINA','CARACCIOLO','DELFINA.CARACCIOLO@GMAIL.COM'),(15,'BENICIO','CUNIETTI','BENICIO.CUNIETTI@GMAIL.COM');
/*!40000 ALTER TABLE `medico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paciente`
--

DROP TABLE IF EXISTS `paciente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paciente` (
  `ID_PACIENTE` int NOT NULL,
  `NOMBRE_PACIENTE` varchar(50) DEFAULT NULL,
  `APELLIDO_PACIENTE` varchar(50) DEFAULT NULL,
  `CEDULA_PACIENTE` char(15) DEFAULT NULL,
  `FECHA_NACIMIENTO` date DEFAULT NULL,
  `TELEFONO_PACIENTE` varchar(20) DEFAULT NULL,
  `DIRECCION_PACIENTE` varchar(100) DEFAULT NULL,
  `EMAIL_PACIENTE` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID_PACIENTE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='TABLA CON INFORMACION DEL PACIENTE';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paciente`
--

LOCK TABLES `paciente` WRITE;
/*!40000 ALTER TABLE `paciente` DISABLE KEYS */;
INSERT INTO `paciente` VALUES (1,'JUAN','PEREZ','12345678-9','1965-08-15','912345678','SANTIAGO, REGION METROPOLITANA','JUAN.PEREZ@GMAIL.COM'),(2,'MARIA','GOMEZ','23456789-K','1973-04-07','923456789','VALPARAISO, REGION DE VALPARAISO','MARIA.GOMEZ@GMAIL.COM'),(3,'LUIS','RODRIGUEZ','34567890-1','1980-11-23','934567890','CONCEPCION, REGION DEL BIOBIO','LUIS.RODRIGUEZ@GMAIL.COM'),(4,'ANA','MARTINEZ','45678901-2','1987-05-12','945678901','LA SERENA, REGION DE COQUIMBO','ANA.MARTINEZ@GMAIL.COM'),(5,'CARLOS','LOPEZ','56789012-3','1994-02-02','956789012','ANTOFAGASTA, REGION DE ANTOFAGASTA','CARLOS.LOPEZ@GMAIL.COM'),(6,'LAURA','SANCHEZ','67890123-4','2000-07-18','967890123','ARICA, REGION DE ARICA Y PARINACOTA','LAURA.SANCHEZ@GMAIL.COM'),(7,'PEDRO','FERNANDEZ','78901234-5','2007-03-09','978901234','PUERTO MONTT, REGION DE LOS LAGOS','PEDRO.FERNANDEZ@GMAIL.COM'),(8,'ISABEL','GARCIA','89012345-6','2014-10-25','989012345','RANCAGUA, REGION DE O\'HIGGINS','ISABEL.GARCIA@GMAIL.COM'),(9,'ROBERTO','HERNANDEZ','90123456-7','1961-12-06','990123456','TALCA, REGION DEL MAULE','ROBERTO.HERNANDEZ@GMAIL.COM'),(10,'SOFIA','DIAZ','15347876-8','1969-09-29','911223344','IQUIQUE, REGION DE TARAPACA','SOFIA.DIAZ@GMAIL.COM'),(11,'MIGUEL','TORRES','12345678-K','1976-06-14','922334455','CURICO, REGION DEL MAULE','MIGUEL.TORRES@GMAIL.COM'),(12,'CARMEN','ORTEGA','23456789-1','1983-01-03','933445566','PUNTA ARENAS, REGION DE MAGALLANES','CARMEN.ORTEGA@GMAIL.COM'),(13,'ALEJANDRO','LARA','34567890-2','1990-04-22','944556677','COPIAPO, REGION DE ATACAMA','ALEJANDRO.LARA@GMAIL.COM'),(14,'PAULA','PINEDA','45678901-3','1997-11-11','955667788','IQUIQUE, REGION DE TARAPACA','PAULA.PINEDA@GMAIL.COM'),(15,'JAVIER','CASTRO','56789012-4','2003-08-30','966778899','VIÃ‘A DEL MAR, REGION DE VALPARAISO','JAVIER.CASTRO@GMAIL.COM'),(17,'ANITA','RAMIREZ','27209173-0','1960-07-25','947775208','SANTIAGO, REGION METROPOLITANA','ANITA.RAMIREZD@GMAIL.COM'),(19,'PAOLA','ALVARADO','28207175-0','1989-07-24','937775201','SANTIAGO, REGION METROPOLITANA','PAOLA.ALVARADO@GMAIL.COM');
/*!40000 ALTER TABLE `paciente` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `PACIENTE_REGISTRO_AI` AFTER INSERT ON `paciente` FOR EACH ROW INSERT INTO PACIENTE_REGISTRO (ID_PACIENTE_R, NOMBRE_PACIENTE, 
APELLIDO_PACIENTE, FECHA_NACIMIENTO, TELEFONO_PACIENTE, DIRECCION_PACIENTE, EMAIL_PACIENTE, USUARIO, FECHA_REGISTRO) 
VALUES (NEW.ID_PACIENTE, NEW.NOMBRE_PACIENTE, NEW.APELLIDO_PACIENTE, NEW.FECHA_NACIMIENTO, NEW.TELEFONO_PACIENTE, 
NEW.DIRECCION_PACIENTE, NEW.EMAIL_PACIENTE, CURRENT_USER, NOW()) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `paciente_registro`
--

DROP TABLE IF EXISTS `paciente_registro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paciente_registro` (
  `ID_PACIENTE_R` int DEFAULT NULL,
  `NOMBRE_PACIENTE` varchar(50) DEFAULT NULL,
  `APELLIDO_PACIENTE` varchar(50) DEFAULT NULL,
  `FECHA_NACIMIENTO` date DEFAULT NULL,
  `TELEFONO_PACIENTE` varchar(50) DEFAULT NULL,
  `DIRECCION_PACIENTE` varchar(50) DEFAULT NULL,
  `EMAIL_PACIENTE` varchar(50) DEFAULT NULL,
  `USUARIO` varchar(50) DEFAULT NULL,
  `FECHA_REGISTRO` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paciente_registro`
--

LOCK TABLES `paciente_registro` WRITE;
/*!40000 ALTER TABLE `paciente_registro` DISABLE KEYS */;
INSERT INTO `paciente_registro` VALUES (19,'PAOLA','ALVARADO','1989-07-24','937775201','SANTIAGO, REGION METROPOLITANA','PAOLA.ALVARADO@GMAIL.COM','root@localhost','2023-12-07 00:35:03');
/*!40000 ALTER TABLE `paciente_registro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prescripciones`
--

DROP TABLE IF EXISTS `prescripciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prescripciones` (
  `ID_PRESCRIPCION` int NOT NULL,
  `ID_MEDICAMENTO` int DEFAULT NULL,
  `ID_PACIENTE` int DEFAULT NULL,
  `ID_MEDICO` int DEFAULT NULL,
  `ID_HISTORIA` int DEFAULT NULL,
  PRIMARY KEY (`ID_PRESCRIPCION`),
  KEY `FK_PRESCRIPCION_FARMACIA` (`ID_MEDICAMENTO`),
  KEY `FK_PRESCRIPCION_PACIENTE` (`ID_PACIENTE`),
  KEY `FK_PRESCRIPCION_MEDICO` (`ID_MEDICO`),
  CONSTRAINT `FK_PRESCRIPCION_FARMACIA` FOREIGN KEY (`ID_MEDICAMENTO`) REFERENCES `farmacia` (`ID_MEDICAMENTO`),
  CONSTRAINT `FK_PRESCRIPCION_MEDICO` FOREIGN KEY (`ID_MEDICO`) REFERENCES `medico` (`ID_MEDICO`),
  CONSTRAINT `FK_PRESCRIPCION_PACIENTE` FOREIGN KEY (`ID_PACIENTE`) REFERENCES `paciente` (`ID_PACIENTE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='TABLA QUE RELACIONA LAS TABLAS FARMACIA, PACIENTE, MEDICO';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prescripciones`
--

LOCK TABLES `prescripciones` WRITE;
/*!40000 ALTER TABLE `prescripciones` DISABLE KEYS */;
INSERT INTO `prescripciones` VALUES (1,13,6,1,1),(2,16,11,8,3),(3,2,1,15,4),(4,5,9,11,7),(5,5,12,11,8),(6,1,8,2,10),(7,17,15,11,12),(8,2,14,5,15);
/*!40000 ALTER TABLE `prescripciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vista_hora_atencion_paciente_medico`
--

DROP TABLE IF EXISTS `vista_hora_atencion_paciente_medico`;
/*!50001 DROP VIEW IF EXISTS `vista_hora_atencion_paciente_medico`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_hora_atencion_paciente_medico` AS SELECT 
 1 AS `NOMBRE_PACIENTE`,
 1 AS `APELLIDO_PACIENTE`,
 1 AS `FECHA_CITA`,
 1 AS `NOMBRE_MEDICO`,
 1 AS `APELLIDO_MEDICO`,
 1 AS `NOMBRE_ESPECIALIDAD`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_informacion_de_facturas`
--

DROP TABLE IF EXISTS `vista_informacion_de_facturas`;
/*!50001 DROP VIEW IF EXISTS `vista_informacion_de_facturas`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_informacion_de_facturas` AS SELECT 
 1 AS `CANTIDAD_FACTURAS`,
 1 AS `MONTO_TOTAL_FACTURADO`,
 1 AS `METODO_PAGO`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_monto_pagado_del_paciente`
--

DROP TABLE IF EXISTS `vista_monto_pagado_del_paciente`;
/*!50001 DROP VIEW IF EXISTS `vista_monto_pagado_del_paciente`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_monto_pagado_del_paciente` AS SELECT 
 1 AS `NOMBRE_PACIENTE`,
 1 AS `APELLIDO_PACIENTE`,
 1 AS `MONTO_PAGADO_CLP`,
 1 AS `METODO_PAGO`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_paciente_hospital`
--

DROP TABLE IF EXISTS `vista_paciente_hospital`;
/*!50001 DROP VIEW IF EXISTS `vista_paciente_hospital`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_paciente_hospital` AS SELECT 
 1 AS `NOMBRE`,
 1 AS `APELLIDO`,
 1 AS `TELEFONO`,
 1 AS `EMAIL`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_solicitud_productos_bajos_en_stock`
--

DROP TABLE IF EXISTS `vista_solicitud_productos_bajos_en_stock`;
/*!50001 DROP VIEW IF EXISTS `vista_solicitud_productos_bajos_en_stock`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_solicitud_productos_bajos_en_stock` AS SELECT 
 1 AS `PRODUCTOS_BAJOS_EN_STOCK`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'hospital_bautista'
--

--
-- Dumping routines for database 'hospital_bautista'
--
/*!50003 DROP FUNCTION IF EXISTS `FN_CALCULAR_EDAD` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `FN_CALCULAR_EDAD`(FECHA_NACIMIENTO DATE) RETURNS int
    DETERMINISTIC
BEGIN
DECLARE EDAD INT;
SET EDAD= YEAR(CURDATE()) - YEAR(FECHA_NACIMIENTO) - (RIGHT(CURDATE(), 5) < RIGHT(FECHA_NACIMIENTO, 5));
RETURN EDAD;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `FN_CANTIDAD_FACTURAS_POR_METODO_DE_PAGO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `FN_CANTIDAD_FACTURAS_POR_METODO_DE_PAGO`(P_METODO_PAGO VARCHAR(30)) RETURNS int
    DETERMINISTIC
BEGIN
    DECLARE TOTAL_FACTURAS INT;
    SET TOTAL_FACTURAS = (
        SELECT COUNT(ID_FACTURA) FROM FACTURA
        WHERE METODO_PAGO LIKE CONCAT('%', P_METODO_PAGO, '%')
    );
    RETURN TOTAL_FACTURAS; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_INSERTAR_DATOS_PACIENTES` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_INSERTAR_DATOS_PACIENTES`(IN P_ID_PACIENTE INT,
                                                IN P_NOMBRE_PACIENTE VARCHAR(50),
                                                IN P_APELLIDO_PACIENTE VARCHAR(50),
                                                IN P_CEDULA_PACIENTE VARCHAR(50),
												IN P_FECHA_NACIMIENTO DATE,
                                                IN P_TELEFONO_PACIENTE VARCHAR(20),
                                                IN P_DIRECCION_PACIENTE VARCHAR(100),
												IN P_EMAIL_PACIENTE VARCHAR(100))
BEGIN
INSERT INTO HOSPITAL_BAUTISTA.PACIENTE
VALUES (P_ID_PACIENTE, P_NOMBRE_PACIENTE, P_APELLIDO_PACIENTE, P_CEDULA_PACIENTE, P_FECHA_NACIMIENTO,
        P_TELEFONO_PACIENTE, P_DIRECCION_PACIENTE, P_EMAIL_PACIENTE);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_ORDENAR_PACIENTES` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ORDENAR_PACIENTES`(IN P_NOMBRE_COLUMNA VARCHAR(50), IN P_ORDEN VARCHAR(50))
BEGIN
SET @sqlQuery = CONCAT('SELECT * FROM PACIENTE ORDER BY ', P_NOMBRE_COLUMNA,' ', P_ORDEN);
    PREPARE stmt FROM @sqlQuery;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vista_hora_atencion_paciente_medico`
--

/*!50001 DROP VIEW IF EXISTS `vista_hora_atencion_paciente_medico`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_hora_atencion_paciente_medico` AS select `p`.`NOMBRE_PACIENTE` AS `NOMBRE_PACIENTE`,`p`.`APELLIDO_PACIENTE` AS `APELLIDO_PACIENTE`,`c`.`FECHA_CITA` AS `FECHA_CITA`,`m`.`NOMBRE_MEDICO` AS `NOMBRE_MEDICO`,`m`.`APELLIDO_MEDICO` AS `APELLIDO_MEDICO`,`e`.`NOMBRE_ESPECIALIDAD` AS `NOMBRE_ESPECIALIDAD` from (((`paciente` `p` join `cita_paciente_medico` `c` on((`p`.`ID_PACIENTE` = `c`.`ID_PACIENTE`))) join `medico` `m` on((`m`.`ID_MEDICO` = `c`.`ID_MEDICO`))) join `especialidad_medico` `e` on((`m`.`ID_MEDICO` = `e`.`ID_MEDICO`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_informacion_de_facturas`
--

/*!50001 DROP VIEW IF EXISTS `vista_informacion_de_facturas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_informacion_de_facturas` AS select count(`factura`.`ID_FACTURA`) AS `CANTIDAD_FACTURAS`,sum(`factura`.`MONTO_PAGADO_CLP`) AS `MONTO_TOTAL_FACTURADO`,`factura`.`METODO_PAGO` AS `METODO_PAGO` from `factura` group by `factura`.`METODO_PAGO` order by `CANTIDAD_FACTURAS` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_monto_pagado_del_paciente`
--

/*!50001 DROP VIEW IF EXISTS `vista_monto_pagado_del_paciente`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_monto_pagado_del_paciente` AS select `p`.`NOMBRE_PACIENTE` AS `NOMBRE_PACIENTE`,`p`.`APELLIDO_PACIENTE` AS `APELLIDO_PACIENTE`,`f`.`MONTO_PAGADO_CLP` AS `MONTO_PAGADO_CLP`,`f`.`METODO_PAGO` AS `METODO_PAGO` from (`paciente` `p` join `factura` `f` on((`p`.`ID_PACIENTE` = `f`.`ID_PACIENTE`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_paciente_hospital`
--

/*!50001 DROP VIEW IF EXISTS `vista_paciente_hospital`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_paciente_hospital` AS select `paciente`.`NOMBRE_PACIENTE` AS `NOMBRE`,`paciente`.`APELLIDO_PACIENTE` AS `APELLIDO`,`paciente`.`TELEFONO_PACIENTE` AS `TELEFONO`,`paciente`.`EMAIL_PACIENTE` AS `EMAIL` from `paciente` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_solicitud_productos_bajos_en_stock`
--

/*!50001 DROP VIEW IF EXISTS `vista_solicitud_productos_bajos_en_stock`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_solicitud_productos_bajos_en_stock` AS select `farmacia`.`NOMBRE_MEDICAMENTO` AS `PRODUCTOS_BAJOS_EN_STOCK` from `farmacia` where (`farmacia`.`STOCK_MEDICAMENTO` < 20) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-11  0:19:59
