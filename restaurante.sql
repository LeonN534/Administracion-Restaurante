-- MariaDB dump 10.19-11.2.2-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: Restaurante
-- ------------------------------------------------------
-- Server version	11.2.2-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Cartas`
--

DROP TABLE IF EXISTS `Cartas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cartas` (
  `idCartas` int(11) NOT NULL AUTO_INCREMENT,
  `Dia` varchar(45) DEFAULT NULL,
  `IdPlatos` int(11) DEFAULT NULL,
  PRIMARY KEY (`idCartas`),
  KEY `IdPlatos_idx` (`IdPlatos`),
  CONSTRAINT `IdPlatos` FOREIGN KEY (`IdPlatos`) REFERENCES `Platos` (`IdPlato`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cartas`
--

LOCK TABLES `Cartas` WRITE;
/*!40000 ALTER TABLE `Cartas` DISABLE KEYS */;
INSERT INTO `Cartas` VALUES
(1,'Lunes',3),
(2,'Lunes',1),
(3,'Lunes',2),
(4,'Lunes',3);
/*!40000 ALTER TABLE `Cartas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Categorias`
--

DROP TABLE IF EXISTS `Categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Categorias` (
  `NombreCat` varchar(20) NOT NULL,
  `DescripcionCategoria` varchar(200) NOT NULL,
  `Encargado` varchar(45) NOT NULL,
  PRIMARY KEY (`NombreCat`),
  UNIQUE KEY `NombreCat_UNIQUE` (`NombreCat`),
  UNIQUE KEY `Encargado_UNIQUE` (`Encargado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Categorias`
--

LOCK TABLES `Categorias` WRITE;
/*!40000 ALTER TABLE `Categorias` DISABLE KEYS */;
INSERT INTO `Categorias` VALUES
('Ensalada','Plato que combina hortalizas frías y varias verduras cortadas, mezcladas y aderezadas','Sandro Pascal'),
('Guarnición','Pato de acompañamiento','Pedro Zapata'),
('Plato Fuerte','Plato principal, o que más alimenta y satisface, de una comida','Miguel Rivera'),
('Postre','Plato de sabor dulce o salado que se toma al final de la comida','Franco Espinoza'),
('Snack','Alimento ligero para satisfacer mínimamente el hambre','Miguel de la Torre'),
('Sopas y Caldos','Preparación culinaria que consiste en un caldo alimenticio y uno o más ingredientes sólidos','Eduardo Gómez');
/*!40000 ALTER TABLE `Categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cliente`
--

DROP TABLE IF EXISTS `Cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cliente` (
  `idCliente` int(11) NOT NULL,
  `Nombres` varchar(45) DEFAULT NULL,
  `Apellidos` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cliente`
--

LOCK TABLES `Cliente` WRITE;
/*!40000 ALTER TABLE `Cliente` DISABLE KEYS */;
INSERT INTO `Cliente` VALUES
(73022123,'Miguel','Albornoz');
/*!40000 ALTER TABLE `Cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Platos`
--

DROP TABLE IF EXISTS `Platos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Platos` (
  `IdPlato` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) NOT NULL,
  `DescripcionPlato` varchar(200) NOT NULL,
  `Dificultad` varchar(8) NOT NULL,
  `Precio` varchar(6) NOT NULL,
  `Archivo` varchar(150) DEFAULT NULL,
  `Categoria` varchar(20) NOT NULL,
  PRIMARY KEY (`IdPlato`),
  UNIQUE KEY `Nombre_UNIQUE` (`Nombre`),
  UNIQUE KEY `Imagen_UNIQUE` (`Archivo`),
  KEY `Categoria_idx` (`Categoria`),
  CONSTRAINT `Categoria` FOREIGN KEY (`Categoria`) REFERENCES `Categorias` (`NombreCat`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Platos`
--

LOCK TABLES `Platos` WRITE;
/*!40000 ALTER TABLE `Platos` DISABLE KEYS */;
INSERT INTO `Platos` VALUES
(1,'Suspiro a la Limeña','La base de su elaboración es un manjar de yemas (inspirado en el manjar blanco) acompañado de un merengue italiano. ','Facil','7.0','suspiro-a-la-limeña','Postre'),
(2,'plato2','platosdfas','Media','7','tarjeta-de-video-gigabyte-rtx-3060-eagle-oc-12gb-gv-n3060eagle-oc-12gd-gddr6-192-bit_1_','Postre'),
(3,'pato','adsfasdf','Media','5','Untitled','Plato Fuerte'),
(4,'adfasdf','asdfasdf','Media','4','pc-gamer-draco-black-blue-core-i7-12700f-12th','Guarnición'),
(7,'nombrePlato','plato','Alta','8','restaurante','Guarnición');
/*!40000 ALTER TABLE `Platos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Recetas`
--

DROP TABLE IF EXISTS `Recetas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Recetas` (
  `idRecetas` int(11) NOT NULL AUTO_INCREMENT,
  `Plato` varchar(45) DEFAULT NULL,
  `Ingrediente` varchar(45) DEFAULT NULL,
  `Unidad_Medida` varchar(45) DEFAULT NULL,
  `Cantidad` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idRecetas`),
  UNIQUE KEY `idRecetas_UNIQUE` (`idRecetas`),
  KEY `Plato_idx` (`Plato`),
  CONSTRAINT `Plato` FOREIGN KEY (`Plato`) REFERENCES `Platos` (`Nombre`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Recetas`
--

LOCK TABLES `Recetas` WRITE;
/*!40000 ALTER TABLE `Recetas` DISABLE KEYS */;
INSERT INTO `Recetas` VALUES
(1,'Suspiro a la Limeña','Leche evaporada','Taza','2'),
(2,'Suspiro a la Limeña','Leche condensada','Taza','2'),
(3,'Suspiro a la Limeña','Canela','Rama','2'),
(4,'Suspiro a la Limeña','Yema de huevo','Unidad','5'),
(5,'Suspiro a la Limeña','Clara de huevo','Unidad','3'),
(6,'Suspiro a la Limeña','Esencia de vainilla','Cucharadita','1'),
(7,'Suspiro a la Limeña','Azúcar blanca','Taza','1'),
(8,'Suspiro a la Limeña','Oporto','Taza','1/4'),
(9,'Suspiro a la Limeña','Canela en polvo','Cucharadita','1'),
(10,'adfasdf','asdfasd','asdfasd','asdf'),
(11,'adfasdf',' asdfasd',' asdf','3'),
(12,'nombrePlato','nuevo','x','3'),
(13,'nombrePlato','Yema de huevo','unidad','7');
/*!40000 ALTER TABLE `Recetas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Ventas`
--

DROP TABLE IF EXISTS `Ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Ventas` (
  `idVentas` int(11) NOT NULL AUTO_INCREMENT,
  `serieVenta` int(11) DEFAULT NULL,
  `idCliente` int(11) DEFAULT NULL,
  `fechaVenta` date DEFAULT NULL,
  `horaVenta` time DEFAULT NULL,
  `idPlato` int(11) DEFAULT NULL,
  `precio` varchar(6) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `importe` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`idVentas`),
  KEY `idPlato_idx` (`idPlato`),
  KEY `idCliente_idx` (`idCliente`),
  CONSTRAINT `idCliente` FOREIGN KEY (`idCliente`) REFERENCES `Cliente` (`idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `idPlato` FOREIGN KEY (`idPlato`) REFERENCES `Platos` (`IdPlato`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Ventas`
--

LOCK TABLES `Ventas` WRITE;
/*!40000 ALTER TABLE `Ventas` DISABLE KEYS */;
INSERT INTO `Ventas` VALUES
(1,1,73022123,'2023-11-27','23:39:35',1,'7.0',3,'60'),
(2,1,73022123,'2023-11-27','23:39:35',1,'7.0',4,'60'),
(3,2,73022123,'2023-11-27','23:41:11',1,'7.0',3,'68'),
(4,3,73022123,'2023-12-04','21:43:37',3,'5',5,'90'),
(5,3,73022123,'2023-12-04','21:43:37',1,'7.0',3,'90'),
(6,3,73022123,'2023-12-04','21:43:37',4,'4',8,'90'),
(7,4,73022123,'2023-12-04','21:47:06',3,'5',7,'90'),
(8,4,73022123,'2023-12-04','21:47:06',2,'7',3,'90'),
(9,4,73022123,'2023-12-04','21:47:06',1,'7.0',4,'90'),
(10,5,73022123,'2023-12-04','21:50:38',3,'5',4,'700'),
(11,5,73022123,'2023-12-04','21:50:38',2,'7',9,'700'),
(12,6,73022123,'2023-12-04','21:51:39',3,'5',5,'700'),
(13,6,73022123,'2023-12-04','21:51:39',2,'7',7,'700'),
(14,7,73022123,'2023-12-06','10:36:39',7,'8',4,'90'),
(15,7,73022123,'2023-12-06','10:36:39',2,'7',3,'90'),
(16,8,73022123,'2023-12-06','10:37:34',7,'8',3,'67'),
(17,8,73022123,'2023-12-06','10:37:34',1,'7.0',2,'67'),
(18,8,73022123,'2023-12-06','10:37:34',4,'4',1,'67'),
(19,9,73022123,'2023-12-06','12:13:46',7,'8',54,'900'),
(20,9,73022123,'2023-12-06','12:13:46',2,'7',56,'900'),
(21,10,73022123,'2023-12-06','12:16:04',7,'8',2,'30'),
(22,10,73022123,'2023-12-06','12:16:04',1,'7.0',1,'30');
/*!40000 ALTER TABLE `Ventas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-17  2:00:18
