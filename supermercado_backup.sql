-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: supermercado
-- ------------------------------------------------------
-- Server version	8.0.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `Cod_cliente` int NOT NULL,
  `Nombre` varchar(30) DEFAULT NULL,
  `Direccion` varchar(50) DEFAULT NULL,
  `Telefono` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`Cod_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_pedido`
--

DROP TABLE IF EXISTS `detalle_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_pedido` (
  `Producto_Cod_producto` int NOT NULL,
  `Pedido_Numero_pedido` int NOT NULL,
  `Cantidad` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Producto_Cod_producto`,`Pedido_Numero_pedido`),
  KEY `fk_Producto_has_Pedido_Pedido1_idx` (`Pedido_Numero_pedido`),
  KEY `fk_Producto_has_Pedido_Producto1_idx` (`Producto_Cod_producto`),
  CONSTRAINT `fk_Producto_has_Pedido_Pedido1` FOREIGN KEY (`Pedido_Numero_pedido`) REFERENCES `pedidos`.`pedido` (`Numero_pedido`),
  CONSTRAINT `fk_Producto_has_Pedido_Producto1` FOREIGN KEY (`Producto_Cod_producto`) REFERENCES `pedidos`.`producto` (`Cod_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_pedido`
--

LOCK TABLES `detalle_pedido` WRITE;
/*!40000 ALTER TABLE `detalle_pedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleado` (
  `Cod_empleado` int NOT NULL,
  `Nombres` varchar(30) DEFAULT NULL,
  `Apellidos` varchar(30) DEFAULT NULL,
  `Sexo` varchar(1) DEFAULT NULL,
  `Fechanacimiento` date DEFAULT NULL,
  `SueldoBase` decimal(8,2) DEFAULT NULL,
  PRIMARY KEY (`Cod_empleado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ganancias`
--

DROP TABLE IF EXISTS `ganancias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ganancias` (
  `idreg` int NOT NULL AUTO_INCREMENT,
  `fecha` datetime DEFAULT NULL,
  `ganancia` decimal(7,2) DEFAULT NULL,
  PRIMARY KEY (`idreg`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ganancias`
--

LOCK TABLES `ganancias` WRITE;
/*!40000 ALTER TABLE `ganancias` DISABLE KEYS */;
INSERT INTO `ganancias` VALUES (1,'2023-03-27 00:00:00',NULL);
INSERT INTO `ganancias` VALUES (2,'2023-03-29 00:00:00',NULL);
INSERT INTO `ganancias` VALUES (3,'2023-03-30 00:00:00',NULL);
INSERT INTO `ganancias` VALUES (4,'2023-03-31 00:00:00',NULL);
INSERT INTO `ganancias` VALUES (5,'2023-04-02 00:00:00',NULL);
INSERT INTO `ganancias` VALUES (6,'2023-04-03 00:00:00',NULL);
/*!40000 ALTER TABLE `ganancias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido` (
  `Numero_pedido` int NOT NULL,
  `Fechapedido` date DEFAULT NULL,
  `Fechaentrega` date DEFAULT NULL,
  `Estatus` varchar(20) DEFAULT NULL,
  `PrecioTotal` decimal(7,2) DEFAULT NULL,
  `Cliente_Cod_cliente` int NOT NULL,
  `Empleado_Cod_empleado` int NOT NULL,
  PRIMARY KEY (`Numero_pedido`),
  KEY `fk_Pedido_Cliente_idx` (`Cliente_Cod_cliente`),
  KEY `fk_Pedido_Empleado1_idx` (`Empleado_Cod_empleado`),
  CONSTRAINT `fk_Pedido_Cliente` FOREIGN KEY (`Cliente_Cod_cliente`) REFERENCES `pedidos`.`cliente` (`Cod_cliente`),
  CONSTRAINT `fk_Pedido_Empleado1` FOREIGN KEY (`Empleado_Cod_empleado`) REFERENCES `pedidos`.`empleado` (`Cod_empleado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` VALUES (1,'2023-05-25','2023-05-29','En Progreso',1000.00,1,2);
INSERT INTO `pedido` VALUES (3,'2023-03-26','2023-05-29','En Progreso',1000.00,1,2);
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `Cod_producto` int NOT NULL,
  `Descripcion_pro` varchar(50) DEFAULT NULL,
  `Precio` decimal(8,2) DEFAULT NULL,
  `Existencia` int DEFAULT NULL,
  PRIMARY KEY (`Cod_producto`),
  UNIQUE KEY `codproducto_index` (`Cod_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-03 21:05:11
