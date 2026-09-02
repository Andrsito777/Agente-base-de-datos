-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: crm_ganadero
-- ------------------------------------------------------
-- Server version	8.0.37

CREATE DATABASE IF NOT EXISTS crm_ganadero;
USE crm_ganadero;

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
-- Table structure for table `alertas_reproduccion`
--

DROP TABLE IF EXISTS `alertas_reproduccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alertas_reproduccion` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ganado_id` int NOT NULL,
  `tipo_evento` enum('Celo','Inseminación','Confirmación Preñez','Parto Probable') NOT NULL,
  `fecha_evento` date NOT NULL,
  `observaciones` varchar(255) DEFAULT NULL,
  `atendida` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ganado_id` (`ganado_id`),
  CONSTRAINT `alertas_reproduccion_ibfk_1` FOREIGN KEY (`ganado_id`) REFERENCES `ganado` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alertas_reproduccion`
--

LOCK TABLES `alertas_reproduccion` WRITE;
/*!40000 ALTER TABLE `alertas_reproduccion` DISABLE KEYS */;
INSERT INTO `alertas_reproduccion` VALUES (1,1,'Celo','2026-05-02','Se detectaron signos de celo durante la revisión.',1),(2,2,'Inseminación','2026-05-08','Inseminación artificial realizada correctamente.',1),(3,3,'Confirmación Preñez','2026-05-20','Diagnóstico positivo mediante palpación.',1),(4,4,'Parto Probable','2026-06-15','Fecha estimada de parto según control reproductivo.',0),(5,5,'Celo','2026-06-03','Animal presenta comportamiento reproductivo normal.',1),(6,6,'Inseminación','2026-06-10','Se realizó inseminación artificial después de detectar celo.',1),(7,7,'Confirmación Preñez','2026-06-25','Preñez confirmada por evaluación veterinaria.',0),(8,8,'Parto Probable','2026-07-12','Se aproxima la fecha estimada de parto.',0),(9,9,'Celo','2026-07-05','Se recomienda seguimiento para próxima inseminación.',0),(10,10,'Parto Probable','2026-08-01','Animal en etapa final de gestación.',0);
/*!40000 ALTER TABLE `alertas_reproduccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auditoria_ganado`
--

DROP TABLE IF EXISTS `auditoria_ganado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auditoria_ganado` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ganado_id` int DEFAULT NULL,
  `accion` varchar(50) DEFAULT NULL,
  `peso_anterior` decimal(6,2) DEFAULT NULL,
  `peso_nuevo` decimal(6,2) DEFAULT NULL,
  `usuario` varchar(100) DEFAULT (current_user()),
  `fecha_cambio` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_auditoria_ganado` (`ganado_id`),
  CONSTRAINT `fk_auditoria_ganado` FOREIGN KEY (`ganado_id`) REFERENCES `ganado` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditoria_ganado`
--

LOCK TABLES `auditoria_ganado` WRITE;
/*!40000 ALTER TABLE `auditoria_ganado` DISABLE KEYS */;
INSERT INTO `auditoria_ganado` VALUES (1,1,'Actualización de peso',465.00,480.00,'admin','2026-08-26 21:14:22'),(2,2,'Actualización de peso',495.50,510.50,'admin','2026-08-26 21:14:22'),(3,3,'Actualización de peso',435.20,450.20,'veterinario','2026-08-26 21:14:22'),(4,4,'Actualización de peso',520.00,535.00,'admin','2026-08-26 21:14:22'),(5,5,'Actualización de peso',480.30,495.30,'operador','2026-08-26 21:14:22'),(6,6,'Actualización de peso',505.80,520.80,'veterinario','2026-08-26 21:14:22'),(7,7,'Actualización de peso',425.00,440.00,'admin','2026-08-26 21:14:22'),(8,8,'Actualización de peso',513.40,528.40,'operador','2026-08-26 21:14:22'),(9,9,'Actualización de peso',487.60,502.60,'veterinario','2026-08-26 21:14:22'),(10,10,'Actualización de peso',450.75,465.75,'admin','2026-08-26 21:14:22');
/*!40000 ALTER TABLE `auditoria_ganado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `tipo_cliente` enum('Mayorista','Distribuidor','Minorista') NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `fecha_registro` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Carlos Martínez','Mayorista','3001234567','carlos.martinez@email.com','Carrera 15 # 82-30, Bogotá','2026-08-26 21:11:19'),(2,'Laura Gómez','Minorista','3102345678','laura.gomez@email.com','Calle 45 # 12-18, Medellín','2026-08-26 21:11:19'),(3,'Distribuciones El Sol','Distribuidor','3153456789','contacto@elsol.com','Carrera 7 # 24-15, Cali','2026-08-26 21:11:19'),(4,'Andrés Rodríguez','Minorista','3204567890','andres.rodriguez@email.com','Calle 10 # 5-22, Bogotá','2026-08-26 21:11:19'),(5,'Comercializadora ABC','Mayorista','3015678901','ventas@comercializadoraabc.com','Carrera 30 # 18-45, Barranquilla','2026-08-26 21:11:19'),(6,'María Fernández','Minorista','3126789012','maria.fernandez@email.com','Calle 52 # 20-10, Bucaramanga','2026-08-26 21:11:19'),(7,'Distribuciones Nacionales','Distribuidor','3187890123','info@disnacionales.com','Carrera 40 # 60-25, Bogotá','2026-08-26 21:11:19'),(8,'Juan Pérez','Minorista','3058901234','juan.perez@email.com','Calle 80 # 25-16, Pereira','2026-08-26 21:11:19'),(9,'Grupo Comercial Andino','Mayorista','3169012345','contacto@grupoandino.com','Carrera 12 # 35-40, Bogotá','2026-08-26 21:11:19'),(10,'Suministros La 14','Distribuidor','3190123456','ventas@suministrosla14.com','Calle 14 # 8-32, Cartagena','2026-08-26 21:11:19');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fincas`
--

DROP TABLE IF EXISTS `fincas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fincas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `ubicacion` varchar(150) NOT NULL,
  `hectareas` decimal(10,2) NOT NULL,
  `fecha_registro` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  CONSTRAINT `fincas_chk_1` CHECK ((`hectareas` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fincas`
--

LOCK TABLES `fincas` WRITE;
/*!40000 ALTER TABLE `fincas` DISABLE KEYS */;
INSERT INTO `fincas` VALUES (1,'napoles','doradal',32.00,'2022-07-23 05:00:00'),(2,'Shalom','Cucuta',257.00,'2000-08-12 05:00:00'),(3,'Inka','Chinacota',59.00,'2021-12-12 05:00:00'),(4,'Iscala','Chinacota',359.00,'2021-12-12 05:00:00'),(5,'Roka','Chinacota',9.00,'2021-12-12 05:00:00'),(6,'Roka','Chinacota',9.00,'2011-09-11 05:00:00'),(7,'Stella','Milano',900.00,'1998-07-21 05:00:00'),(8,'manuela','guatape',234.00,'2018-04-12 05:00:00'),(9,'diamante','palmilla',340.00,'2014-08-30 05:00:00'),(10,'chochecos','zulia',214.00,'2025-01-23 05:00:00');
/*!40000 ALTER TABLE `fincas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ganado`
--

DROP TABLE IF EXISTS `ganado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ganado` (
  `id` int NOT NULL AUTO_INCREMENT,
  `arete_identificador` varchar(50) NOT NULL,
  `especie` enum('Bovino','Porcino','Caprino','Ovino') DEFAULT 'Bovino',
  `raza` varchar(50) NOT NULL,
  `sexo` enum('Macho','Hembra') NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `peso_actual` decimal(6,2) NOT NULL,
  `estado` enum('Activo','Vendido','Fallecido') DEFAULT 'Activo',
  `finca_id` int DEFAULT NULL,
  `padre_id` int DEFAULT NULL,
  `madre_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `arete_identificador` (`arete_identificador`),
  KEY `finca_id` (`finca_id`),
  KEY `padre_id` (`padre_id`),
  KEY `madre_id` (`madre_id`),
  CONSTRAINT `ganado_ibfk_1` FOREIGN KEY (`finca_id`) REFERENCES `fincas` (`id`) ON DELETE SET NULL,
  CONSTRAINT `ganado_ibfk_2` FOREIGN KEY (`padre_id`) REFERENCES `ganado` (`id`) ON DELETE SET NULL,
  CONSTRAINT `ganado_ibfk_3` FOREIGN KEY (`madre_id`) REFERENCES `ganado` (`id`) ON DELETE SET NULL,
  CONSTRAINT `ganado_chk_1` CHECK ((`peso_actual` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ganado`
--

LOCK TABLES `ganado` WRITE;
/*!40000 ALTER TABLE `ganado` DISABLE KEYS */;
INSERT INTO `ganado` VALUES (1,'BOV-001','Bovino','Holstein','Hembra','2022-03-15',480.00,'Activo',1,NULL,NULL),(2,'BOV-002','Bovino','Jersey','Hembra','2021-07-20',510.50,'Activo',1,NULL,NULL),(3,'BOV-003','Bovino','Angus','Macho','2023-01-10',450.20,'Activo',2,NULL,NULL),(4,'BOV-004','Bovino','Normando','Hembra','2022-05-18',535.00,'Activo',2,3,1),(5,'BOV-005','Bovino','Cebú','Macho','2021-11-25',495.30,'Vendido',3,NULL,NULL),(6,'BOV-006','Bovino','Holstein','Hembra','2023-02-14',520.80,'Activo',3,3,2),(7,'BOV-007','Bovino','Jersey','Hembra','2022-09-05',440.00,'Activo',4,3,1),(8,'BOV-008','Bovino','Angus','Macho','2021-12-30',528.40,'Activo',4,NULL,NULL),(9,'BOV-009','Bovino','Normando','Hembra','2023-04-22',502.60,'Activo',5,8,4),(10,'BOV-010','Bovino','Cebú','Macho','2022-08-11',465.75,'Fallecido',5,3,6);
/*!40000 ALTER TABLE `ganado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historial_medico`
--

DROP TABLE IF EXISTS `historial_medico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historial_medico` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ganado_id` int NOT NULL,
  `fecha_tratamiento` date NOT NULL,
  `tipo` enum('Vacunación','Desparasitación','Enfermedad','Cirugía') NOT NULL,
  `descripcion` text NOT NULL,
  `costo` decimal(10,2) DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `ganado_id` (`ganado_id`),
  CONSTRAINT `historial_medico_ibfk_1` FOREIGN KEY (`ganado_id`) REFERENCES `ganado` (`id`) ON DELETE CASCADE,
  CONSTRAINT `historial_medico_chk_1` CHECK ((`costo` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historial_medico`
--

LOCK TABLES `historial_medico` WRITE;
/*!40000 ALTER TABLE `historial_medico` DISABLE KEYS */;
INSERT INTO `historial_medico` VALUES (11,1,'2026-01-15','Vacunación','Aplicación de vacuna contra fiebre aftosa.',45000.00),(12,2,'2026-01-20','Desparasitación','Desparasitación interna y externa del animal.',35000.00),(13,3,'2026-02-05','Enfermedad','Tratamiento por infección respiratoria leve.',85000.00),(14,4,'2026-02-12','Vacunación','Refuerzo de vacuna contra enfermedades clostridiales.',50000.00),(15,5,'2026-02-25','Desparasitación','Aplicación de antiparasitario de amplio espectro.',40000.00),(16,6,'2026-03-03','Enfermedad','Tratamiento por cuadro digestivo y deshidratación.',95000.00),(17,7,'2026-03-10','Cirugía','Procedimiento quirúrgico menor por lesión en la extremidad.',320000.00),(18,8,'2026-03-18','Vacunación','Vacunación preventiva y aplicación de refuerzo.',45000.00),(19,9,'2026-04-02','Desparasitación','Desparasitación preventiva según programa sanitario.',38000.00),(20,10,'2026-04-15','Enfermedad','Tratamiento veterinario por infección ocular.',70000.00);
/*!40000 ALTER TABLE `historial_medico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventario_insumos`
--

DROP TABLE IF EXISTS `inventario_insumos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventario_insumos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `tipo` enum('Alimento','Medicamento','Suplemento') NOT NULL,
  `stock_actual` decimal(10,2) NOT NULL,
  `stock_minimo` decimal(10,2) NOT NULL DEFAULT '50.00',
  `unidad_medida` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `inventario_insumos_chk_1` CHECK ((`stock_actual` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventario_insumos`
--

LOCK TABLES `inventario_insumos` WRITE;
/*!40000 ALTER TABLE `inventario_insumos` DISABLE KEYS */;
INSERT INTO `inventario_insumos` VALUES (1,'Concentrado para ganado','Alimento',850.00,100.00,'kg'),(2,'Heno de pasto','Alimento',1200.00,200.00,'kg'),(3,'Sal mineralizada','Suplemento',150.00,30.00,'kg'),(4,'Melaza','Suplemento',300.00,50.00,'litros'),(5,'Antibiótico veterinario','Medicamento',25.00,10.00,'unidades'),(6,'Vitaminas A-D-E','Suplemento',40.00,10.00,'litros'),(7,'Desparasitante bovino','Medicamento',35.00,10.00,'litros'),(8,'Ensilaje de maíz','Alimento',950.00,150.00,'kg'),(9,'Calcio inyectable','Medicamento',20.00,5.00,'litros'),(10,'Bloques nutricionales','Suplemento',75.00,15.00,'unidades');
/*!40000 ALTER TABLE `inventario_insumos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `observaciones_ganado_finca`
--

DROP TABLE IF EXISTS `observaciones_ganado_finca`;
/*!50001 DROP VIEW IF EXISTS `observaciones_ganado_finca`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `observaciones_ganado_finca` AS SELECT 
 1 AS `id`,
 1 AS `arete_identificador`,
 1 AS `especie`,
 1 AS `raza`,
 1 AS `nombre`,
 1 AS `observaciones`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `precios_historial_medico`
--

DROP TABLE IF EXISTS `precios_historial_medico`;
/*!50001 DROP VIEW IF EXISTS `precios_historial_medico`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `precios_historial_medico` AS SELECT 
 1 AS `tipo`,
 1 AS `descripcion`,
 1 AS `costo`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `produccion`
--

DROP TABLE IF EXISTS `produccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produccion` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ganado_id` int NOT NULL,
  `fecha` date NOT NULL,
  `litros_leche` decimal(5,2) DEFAULT '0.00',
  `peso_ganado_kg` decimal(6,2) DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `ganado_id` (`ganado_id`),
  CONSTRAINT `produccion_ibfk_1` FOREIGN KEY (`ganado_id`) REFERENCES `ganado` (`id`) ON DELETE CASCADE,
  CONSTRAINT `produccion_chk_1` CHECK ((`litros_leche` >= 0)),
  CONSTRAINT `produccion_chk_2` CHECK ((`peso_ganado_kg` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produccion`
--

LOCK TABLES `produccion` WRITE;
/*!40000 ALTER TABLE `produccion` DISABLE KEYS */;
INSERT INTO `produccion` VALUES (1,1,'2026-08-01',18.50,480.00),(2,2,'2026-08-02',21.30,510.50),(3,3,'2026-08-03',16.80,450.20),(4,4,'2026-08-04',24.10,535.00),(5,5,'2026-08-05',19.75,495.30),(6,6,'2026-08-06',22.40,520.80),(7,7,'2026-08-07',15.60,440.00),(8,8,'2026-08-08',23.25,528.40),(9,9,'2026-08-09',20.10,502.60),(10,10,'2026-08-10',17.90,465.75);
/*!40000 ALTER TABLE `produccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `prueba_clientes_ventas`
--

DROP TABLE IF EXISTS `prueba_clientes_ventas`;
/*!50001 DROP VIEW IF EXISTS `prueba_clientes_ventas`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `prueba_clientes_ventas` AS SELECT 
 1 AS `arete_identificador`,
 1 AS `especie`,
 1 AS `raza`,
 1 AS `sexo`,
 1 AS `fecha_nacimiento`,
 1 AS `fecha`,
 1 AS `litros_leche`,
 1 AS `cliente_id`,
 1 AS `fecha_venta`,
 1 AS `precio_total`,
 1 AS `metodo_pago`,
 1 AS `nombre`,
 1 AS `fecha_registro`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `ventas`
--

DROP TABLE IF EXISTS `ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cliente_id` int NOT NULL,
  `ganado_id` int NOT NULL,
  `fecha_venta` date NOT NULL,
  `precio_total` decimal(10,2) NOT NULL,
  `metodo_pago` enum('Efectivo','Transferencia','Crédito') NOT NULL,
  `estado_pago` enum('Pendiente','Pagado') DEFAULT 'Pendiente',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ganado_id` (`ganado_id`),
  KEY `cliente_id` (`cliente_id`),
  CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `ventas_ibfk_2` FOREIGN KEY (`ganado_id`) REFERENCES `ganado` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `ventas_chk_1` CHECK ((`precio_total` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas`
--

LOCK TABLES `ventas` WRITE;
/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
INSERT INTO `ventas` VALUES (1,1,1,'2026-08-05',4850000.00,'Transferencia','Pagado'),(2,2,2,'2026-08-07',5200000.00,'Efectivo','Pagado'),(3,3,3,'2026-08-09',4500000.00,'Crédito','Pendiente'),(4,4,4,'2026-08-11',5700000.00,'Transferencia','Pagado'),(5,5,5,'2026-08-13',4950000.00,'Crédito','Pendiente'),(6,6,6,'2026-08-15',5400000.00,'Efectivo','Pagado'),(7,7,7,'2026-08-17',4300000.00,'Transferencia','Pagado'),(8,8,8,'2026-08-19',5600000.00,'Crédito','Pendiente'),(9,9,9,'2026-08-21',5100000.00,'Efectivo','Pagado'),(10,10,10,'2026-08-23',4700000.00,'Transferencia','Pagado');
/*!40000 ALTER TABLE `ventas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vista_alertas_activas`
--

DROP TABLE IF EXISTS `vista_alertas_activas`;
/*!50001 DROP VIEW IF EXISTS `vista_alertas_activas`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_alertas_activas` AS SELECT 
 1 AS `tipo_evento`,
 1 AS `fecha_evento`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_suplementos`
--

DROP TABLE IF EXISTS `vista_suplementos`;
/*!50001 DROP VIEW IF EXISTS `vista_suplementos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_suplementos` AS SELECT 
 1 AS `nombre`,
 1 AS `stock_actual`,
 1 AS `unidad_medida`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `observaciones_ganado_finca`
--

/*!50001 DROP VIEW IF EXISTS `observaciones_ganado_finca`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `observaciones_ganado_finca` AS select `g`.`id` AS `id`,`g`.`arete_identificador` AS `arete_identificador`,`g`.`especie` AS `especie`,`g`.`raza` AS `raza`,`f`.`nombre` AS `nombre`,`ar`.`observaciones` AS `observaciones` from ((`ganado` `g` join `fincas` `f`) join `alertas_reproduccion` `ar`) where ((`f`.`id` = `g`.`finca_id`) = `ar`.`ganado_id`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `precios_historial_medico`
--

/*!50001 DROP VIEW IF EXISTS `precios_historial_medico`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `precios_historial_medico` AS select `historial_medico`.`tipo` AS `tipo`,`historial_medico`.`descripcion` AS `descripcion`,`historial_medico`.`costo` AS `costo` from `historial_medico` where (`historial_medico`.`costo` > 30000.00) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `prueba_clientes_ventas`
--

/*!50001 DROP VIEW IF EXISTS `prueba_clientes_ventas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `prueba_clientes_ventas` AS select `g`.`arete_identificador` AS `arete_identificador`,`g`.`especie` AS `especie`,`g`.`raza` AS `raza`,`g`.`sexo` AS `sexo`,`g`.`fecha_nacimiento` AS `fecha_nacimiento`,`p`.`fecha` AS `fecha`,`p`.`litros_leche` AS `litros_leche`,`v`.`cliente_id` AS `cliente_id`,`v`.`fecha_venta` AS `fecha_venta`,`v`.`precio_total` AS `precio_total`,`v`.`metodo_pago` AS `metodo_pago`,`c`.`nombre` AS `nombre`,`c`.`fecha_registro` AS `fecha_registro` from (((`ganado` `g` join `produccion` `p`) join `ventas` `v`) join `clientes` `c` on((((`g`.`id` = `v`.`ganado_id`) = `p`.`ganado_id`) and (`v`.`cliente_id` = `c`.`id`)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_alertas_activas`
--

/*!50001 DROP VIEW IF EXISTS `vista_alertas_activas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_alertas_activas` AS select `alertas_reproduccion`.`tipo_evento` AS `tipo_evento`,`alertas_reproduccion`.`fecha_evento` AS `fecha_evento` from `alertas_reproduccion` where (`alertas_reproduccion`.`atendida` = 0) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_suplementos`
--

/*!50001 DROP VIEW IF EXISTS `vista_suplementos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_suplementos` AS select `inventario_insumos`.`nombre` AS `nombre`,`inventario_insumos`.`stock_actual` AS `stock_actual`,`inventario_insumos`.`unidad_medida` AS `unidad_medida` from `inventario_insumos` where (`inventario_insumos`.`tipo` = 'Suplemento') */;
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

-- Dump completed on 2026-08-27 16:45:24
