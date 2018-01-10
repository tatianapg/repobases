-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: bdd_seguridades
-- ------------------------------------------------------
-- Server version	5.7.17-log

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
-- Table structure for table `acciones`
--

DROP TABLE IF EXISTS `acciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acciones` (
  `CD_ACCION` int(11) NOT NULL AUTO_INCREMENT,
  `CD_ENTIDAD` int(11) DEFAULT NULL,
  `NM_ACCION` varchar(50) NOT NULL,
  `OBS_ACCION` varchar(200) DEFAULT NULL,
  `ORDEN_ACCION` smallint(6) DEFAULT NULL,
  `FORMA_ACCION` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`CD_ACCION`),
  KEY `FK_RELATIONSHIP_2` (`CD_ENTIDAD`),
  CONSTRAINT `FK_RELATIONSHIP_2` FOREIGN KEY (`CD_ENTIDAD`) REFERENCES `entidades` (`CD_ENTIDAD`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acciones`
--

LOCK TABLES `acciones` WRITE;
/*!40000 ALTER TABLE `acciones` DISABLE KEYS */;
INSERT INTO `acciones` VALUES (1,1,'Crear','Crear paciente',1,'frmIngPaciente.php'),(2,1,'Editar','Editar paciente',2,'frmBuscarPaciente.php'),(3,1,'Reportes','Reportes paciente',3,'frmReportesPaciente.php'),(4,2,'Cargar','Carga producto al inventario',3,'frmCargarProducto.php?c=1'),(5,2,'Descargar','Descargar producto del inventario',4,'frmCargarProducto.php?v=1'),(6,3,'Crear','Crear un producto',1,'frmIngProducto.php'),(7,3,'Editar','Editar producto del inventario',2,'frmBuscarProducto.php'),(8,2,'Crear','Crear inventario',1,'frmIngInventario.php'),(9,2,'Editar','Editar inventario',2,'frmBuscarInventario.php'),(10,2,'Reportes','Reportes inventario',5,'frmReportesInventario.php'),(11,2,'Venta','Pantalla para ventas',6,'sucursalVenta.php'),(12,4,'Crear','Ingresar nueva sucursal',1,'frmIngSucursal.php'),(13,5,'Crear','Ingresar nuevo usuario',1,'frmIngUsuario.php'),(14,5,'Editar','Editar usuarios',2,'frmBuscarUsuario.php'),(15,4,'Editar','Editar sucursal',2,'frmBuscarSucursal.php');
/*!40000 ALTER TABLE `acciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entidades`
--

DROP TABLE IF EXISTS `entidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entidades` (
  `CD_ENTIDAD` int(11) NOT NULL AUTO_INCREMENT,
  `CD_SISTEMA` int(11) DEFAULT NULL,
  `NM_ENTIDAD` varchar(50) DEFAULT NULL,
  `OBS_ENTIDAD` varchar(200) DEFAULT NULL,
  `ORDEN_ENTIDAD` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`CD_ENTIDAD`),
  KEY `FK_RELATIONSHIP_1` (`CD_SISTEMA`),
  CONSTRAINT `FK_RELATIONSHIP_1` FOREIGN KEY (`CD_SISTEMA`) REFERENCES `sistemas` (`CD_SISTEMA`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entidades`
--

LOCK TABLES `entidades` WRITE;
/*!40000 ALTER TABLE `entidades` DISABLE KEYS */;
INSERT INTO `entidades` VALUES (1,1,'Paciente','Pacientes que acuden a Doctoras abejas',1),(2,1,'Inventario','Inventario de Dras. Abejas',2),(3,1,'Producto','Productos que venden en Doctoras abejas',3),(4,1,'Sucursales','Ingreso de sucursales',4),(5,1,'Usuarios','Administración de usuarios',5);
/*!40000 ALTER TABLE `entidades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perfil_acciones`
--

DROP TABLE IF EXISTS `perfil_acciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perfil_acciones` (
  `CD_PERFIL_ACCION` int(11) NOT NULL AUTO_INCREMENT,
  `CD_ACCION` int(11) NOT NULL,
  `CD_PERFIL` int(11) NOT NULL,
  PRIMARY KEY (`CD_PERFIL_ACCION`),
  KEY `FK_RELATIONSHIP_4` (`CD_ACCION`),
  KEY `FK_RELATIONSHIP_5` (`CD_PERFIL`),
  CONSTRAINT `FK_RELATIONSHIP_4` FOREIGN KEY (`CD_ACCION`) REFERENCES `acciones` (`CD_ACCION`),
  CONSTRAINT `FK_RELATIONSHIP_5` FOREIGN KEY (`CD_PERFIL`) REFERENCES `perfiles` (`CD_PERFIL`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perfil_acciones`
--

LOCK TABLES `perfil_acciones` WRITE;
/*!40000 ALTER TABLE `perfil_acciones` DISABLE KEYS */;
INSERT INTO `perfil_acciones` VALUES (1,1,1),(2,2,1),(3,3,1),(4,4,1),(5,5,1),(6,4,3),(7,5,3),(8,6,1),(9,7,1),(10,8,1),(11,9,1),(12,10,1),(13,11,1),(14,11,3),(15,10,3),(16,12,1),(17,13,1),(18,14,1),(19,15,1),(20,7,3),(21,1,2),(22,2,2),(23,3,2),(24,4,2),(25,5,2),(26,6,2),(27,7,2),(28,8,2),(29,9,2),(30,10,2),(31,11,2);
/*!40000 ALTER TABLE `perfil_acciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perfiles`
--

DROP TABLE IF EXISTS `perfiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perfiles` (
  `CD_PERFIL` int(11) NOT NULL AUTO_INCREMENT,
  `CD_SISTEMA` int(11) DEFAULT NULL,
  `NM_PERFIL` varchar(200) DEFAULT NULL,
  `OBS_PERFIL` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`CD_PERFIL`),
  KEY `FK_RELATIONSHIP_8` (`CD_SISTEMA`),
  CONSTRAINT `FK_RELATIONSHIP_8` FOREIGN KEY (`CD_SISTEMA`) REFERENCES `sistemas` (`CD_SISTEMA`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perfiles`
--

LOCK TABLES `perfiles` WRITE;
/*!40000 ALTER TABLE `perfiles` DISABLE KEYS */;
INSERT INTO `perfiles` VALUES (1,1,'Administrador','Administrador'),(2,1,'Supervisor','Supervisor'),(3,1,'Vendedor','Vendedor');
/*!40000 ALTER TABLE `perfiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sistemas`
--

DROP TABLE IF EXISTS `sistemas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sistemas` (
  `CD_SISTEMA` int(11) NOT NULL AUTO_INCREMENT,
  `NM_SISTEMA` longtext,
  `OBS_SISTEMA` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`CD_SISTEMA`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sistemas`
--

LOCK TABLES `sistemas` WRITE;
/*!40000 ALTER TABLE `sistemas` DISABLE KEYS */;
INSERT INTO `sistemas` VALUES (1,'Gestion Drabejas','Gesti├│n de consultorios Doctoras abejas');
/*!40000 ALTER TABLE `sistemas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_perfiles`
--

DROP TABLE IF EXISTS `usuario_perfiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario_perfiles` (
  `CD_USUARIO_PERFIL` int(11) NOT NULL AUTO_INCREMENT,
  `CD_PERFIL` int(11) NOT NULL,
  `CD_USUARIO` int(11) NOT NULL,
  PRIMARY KEY (`CD_USUARIO_PERFIL`),
  KEY `FK_RELATIONSHIP_6` (`CD_PERFIL`),
  KEY `FK_RELATIONSHIP_7` (`CD_USUARIO`),
  CONSTRAINT `FK_RELATIONSHIP_6` FOREIGN KEY (`CD_PERFIL`) REFERENCES `perfiles` (`CD_PERFIL`),
  CONSTRAINT `FK_RELATIONSHIP_7` FOREIGN KEY (`CD_USUARIO`) REFERENCES `usuarios` (`CD_USUARIO`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_perfiles`
--

LOCK TABLES `usuario_perfiles` WRITE;
/*!40000 ALTER TABLE `usuario_perfiles` DISABLE KEYS */;
INSERT INTO `usuario_perfiles` VALUES (1,1,1),(2,3,2);
/*!40000 ALTER TABLE `usuario_perfiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `CD_USUARIO` int(11) NOT NULL AUTO_INCREMENT,
  `NM_USUARIO` varchar(200) DEFAULT NULL,
  `LOGIN_USUARIO` varchar(50) DEFAULT NULL,
  `CLAVE_USUARIO` varchar(200) DEFAULT NULL,
  `EMAIL_USUARIO` varchar(200) DEFAULT NULL,
  `OBS_USUARIO` varchar(200) DEFAULT NULL,
  `ES_USUARIO_ADMIN` smallint(6) NOT NULL,
  `VER_INFO_SENSIBLE` smallint(6) NOT NULL,
  `ESTA_ACTIVO` smallint(6) NOT NULL,
  PRIMARY KEY (`CD_USUARIO`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'Veronica Tapia','vtapia','d4df872bd79e3cfadc89cc52268d7117',NULL,'null',-1,1,1),(2,'Usuario Prueba','vprueba','25d55ad283aa400af464c76d713c07ad',NULL,'null',-1,-1,1);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-01-10 12:29:00
